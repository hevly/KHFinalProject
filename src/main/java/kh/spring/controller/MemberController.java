package kh.spring.controller;

import java.io.File;
import java.io.IOException;
import java.util.Properties;
import java.util.UUID;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import kh.spring.dto.KakaoProfile;
import kh.spring.dto.KakaoToken;
import kh.spring.dto.MemberDTO;
import kh.spring.service.MemberService;

@Controller
@RequestMapping("/member/")
public class MemberController {

	@Autowired
	public MemberService memberService;

	@Autowired
	private HttpSession session;

	// 이메일 체크
	@ResponseBody
	@RequestMapping(value = "emailCheck", produces = "application/text;charset=utf-8")
	public String emailChek(String email) {
		System.out.println("넘어온 일반회원가입 이메일값 : " + email);
		System.out.println("보내는 일반회원가입 이메일 확인값 : " + memberService.emailCheck(email));
		return String.valueOf(memberService.emailCheck(email));
	}

	// 닉네임 체크
	@ResponseBody
	@RequestMapping(value = "nickNameCheck", produces = "application/text;charset=utf-8")
	public String nickNameCheck(String nickName) {
		System.out.println("넘어온 일반회원가입 닉네임값 : " + nickName);
		System.out.println("보내는 일반회원가입 닉네임 확인값 : " + memberService.nickNameCheck(nickName));
		return String.valueOf(memberService.nickNameCheck(nickName));
	}

	// 휴대폰 체크
	@ResponseBody
	@RequestMapping(value = "phoneCheck", produces = "application/text;charset=utf-8")
	public String phoneCheck(String phone) {
		System.out.println("넘어온 일반회원가입 휴대폰값 : " + phone);
		System.out.println("보내는 일반회원가입 휴대폰 확인값 : " + memberService.phoneCheck(phone));
		return String.valueOf(memberService.phoneCheck(phone));
	}

	// 일반 회원가입&즉시 로그인
	@RequestMapping("normalSignup")
	public String normalSignup(String emailID, String nick, String phone, String pw, String gender) {
		memberService.normalSignup(emailID, nick, phone, pw, gender);
		System.out.println("회원가입 사용자 성별 : " + gender);
		MemberDTO dto = memberService.normalLoginSelectAll(emailID, pw);
		session.setAttribute("loginSeq", dto.getSeq());
		session.setAttribute("loginEmailID", dto.getEmailID());
		session.setAttribute("loginNick", dto.getNick());
		session.setAttribute("loginGender", dto.getGender());
		return "redirect:/";
	}

	// 일반 로그인
	@ResponseBody
	@RequestMapping(value = "normalLogin", produces = "application/text;charset=utf-8")
	public String normalLogin(String emailID, String pw) {
		System.out.println("넘어온 일반로그인 아이디 : " + emailID);
		System.out.println("넘어온 일반로그인 PW : " + pw);
		int result = memberService.normalLoginCheck(emailID, pw);
		System.out.println("로그인 조회 결과 : " + result);
		if (result == 0) {
			return "0";
		} else {
			MemberDTO dto = memberService.normalLoginSelectAll(emailID, pw);
			session.setAttribute("loginSeq", dto.getSeq());
			session.setAttribute("loginEmailID", dto.getEmailID());
			session.setAttribute("loginNick", dto.getNick());
			return "1";
		}
	}
	
	String findPwTargetEmail = "";
	// PW 찾기
	@ResponseBody
	@RequestMapping(value = "findPw", produces = "application/text;charset=utf-8")
	public String pwFindPopup (String emailID) throws AddressException, MessagingException {
		System.out.println("PW찾을 email : " + emailID);
		int result = memberService.emailCheck(emailID);
		if (result == 0) {
			return "0";
		}
		// 이메일 발송 시작
		findPwTargetEmail = emailID; // 받는사람의 이메일
		
		// 보내는 개발자?의 메일계정
		String user = "wlsrb2611@naver.com";
		String password = "";
		
		// SMTP 서버 정보 설정
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.naver.com");
		props.put("mail.smtp.port", 465);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.trust", "smtp.naver.com");
		
		// SMTP 서버정보랑 사용자등록해서 Session 인스턴스 생성
		Session mailSession = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});
		
		// Message 클래스로 수신자랑 내용 제목의 메세지 전달
		MimeMessage message = new MimeMessage(mailSession);
		message.setFrom(new InternetAddress(user));
		message.addRecipient(Message.RecipientType.TO, new InternetAddress(findPwTargetEmail));
		message.setSubject("TripMate PW찾기 인증번호입니다.");
		int verificationCode = (int) (Math.random() * (9999 - 1000)) + 1000;
		message.setText("TripMate PW찾기 인증번호는 : " + verificationCode + " 입니다.");
		Transport.send(message);
		return String.valueOf(verificationCode);
	}
	
	// PW찾기 후 비밀번호 변경
	@RequestMapping("findPwChange")
	public String findPwChange(String pw) {
		System.out.println("변경할 대상 이메일 : " + findPwTargetEmail);
		memberService.findPwChange(findPwTargetEmail, pw);
		return "redirect:/";
	}
	
	
	///////////// 카카오 로그인 시작 /////////////
	private final String CLIENT_ID = "b7b0a7f6722957ddef971b2ff4061bd7"; // REST ID
	private final String REDIRECT_URL = "http://localhost/member/kakaoLogin"; // 리퀘스트시킬 URL(나중엔 아이피로 변경 카카오 디벨로퍼에서도
																				// 변경해줘야함.)

	@ResponseBody
	@RequestMapping("getKakaoAuthUrl")
	public String getKakaoAuthUrl() { // 로그인 ajax동작시 오는곳(카카오 자체 서버에서 코드를 받아와야하기때문)
		String KaUrl = "https://kauth.kakao.com/oauth/authorize?client_id=" + CLIENT_ID + "&redirect_uri="
				+ REDIRECT_URL + "&response_type=code";
		return KaUrl; // 이러면 여기 코드가 왔겠지
	}

	@RequestMapping("kakaoLogin") // 서비스레이어로 뺄까 고민했지만 Http통신이 있어 컨트롤러에 있는게 맞을듯
	public String kakaoLogin(String code, String error) {
		System.out.println("반환된 카카오로그인 코드 : " + code);
		System.out.println("반환된 카카오로그인 에러코드 : " + error);
		if (error != null) { // 에러코드가 있다면 사용자가 무언가 취소를 한것.(null이 아닐때 전부 메인으로 보내버리면될수도)
			return "redirect:/";
//			if(error.equals("")) {
//				// 에러코드마다 다른 대비책을 세워야 한다면 필요
//			}
		}

		Gson gson = new Gson();
		// POST방식으로 key=value 데이터를 요청(카카오쪽으로)
		RestTemplate rt = new RestTemplate(); // 곧 지원중지될 API라 WebClient이걸 공부해야될듯
		
		// HttpHeader 오브젝트 생성
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8"); // 내가 보낼 데이터 타입이 key=value값이다

		// HttpBody 오브젝트 생성( POST방식은 Body에 담아 보내야 하니까 )
		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		params.add("grant_type", "authorization_code");
		params.add("client_id", CLIENT_ID);
		params.add("redirect_uri", REDIRECT_URL);
		params.add("code", code);

		// HttpHeader와 HttpBody를 하나의 오브젝트에 담기
		HttpEntity<MultiValueMap<String, String>> kakaoTokenRequest = new HttpEntity<>(params, headers);

		// Http 요청하기 - POST방식 - 그리고 response 변수응답받음.
		ResponseEntity<String> response = rt.exchange("https://kauth.kakao.com/oauth/token", HttpMethod.POST,
				kakaoTokenRequest, String.class);

		// json객체를 자바객체로 변환
		KakaoToken data = gson.fromJson(response.getBody(), KakaoToken.class);
		// 얻은 액세스 토큰
		System.out.println("얻어낸 액세스 토큰" + data.getAccess_token());

		/////// 액세스토큰을 이용해 유저정보 받기 //////
		RestTemplate rt2 = new RestTemplate();

		// HttpHeader2 오브젝트 생성
		HttpHeaders header2 = new HttpHeaders();
		header2.add("Authorization", "Bearer " + data.getAccess_token()); // 한칸 띄어야댐
		header2.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

		// HttpHeader 담기
		HttpEntity<MultiValueMap<String, String>> kakaoTokenRequest2 = new HttpEntity<>(header2);

		// Http 요청 POST방식
		ResponseEntity<String> response2 = rt2.exchange("https://kapi.kakao.com/v2/user/me", HttpMethod.POST,
				kakaoTokenRequest2, String.class);
		// 유저 정보 빼오기
		System.out.println("얻어낸 카카오 유저정보 : " + response2.getBody());

		// jsonpojo로 바꾸면 카멜케이스때문에 에러나는데 일일히 바꿔줬음. 근데 한번에 바꾸는거 있을듯.
		// 카카오 프로필정보 빼오는 코드(사용자가 동의 안해도 다빼옴;)
		KakaoProfile kProfile = gson.fromJson(response2.getBody(), KakaoProfile.class);
		// 이제 세션에 담아야됨 해당 이메일로 디비 조회 해보고, 등록된 사용자가 있다면 그걸 꺼내서 세션에 담고, 없다면
		// 회원가입처리시켜버리면되겠다.
		String kakaoLoginEmail = kProfile.kakao_account.email + "/kakao";
		String kakaoLoginNick = kProfile.properties.nickname;
		// 이메일 동의 거부했을 경우 id로 구분해야한다
		int kakaoLoginId = kProfile.id;
		
		int kakaoResult = memberService.kakaoLoginLookup(kakaoLoginId);
		if (kakaoResult == 1) { // 가입내역이 있다면 정보를 빼서 세션에 담고
			MemberDTO kakaoDto = memberService.kakaoLoginSelectAll(kakaoLoginId);
			session.setAttribute("loginSeq", kakaoDto.getSeq());
			session.setAttribute("loginEmailID", kakaoDto.getEmailID());
			session.setAttribute("loginNick", kakaoDto.getNick());
			session.setAttribute("loginKakaoID", kakaoDto.getSns_division());
		} else { // 가입내역이 없다면 회원가입을 시키고 이메일이랑 닉네임만 세션에 바로 담아버리면 될듯했는데 seq때문에 또 빼와야하네
			memberService.kakaoSignup(kakaoLoginEmail, kakaoLoginNick, kakaoLoginId);
			MemberDTO kakaoDto = memberService.kakaoLoginSelectAll(kakaoLoginId);
			session.setAttribute("loginSeq", kakaoDto.getSeq());
			session.setAttribute("loginEmailID", kakaoDto.getEmailID());
			session.setAttribute("loginNick", kakaoDto.getNick());
			session.setAttribute("loginKakaoID", kakaoDto.getSns_division());
		}

		System.out.println("로그인한 카카오 이메일 : " + kProfile.kakao_account.email);
		System.out.println("로그인한 카카오 id값 : " + kProfile.id);
		System.out.println("로그인한 카카오 닉네임 : " + kProfile.properties.nickname);
		System.out.println("로그인한 카카오 프로필이미지 : " + kProfile.properties.profile_image);
		System.out.println("로그인한 카카오 성별 : " + kProfile.kakao_account.gender);

		return "redirect:/";
	}

	// 로그아웃
	@RequestMapping("normalLogout")
	public String normalLogout() {
		session.invalidate(); // 이게 맞을듯
		return "redirect:/";
		// 나중에 현재페이지 로그인&로그아웃으로 변경할것
	}
	
	// 마이페이지 이동시 정보 빼오기
	@RequestMapping("mypageGo")
	public String mypageGo(Model model) {
		int loginSeq = (int) session.getAttribute("loginSeq");
		MemberDTO dto = memberService.myInfoSelectAll(loginSeq);
		model.addAttribute("loginInfo", dto);
		return "mypage/myInfo";
	}
	
	// 일반회원 정보수정Ok
	@RequestMapping("myInfoChangeOk")
	public String myInfoChangeOk(MemberDTO dto, MultipartFile file) throws IllegalStateException, IOException {
		dto.setSeq((int)session.getAttribute("loginSeq"));
		dto.setPhoto(dto.getPhoto() + "");
//		널값 처리 해야됨
		String realPath = session.getServletContext().getRealPath("myPhoto");
		memberService.myInfoChangeOk(dto, file, realPath);
		return "redirect:/member/mypageGo";
	}

	@ExceptionHandler
	public String ExceptionHandler(Exception e) {
		e.printStackTrace();
		e.getMessage();
		return "redirect:/";
	}
}
