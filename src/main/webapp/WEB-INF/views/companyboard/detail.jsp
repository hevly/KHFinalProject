<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동행 게시판</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<!-- fontawesome cdn -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
    integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">


<!-- datepicker -->
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    
<!-- include libraries(jQuery, bootstrap) -->
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- include summernote css/js -->
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
    
    <jsp:include page="../base/header.jsp"></jsp:include>
    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
        }

		/* input style */
        input:focus {outline:none;}
        
        input{
        	autocomplete:"off" ;
        }

		/* 링크 속성 지우기 */
		a {
			text-decoration: none
		}

		a:hover {
			text-decoration: none;
			color: black;
		}

		a:link {
			text-decoration: none;
			color: black;
		}

		a:visited {
			text-decoration: none;
			color: black;
		}

		a:active {
			text-decoration: none;
			color: black;
		}

        /* 헤더----------------------------------------------------- */
        .banner {
            background-image:url("/images/community_banner.png");
            height:200px;
        }

        .banner_title {
            width: 100%;
            height: 70%;
            color: white;
            font-size: 35px;
            font-weight: 600;
            padding: 60px 0px 10px 100px;
        }

        .banner_content {
            width: 100%;
            height: 30%;
            color: white;
            font-size: 15px;
            font-weight: 500;
            padding-left: 100px;
        }

        /* 미니 사이트맵 루트 */
       .root {
            padding-left: 80px;
            overflow: auto;
        }

        .root>div {
            float: left;
            margin: 40px 0px 40px 0px;
            padding-right: 10px;
			font-size: 16px;
        }

        .fa-home {
            color: rgb(56, 181, 174);
        }

		/* 컨테이너 ----------------------------------------------------- */
        .container_c {
			margin-left: 200px;
			margin-right: 200px;
            padding-bottom :30px;
            overflow: auto;
        }

        /* 제목, 글 */
        .board {
            
            width: 100%;
            padding: 20px 80px 0px 80px;
        }

        .select_tour {
            width: 100%;
            padding: 10px;
        }

        .select_recruit {
            width: 100%;
            padding: 10px;
        }
        
        .select_date {
            width: 100%;
            padding: 10px;
        }

        .select_gender {
            width: 100%;
            padding: 10px;
        }

        .title {
            width: 100%;
            padding: 5px;
        }

        #title{
            /* width: 100%;
            height: 30px;  */
        }

        .write_con {
            width: 100%;
			padding: 10px;
        }

        .write_con>textarea {
            width: 100%;
            height: 500px;
            resize: none;
        }

		#categoryValue_txt{
			color: rgb(56, 181, 174); 
			font-weight:500; 
			display: inline; 
			font-size: 30px;
			padding: 5px;
		}

		#title{
			display: inline; 
			font-size: 30px; 
			font-weight: 500; 
			border: none; 
			width: 80%;
			padding-left: 10px;
		}

        /* 버튼 */
        .button {
            
            text-align: right;
            padding: 50px 5px 0px 0px;
        }
        
        .button> button{
        	margin: 2px;
        }

		 /* 작성자/조회수칸 */
		.writer_info {
			position: relative;
			width: 100%;
			height: 70px;
			margin-top: 20px;
			margin-bottom: 20px;
			padding-bottom: 20px;
			border-bottom: 1px solid black;
		}
        
        .writer_photo{
        	float: left;
        	width: 70px;
        	height: 50px;
        	text-align: center;
        	line-height: 50px;
        	padding-left:20px;
        	
        }
        
        .writer_photo>img{
        	width: 50px;
        	height: 50px;
        }
        
        .writer_con{
        	float: left;
            width: 70%;
            height: 100%;
            padding-left:20px;
        }
        
        .writer_con>div{
        	float: left;
            width: 100%;
            height: 50%;
            line-height:25px;
            color: gray;
        }
        
        /* 좋아요, 댓글란  */
        .like_n_rep{
        	
        	width: 100%;
        	height: 30px;
        	text-align: right;
        }
        
        .like_n_rep>div{
        	
        	height:30px;
        	width: 55px;
        	text-align:center;
        	float: left;
        	line-height:30px;
        }
        
        #heart, #cant_heart, .recruit_list_see{
        	cursor: pointer;
        }
        
        /* 댓글 쓰기창 */
        .rep_con{
            width: 100%;
            height: 70px;
            padding: 10px;
            padding: 20px 80px 10px 80px;
        }

        .rep_con > textarea{
            width: 100%;
            height: 50px;
            resize: none;
        }

        .button2 {
            text-align: right;
            padding: 10px 80px 20px 0px;
        }
        
        /* 댓글 리스트 */
        .rep_list{padding:10px; margin-top:10px; }
        
        .each_rep{width: 100%; border-bottom: solid 1px rgb(190, 190, 190); padding-bottom:10px; float:left;}
        
        .rep_top{width: 100%; padding-top:10px; }
        
        .rep_txt{width: 100%; }
        
        .rep_btn{width: 100%; text-align:right; padding-right:20px; }
        
        .rep_writer{ font-weight: bolder;width: 50%; display:inline-block; padding-left: 20px ; }
        
        .rep_date{color: gray; width:  49%; display:inline-block; text-align: right; padding-right: 20px; }
        
        .e_rep_con{ width: 100%; padding: 5px 20px 5px 20px; border: none; }
        
        .rep_btn > button {margin: 2px;}
        
		.rp_list_con{
			margin: 0px 80px 0px 80px;
		}

		.re_rp_contents2{
			width: 95%;
			float: left;
			padding-bottom: 20px;
		}

		.re_rp_contents3{
			width: 95%; 
			float: left;
			padding-bottom: 20px;
		}

		.re_reply{
			width: 100%; 
			float: left; 
			margin-top:20px;	
		}
				

        /* 참가자리스트 */
        .recruit_list{
            text-align: center;
            width: 100%;
            padding: 10px 300px 10px 300px;
            overflow: auto;
        }
        
        .recruit_list>div{
         	text-align: center;
         	padding-top: 10px;
         	padding-bottom : 10px;
            border-bottom: solid 1px rgb(207, 207, 207);
        }

		/* 1400px ~  */
		@media (min-width: 1400px){

		}

		/* 800 ~ 1400px */
		@media (max-width: 1400px) and (min-width: 800px){
			/* 컨테이너 */
			.container_c {
				margin-left: 50px;
				margin-right: 50px;
				padding-bottom: 30px;
				overflow: auto;
			}

			/* 미니 사이트맵 루트 */
			.root{
				padding-left: 5px;
				overflow: auto;
				text-align: center;
				font-size: 16px;
			}

			/* 제목 카테고리 */
			#categoryValue_txt{
				color: rgb(56, 181, 174); 
				font-weight:500; 
				display: inline; 
				font-size: 25px;
				padding: 5px;
			}

			#title{
				display: inline; 
				font-size: 25px; 
				font-weight: 500; 
				border: none; 
				width: 80%;
				padding-left: 10px;
			}

			/* 제목, 글 */
			.board {
				width: 100%;
				padding: 20px 0px 0px 0px;
			}

			/* 댓글쓰기창 */
			.rep_con {
				width: 100%;
				height: 70px;
				padding: 20px 20px 10px 20px;
			}

			.button2 {
				text-align: right;
				padding: 10px 20px 20px 20px;
				/* height: 50px; */
			}

			.rp_list_con{
				margin: 0px 20px 0px 20px;
			}

			/* 참가자리스트 */
			.recruit_list{
				text-align: center;
				width: 100%;
				padding: 10px 100px 10px 100px;
				overflow: auto;
			}
			
			.recruit_list>div{
				text-align: center;
				padding-top: 10px;
				padding-bottom : 10px;
				border-bottom: solid 1px rgb(207, 207, 207);
			}
					
		}

		/* ~ 800px */
		/* 작은 화면일 때 */
		@media (max-width: 800px){

			/* 컨테이너 */
			.container_c {
				margin-left: 10px;
				margin-right: 10px;
				padding-bottom: 30px;
				overflow: auto;
			}

			/* 헤더 banner contents*/
			.banner_title{
				width: 100%;
				height: 70%;
				color: white;
				font-size: 35px;
				font-weight: 600;
				padding: 60px 0px 10px 0px;
				text-align: center;
			}
			
			.banner_content{
				width: 100%;
				height: 30%;
				color: white;
				font-size: 15px;
				font-weight: 500;
				padding-left: 0px;
				text-align: center;
			}

			/* 미니 사이트맵 루트 */
			.root{
				padding-left: 0px;
				overflow: auto;
				text-align: center;
				display: none;
			}

			/* 제목 카테고리 */
			#categoryValue_txt{
				color: rgb(56, 181, 174); 
				font-weight:500; 
				display: inline; 
				font-size: 25px;
				padding: 5px;
			}

			#title{
				display: inline; 
				font-size: 25px; 
				font-weight: 500; 
				border: none; 
				width: 80%;
				padding-left: 10px;
			}

			/* 제목, 글 */
			.board {
				width: 100%;
				padding: 20px 0px 0px 0px;
			}

			/* 댓글쓰기창 */
			.rep_con {
				width: 100%;
				height: 70px;
				padding: 20px 0px 10px 0px;
			}	

			.button2 {
				text-align: right;
				padding: 10px 0px 20px 0px;
				/* height: 50px; */
			}

			.rp_list_con{
				margin: 0px 0px 0px 0px;
			}

			/* 참가자리스트 */
			.recruit_list{
				text-align: center;
				width: 100%;
				padding: 10px 0px 10px 0px;
				overflow: auto;
			}
			
			.recruit_list>div{
				text-align: center;
				padding-top: 10px;
				padding-bottom : 10px;
				border-bottom: solid 1px rgb(207, 207, 207);
			}

		}
		
		
    </style>
    
</head>
           
<body>

	<div class="banner">
        <!-- 추후 banner background로 이미지 넣을 예정입니다. 지금은 임시로 단색채움.-->
        <div class="banner_title"> 동행 게시판 </div>
        <div class="banner_content"> 함께 여행갈 친구들을 만들어 보세요 </div>
    </div>
    
    <div class="container_c">
		<div class="root">
			<div class="home"><a href="/"><i class="fas fa-home"></i></a></div>
			<div>></div>
			<div class="community" href="/companyboard/list?cpage=1">커뮤니티</div>
			<div>></div>
			<div class="companyboard"><a href="/companyboard/list?cpage=1">동행 게시판</a></div>
		</div>
    
        <form  action="/companyboard/toModify" method="post" id="frmDetail" enctype="multipart/form-data">
            <div class="board">
            	<input type=hidden value="${dto.seq}" name=seq > <!-- 글 번호에 맞춰 불러오기 위한 꼼수 -->
            	<div class="catetitle"> <!-- title -->
                    <span style="width: 20%;">
                        <h3 id="categoryValue_txt" >${dto.tour}</h3> 
                    </span>
                    <span style="width: 80%;">
                        <input type=text id=title name=title readonly value="${dto.title }" >
                    </span>
                </div>
                
                <div class = writer_info>
                	<div class = writer_photo>
						<img src="${loginInfo.photo}" class="portraitPhoto">
					</div>
					<div class = writer_con>
						<div class="writer_nick">
               				<input type=hidden value="${dto.nick}" name=nick >
                    		<div> ${dto.nick}</div>
                		</div>
                		<div class="view_con">
                    		<div>조회수 ${dto.view_count}</div>
                		</div>
					</div>
                </div>
 
                <div class="select_tour"><span style="font-weight: bold;">여행지 : </span>
                    <input type=text id=tourInput readonly name="tour" value="${dto.tour }" style="border:none;">               		         
                </div>
    
                <div class="select_recruit" ><span style="font-weight: bold;">모집 인원 : </span>
                    <input type=text id=recruitInput readonly value="${dto.recruit }" name="recruit" style="border:none;">
                </div>
    
                <div class="select_date">
                    <span style="font-weight: bold;">여행 기간 : </span>
                    <input type="text" id="startDateBefore" readonly value="${dto.start_date }" autocomplete='off' style="border:none; width:100px; text-align:center;"/> <span id="datetxt1"> ~ </span>
                    <input type="text" id="endDateBefore" readonly value="${dto.end_date }" autocomplete='off' style="border:none; width:100px; text-align:center;"/>
                    <input type="text" id="startDateAfter" name="start_date" readonly value="${dto.start_date }" style="display: none; width:100px; text-align:center;" autocomplete='off'/> <span style="display:none" id="datetxt2"> ~ </span>
                    <input type="text" id="endDateAfter" name="end_date" readonly value="${dto.end_date }" style="display: none; width:100px; text-align:center;" autocomplete='off'/>
                </div>
    
                <div class="select_gender"><span style="font-weight: bold;">성별 : </span>
                    <input type=text id=genderInput readonly value="${dto.gender }" name="gender" style="border:none;">
                </div>
    
                <div class="write_con">
                    <textarea id="summernote"  name="contents" style="display:none;">${dto.contents }</textarea>
                    ${dto.contents }
                </div>
    
    			<div class="button">
    				<c:if test="${!empty loginSeq }">
                		<button type=button id=back class="btn btn-primary btn-sm" style="border: none;background-color: rgb(56, 181, 174);"><span style="font-size: small;">목록</span></button>
                	<c:if test="${dto.mem_seq == loginSeq}">
                		<button type=submit id=modify class="btn btn-primary btn-sm" style="border: none;background-color: rgb(56, 181, 174);"><span style="font-size: small;">수정</span></button>
                		<button type=button id=delete class="btn btn-primary btn-sm" style="border: none;background-color: rgb(56, 181, 174);"><span style="font-size: small;">삭제</span></button>
                		<c:if test="${dto.expired == '진행'}">
                			<button type=button id=recruitEnd class="btn btn-primary btn-sm" style="border: none;background-color: rgb(56, 181, 174);"><span style="font-size: small;">모집마감</span></button>
                		</c:if>
                		<c:if test="${dto.expired == '마감'}">
                			<button type=button id=recruitEndCancel class="btn btn-primary btn-sm" style="border: none;background-color: rgb(56, 181, 174);"><span style="font-size: small;">마감취소</span></button>
                		</c:if>
                	</c:if>
                	
                	<c:if test="${dto.mem_seq != loginSeq}">
                		<c:if test="${dto.expired == '진행'}">
                		<button type=button id=attend class="btn btn-primary btn-sm" style="border: none;background-color: rgb(56, 181, 174);"><span style="font-size: small;">참여신청</span></button>
                		</c:if>
                	</c:if>
                	</c:if>
                </div>
                
                <div class="like_n_rep">
              		<c:if test="${!empty loginSeq}">
                		<div id=like_icon>
                			<a class="heart">
           						<img id="heart" src="" style="width:20px; height:20px;"><span id="rec_count" name="rec_count" style="color:black;"> ${likeCount}</span>
       						</a>
                		</div>
                	</c:if>
                	<c:if test="${empty loginSeq}">
                		<div id=like_icon>
                			<a class="heart_nonmem">
           						<img id="heart" src="/images/dislike.png" style="width:20px; height:20px;"><span id="rec_count" name="rec_count" style="color:black;"> ${likeCount}</span>
       						</a>
                		</div>
                	</c:if>
                	<div id=rep_icon>
                		<i class="far fa-comment-dots" style="color: black"></i><span id="rep_count" name="rep_count"> ${dto.rep_count}</span>
                	</div>
                	<c:if test="${dto.expired == '진행'}">
                	<div id=recruit_icon>
                		<a class="recruit_list_see">
                			<i class="far fa-user" style="color: black"></i><span id="mem_count" name="mem_count" style="color:black;"> ${memCount} </span>
                		</a>
                	</div>
                	</c:if>
                	<c:if test="${dto.expired == '마감'}">
                	<div id=recruit_icon>
                		<a class="recruit_list_see_no">
                			<i class="far fa-user" style="color: black"></i><span id="mem_count" name="mem_count" style="color:black;"> ${memCount} </span>
                		</a>
                	</div>
                	</c:if>
                </div>
                
                <div class = "recruit_list" style="display: none;">
                	<c:if test="${dto.expired == '진행'}">
                		<span style="font-weight: bold; text-align:center; "> 신청자 리스트 (모집 진행 중) </span>
                	</c:if>
                	<c:forEach var="rl" items="${recruit_list }">
                		<div class="recruit_mem" >${rl.nick } (  ${rl.gender}, ${rl.age} 세  )&nbsp
                			<c:if test="${dto.nick == loginNick}">
                				<!-- <button type=button class="btn btn-primary btn-sm " id="recruit_ok" style="border: none;background-color: blue;"><span style="font-size: small;">승인</span></button> -->
                				<button type=button class="btn btn-primary btn-sm recruit_no" id="recruit_no${rl.seq }" style="border: none;background-color: hsl(22, 100%, 75%);"><span style="font-size: small;">거부</span></button>
                			</c:if>
                		</div>
                	</c:forEach>
                </div>
                <c:if test="${dto.expired == '마감'}">
                	<div class = "recruit_list" >
                		<span style="font-weight: bold; text-align:center; "> 동행자 </span>
                			<c:forEach var="rl" items="${recruit_list }">
                				<div class="recruit_mem" >${rl.nick } (  ${rl.gender}, ${rl.age} 세  )</div>
                			</c:forEach>
                	</div>
                </c:if>
            </div>
         	</form> 
               	<form action="/comreply/reply" method="post" id="frmReply" enctype="multipart/form-data">
					<input type=hidden value="${dto.seq}" name=rseq>
					<c:if test="${!empty loginNick}">
						<div class="rep_con">
                    		<textarea id=rep_con name=reply placeholder=" 댓글을 입력해주세요" ></textarea>
                		</div>
                		<div class="button2">
                    		<button type="submit"  id="rep_write" class="btn btn-primary btn-sm" style="border: none;background-color: rgb(56, 181, 174);"><span style="font-size: small;">댓글 작성</span></button>
                		</div>
                	</c:if>
                </form> 
                
				<div class="rp_list_con">
                <c:forEach var="repl" items="${rep_list }">
                	<form method="post" id="frmRpMod" enctype="multipart/form-data">
                		<div class="rep_list">
                    		<div class="each_rep">
                        		<div class="rep_top"><!-- reply_title -->
                        			<input type=hidden value="${repl.seq}" name=seq>
            						<input type=hidden value="${repl.par_seq}" name=par_seq>
                            		<span class="rep_writer" value="${repl.mem_seq }">
                                		${repl.nick }
                            		</span>
                            		<span class="rep_date" > 
                            			${repl.writen_date }
                            		</span>
                        		</div>
                        		<div class="rep_txt">
                          	  		<input type="text" id="e_rep_con${repl.seq }" class="e_rep_con"  name="contents" value="${repl.contents }"  readonly>
                        		</div>
                        		
                        		<c:if test="${!empty loginNick}">
                        		<div class="rep_btn">
                        			<button type=button id="re_rep_btn${repl.seq }" class="btn btn-primary btn-sm re_rep_btn" style="border: none;background-color: rgb(56, 181, 174);"><span style="font-size: small;">답글 달기</span></button>
                           		 	<c:if test="${repl.mem_seq == loginSeq}">
                           		 		<button type=button id="rep_del${repl.seq }" class="btn btn-primary btn-sm rep_del" style="border: none;background-color: rgb(56, 181, 174);"><span style="font-size: small;">댓글 삭제</span></button>
                           	 			<button type=button id="rep_mod${repl.seq }" class="btn btn-primary btn-sm rep_mod" style="border: none;background-color: rgb(56, 181, 174);"><span style="font-size: small;">댓글 수정</span></button>
                        				<button type=submit id="rep_modok${repl.seq }" formaction="/comreply/modify" class="btn btn-primary btn-sm rep_modok" style="border: none; background-color: rgb(56, 181, 174); display: none;"><span style="font-size: small;">수정 완료</span></button>
                            			<button type=button id="rep_modcancel${repl.seq }" class="btn btn-primary btn-sm rep_modcancel" style="border: none;background-color: rgb(56, 181, 174); display: none;"><span style="font-size: small;">수정 취소</span></button>
                        			</c:if>
                        		</div>
                        		</c:if>
                        		
                        		<!-- 답글 달기 창  -->
                        		<div class="re_rep_input" id="re_rep_input${repl.seq }" style="width: 100%; float: left; margin-top:5px; display:none;">
                        			<div style="width: 5%; float: left; text-align: right; padding-right: 10px; color: orange;"><i class="fas fa-reply fa-rotate-180"></i></div>
                        			<div class="re_rp_contents2">
                        				<div class="re_reply_content">
                            				<input type=hidden value="${dto.seq}" name=writeseq>
                            				<input type=hidden value="${repl.seq}" name=rpseq>
                            				<input type=text placeholder="댓글을 입력하세요" id="rereply_contents${repl.seq }" name=recontents style="width: 100%; padding: 10px; outline:none;" autocomplete="off">
                            			</div>
                            			<div class="re_rep_input_btn" style="text-align: right; margin-top:10px; padding-right:20px;">
                            				<button type=submit formaction="/comreply/rereply" class="re_reply_write btn btn-primary btn-sm" id="re_reply_write${repl.seq }" style="border: none;background-color: rgb(56, 181, 174);"><span style="font-size: small;">작성 완료</span></button>
                           	 				<button type=button class="btn btn-primary btn-sm re_rep_cancle_btn" id="re_rep_cancle_btn${repl.seq }" style="border: none;background-color: rgb(56, 181, 174);"><span style="font-size: small;">작성 취소</span></button>
                            			</div>
                        			</div>               		
                        		</div>
                        		
                        		<!-- 답글 -->
                        		<c:forEach var="rerepl" items="${re_rep_list }">
                        			<c:choose>
                        				<c:when test="${rerepl.par_seq == repl.seq}">
                        					<div class="re_reply" id="re_reply${repl.seq }">
                            					<div style="width: 5%; float: left; text-align: right; padding-right: 10px; color: orange;"><i class="fas fa-reply fa-rotate-180"></i></div>
                            					<div class="re_rp_contents3">
                                					<div class="re_rp_title" style="width: 100%;">
                                    					<span class="re_rp_id" value="${rerepl.mem_seq }" style="font-weight: bolder;width: 50%; display:inline-block; ">${rerepl.nick }</span>
                                    					<span class="re_rp_time" style="color: gray; width:  49%; display:inline-block; text-align: right;"> ${rerepl.writen_date }</span>
                                					</div>
                                					<div class="re_rp_contents" style="width: 100%;">
                                						<div class="re_rp_content">
                                    						<input type="text" class="rr_con" id="recontent${rerepl.seq }"  name="contents" value="${rerepl.contents}" style="width: 100%; padding:5px 20px 5px 0px; border: none;" readonly>
                                						</div>
                                						<c:if test="${!empty loginNick}">
                                						<c:if test="${rerepl.mem_seq == loginSeq}">
                                						<div class="re_rp_btns" style="text-align: right; margin-top:10px; padding-right:20px;"">
                           		 							<button type=button class="btn btn-primary btn-sm re_rep_del" id="re_rep_del${rerepl.seq }" style="border: none;background-color: rgb(56, 181, 174);"><span style="font-size: small;">댓글 삭제</span></button>
                           	 								<button type=button class="btn btn-primary btn-sm re_rep_mod" id="re_rep_mod${rerepl.seq }" rpseq=${repl.seq } style="border: none;background-color: rgb(56, 181, 174);"><span style="font-size: small;">댓글 수정</span></button>
                        									<button type=button class="btn btn-primary btn-sm re_rep_modok" id="re_rep_modok${rerepl.seq }" rpseq=${repl.seq } style="border: none;background-color: rgb(56, 181, 174); display: none;"><span style="font-size: small;">수정 완료</span></button>
                            								<button type=button class="btn btn-primary btn-sm re_rep_cancle" id="re_rep_cancle${rerepl.seq }" style="border: none;background-color: rgb(56, 181, 174); display: none;"><span style="font-size: small;">수정 취소</span></button>
                        								</div>
                        								</c:if>
                        								</c:if>
                                					</div>
                            					</div>
                        					</div>
                        				</c:when>
                        			</c:choose>
                        		</c:forEach>
                    		</div>
                		</div>
                	</form>
               	</c:forEach>
			</div>
    		</div>
    	
    	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
	        <div class="modal-header">
	          <h4 class="modal-title text-center">프로필 조회</h4>
	        </div>
	      <div class="modal-body">
	      	<img id="profileImg" style="width:100px;height:100px;">
	        <span id="profileNick"></span><br>
	        <span id="profilePreference"></span><br>
	        <span id="profileGender"></span><br>
	        <span id="profilePhone"></span><br>
	        <span id="profileAge"></span><br>
	        <span id="profileTxt"></span>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" id="modalCloseBtn" data-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<footer>
    	    <jsp:include page="../base/footer.jsp"></jsp:include>
    </footer>
	
	<script>
		let wsObj = new Object();
		wsObj.seq = "${dto.seq}";
		wsObj.mem_seq = "${dto.mem_seq}";
		wsObj.loginSeq = "${loginSeq}";
		wsObj.title = "${dto.title}";
		wsObj.nick = "${dto.nick}";
		wsObj.board_num = "${dto.board_num}";
		wsObj.reactioner = "${loginNick}";
	</script>
   <script>
   $(document).on("click",".rep_writer",function(){
		let mem_seq = $(this).attr("value");
		console.log("대댓글 멤버 시퀀스 값 : " + mem_seq);
		$.ajax({
			url:"/member/showMember?mem_seq="+mem_seq,
   		dataType:"json",
   		success:function(result){
   			$('#myModal').modal('toggle');
   			if(result.photo!=undefined){
       			$("#profileImg").attr("src","/images/"+result.photo);    				
   			}else{
   				$("#profileImg").attr("src","/images/noPhoto.png");
   			}
   			$("#profileNick").text("사용자 명 : "+result.nick);
   			$("#profilePreference").text("여행 선호 방식 : "+result.preference);
   			$("#profileGender").text("성별 : "+result.gender);    			
   			$("#profilePhone").text("연락처 : " + result.phone);    			
   			$("#profileAge").text("연령 : "+result.age);
   			$("#profileTxt").text("자기소개 : "+result.text);
   			$("#profileMsg").attr("onclick","location.href='/member/msg?mem_seq="+mem_seq+"'");
   		}			
		})
	})
	$(document).on("click",".re_rp_id",function(){
		let mem_seq = $(this).attr("value");
		console.log("대댓글 멤버 시퀀스 값 : " + mem_seq);
		$.ajax({
			url:"/member/showMember?mem_seq="+mem_seq,
   		dataType:"json",
   		success:function(result){
   			$('#myModal').modal('toggle');
   			if(result.photo!=undefined){
       			$("#profileImg").attr("src","/images/"+result.photo);    				
   			}else{
   				$("#profileImg").attr("src","/images/noPhoto.png");
   			}
   			$("#profileNick").text("사용자 명 : "+result.nick);
   			$("#profilePreference").text("여행 선호 방식 : "+result.preference);
   			$("#profileGender").text("성별 : "+result.gender);    			
   			$("#profilePhone").text("연락처 : " + result.phone);    			
   			$("#profileAge").text("연령 : "+result.age);
   			$("#profileTxt").text("자기소개 : "+result.text);
   			$("#profileMsg").attr("onclick","location.href='/member/msg?mem_seq="+mem_seq+"'");
   		}			
		})
	})
	$('#modalCloseBtn').on("click",function(){
		$("#myModal").modal("toggle");
	})
   </script> 	
    	
   <!-- 대댓글 -->
   <script>
	
   		/* 답글 달기 창 관련 */
		$(".re_rep_btn").on("click", function(){
			let id = this.id.substr(10);
			$("#re_rep_input"+id).css("display", "inline");
		})
		
		$(".re_rep_cancle_btn").on("click", function(){
			let id = this.id.substr(17)
			$("#re_rep_input"+id).css("display", "none");
		})
	
		/* 대댓글 관련 */		
		$(".re_reply_write").on("click", function(){
			let id = this.id.substr(14);
			
			if($("#rereply_contents"+id).val() == ""){
				alert("댓글을 작성해주세요");
 				return false;			
 			}			
			$('#frmRpMod').submit();
		})
		
   		$(".re_rep_del").on("click", function(){
			let id = this.id.substr(10);
			location.href = "/comreply/redelete?idseq="+id+"&writeseq=${dto.seq}";
		})
	
		$(".re_rep_modok").on("click", function(){
			let id = this.id.substr(12);
			
			let recontent = $("#recontent${rerepl.seq }"+id).val();
			console.log(recontent + " : " + $("#recontent${rerepl.seq }").val());
			
			if(recontent==""){
				alert("내용을 입력해주세요");
				$("#recontent${rerepl.seq }"+id).focus();
				return false;
			}
			
			location.href = "/comreply/remodify?writeseq=${dto.seq}&idseq="+id+"&recontent="+recontent;
		})
		
		$(".re_rep_cancle").on("click", function(){		
			location.reload();
		})
		
		$(".re_rep_mod").on("click", function(){
			let id = this.id.substr(10);
			/* let mod_id = $(this).attr("rpseq"); */
			
			/* console.log("mod_btn 눌렀을 때 id : mod_id = " + id + " : " + mod_id); */
			$("#re_rep_mod"+id).css("display","none");
			$("#re_rep_del"+id).css("display","none");
			$("#re_rep_modok"+id).css("display","inline");
			$("#re_rep_cancle"+id).css("display","inline");	
			$("#recontent"+id).removeAttr("readonly");
			
			let recontent = $("#recontent"+id).val();
			$("#recontent"+id).val("");
			$("#recontent"+id).focus();
			$("#recontent"+id).val(recontent);
		})
		
		
   </script>
    
    <!-- 댓글 -->
	<script>
	 	$("#rep_write").on("click", function() {
	 		
	 		if($("#rep_con").val() == ""){
	 			alert("댓글을 작성해주세요");
	 			return false;
	 		}else{ 
	 			var answer = confirm("이대로 작성하시겠습니까?");
	 			
	 			if(answer){
					wsObj.reaction = 'comment';
					ws.send(JSON.stringify(wsObj));
					$.ajax({
						url: "/member/reactionInserter",
						data: {reaction: JSON.stringify(wsObj)}
					});
	 				$("#frmReply").submit();
	 			}else{
	 				$("#rep_con").val("");
		 			return false;
		 		}
	 		} 
			
		});
	 	
	 	$(".rep_del").on("click", function() {
			if (confirm("댓글을 삭제하시겠습니까?")) {
				let id = this.id.substr(7);
				location.href = "/comreply/delete?rpseq=" + id	+ "&bseq=${dto.seq}";
			}
		})
		
		$(".rep_mod").on("click", function() {
			//${rp.seq }
			let id = this.id.substr(7);

			$("#rep_mod" + id).css("display", "none");
			$("#rep_del" + id).css("display", "none");
			$("#rep_modcancel" + id).css("display", "inline");
			$("#rep_modok" + id).css("display", "inline");
			$("#re_rep_btn" + id).css("display", "none");
			$("#e_rep_con" + id).removeAttr("readonly");
			
			let e_rep_con = $("#e_rep_con" + id).val();
			$("#e_rep_con" + id).val("");
			$("#e_rep_con" + id).focus();
			$("#e_rep_con" + id).val(e_rep_con);
		})
	 	
		$(".rep_modcancel").on("click", function() {
			location.reload();
		})
		
		$(".rep_modok").on("click", function(){
			let id = this.id.substr(9);
			
			if($("#e_rep_con"+id).val() == ""){
				alert("댓글을 입력하세요");
				$("#e_rep_con"+id).focus();
				return false;
			}
			$('#frmRpMod').submit();
		})
	
	</script>
    
    <!-- 목록으로 / 삭제하기 -->
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script>
		var $j360 = jQuery.noConflict();
	
	
		$j360("#back").on("click", function(){
			location.href="/companyboard/list?cpage=1";
		})
		
		$j360("#delete").on("click", function(){
			if(confirm("정말 삭제하시겠습니까?")){
				location.href="/companyboard/deleteProc?seq=${dto.seq}"; 
			}
		})
	</script>
	
	<!-- 수정하기, 버튼 클릭시 -->
	<script>
		let backupTour="";
		let backupRecruit="";
		let backupStartDate="";
		let backupEndDate="";
		let backupGender="";
		let backupTitle = "";
		let backupContents = "";
		
		$("#modify").on("click", function(){
			
			// 기존 데이터 담기
			backupTour = $("#tourInput").val();
			backupRecruit = $("#recruitInput").val();
			backupStartDate = $("#startDateBefore").val();
			backupEndDate = $("#endDateBefore").val();
			backupGender = $("#genderInput").val();
			backupTitle = $("#title").val();
			backupContents = $("#summernote").val();		

			// 폼 형태 바꾸기 및 읽기 전용 해제
			$("#tourInput").css("display", "none");
			$("#recruitInput").css("display", "none");
			$("#startDateBefore").css("display", "none");
			$("#datetxt1").css("display", "none");
			$("#endDateBefore").css("display", "none");
			$("#genderInput").css("display", "none");
			
			$("#tourSelect").css("display", "inline");
			$("#recruitSelect").css("display", "inline");
			$("#startDateAfter").css("display", "inline");
			$("#datetxt2").css("display", "inline");
			$("#endDateAfter").css("display", "inline");
			$("#manRadio").css("display", "inline");
			$("#womanRadio").css("display", "inline");
			$("#mantxt").css("display", "inline");
			$("#womantxt").css("display", "inline");
			$("#title").removeAttr("readonly");
			$("#title").css("border", "1px solid gray");
			$("#contents").removeAttr("readonly");
			
			
			// 여행지역 기존 체크값 불러오기
			$("#tourSelect").val(backupTour).attr("selected", "selected");
			
			// 모집인원 기존 체크값 불러오기
			$("#recruitSelect").val(backupRecruit).attr("selected", "selected");

			// 라디오 버튼 기존 체크값 불러오기
			if(backupGender == "남자"){
				$("#manRadio").attr('checked', 'checked');
			}
			else {
				$("#womanRadio").attr('checked', 'checked');
			}
	
			//버튼 형태 바꾸기
			$("#modify").css("display", "none");
			$("#delete").css("display", "none");
			$("#recruitEnd").css("display", "none");
			$("#modOk").css("display", "inline");
			$("#modCancel").css("display", "inline");	
			
			// 썸머노트 쓰기 활성화
			/* $('#summernote').summernote({
    		  airmode: false;
    		}); */
			
			$('#summernote').summernote('enable');
		})
		
		$("#modOk").on("click",function(){
			if(confirm("이대로 수정하시겠습니까?")){
				$("#frmDetail").submit(); // 수정완료시 submit
			}
		})
		
		$("#modCancel").on("click", function(){
			if(confirm("정말 취소하시겠습니까?")){
				location.reload();
			}
	
			// 썸머노트 쓰기 비활성화
			$('#summernote').summernote('disable');
		})
	</script>
	
	<!-- datepicker  -->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> <!--DatePicker용 쿼리 충돌 방지-->
	<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->
    <script type="text/javascript">
    	var $j112 = jQuery.noConflict();
    	/* var $j1124 = jQuery.noConflict();  */
    	
    	$j112(document).ready(function () {
    		$j112("#startDateAfter").datepicker({
                dateFormat: "yy-mm-dd", // 날짜의 형식
                minDate: 0,
                nextText: ">",
                prevText: "<",
                onSelect: function (date) {
                    var endDate = $j112('#endDateAfter');
                    var startDate = $j112(this).datepicker('getDate');
                    var minDate = $j112(this).datepicker('getDate');
                    endDate.datepicker('setDate', minDate);
                    startDate.setDate(startDate.getDate() + 10000);
                    endDate.datepicker('option', 'maxDate', startDate);
                    endDate.datepicker('option', 'minDate', minDate);
                    $j112("#endDateAfter").val("");
                }
            });
    		$j112('#endDateAfter').datepicker({
                dateFormat: "yy-mm-dd", // 날짜의 형식
                nextText: ">",
                prevText: "<"
            });
        });
	</script>
    
    <!-- 좋아요 -->
    <script>
    $(document).ready(function () {

        var heartval = ${heart};

        if(heartval>0) {
        	 //console.log("heartval>0 "+heartval + " : " + ${heart});
            $("#heart").prop("src", "/images/like.png");
            $(".heart").prop('name',heartval)
        }
        else {
        	 //console.log("else "+heartval + " : " + ${heart});
            $("#heart").prop("src", "/images/dislike.png");
            $(".heart").prop('name',heartval)
        }
        
    });
    
    $(".heart").on("click", function () {

        var that = $(".heart");

        var sendData = {'boardId' : '${dto.seq}','heart': that.prop('name')};
        
        $.ajax({
            url :'/companyboard/heart',
            type :'POST',
            data : sendData,
            success : function(data){
                that.prop('name',data.heart);   
                
                var heart = data.heart;
                
                if(heart==1) {
					wsObj.reaction = 'like';
					ws.send(JSON.stringify(wsObj));
					$.ajax({
					url: "/member/reactionInserter",
					data: {reaction: JSON.stringify(wsObj)}
					});
                    $('#heart').prop("src","/images/like.png");
                    $("#rec_count").html(" " + data.likeCount);
                }
                else{
                    $('#heart').prop("src","/images/dislike.png");
                    $("#rec_count").html(" " + data.likeCount);
                }
            }
        });
    });


    $("#cant_heart").on("click",function(){
    	alert("로그인 후 이용 가능합니다. ");
    });
    </script>
    
    
    
    <!-- 참여신청 -->
    <script>
    	$("#attend").on("click",function(){
    	
    		
    		if(confirm("참여신청 하시겠습니까?")){
        			alert("참가여부는 모집마감 글 하단 참가자 리스트에서 확인 가능합니다.");
							wsObj.reaction = 'joinTrip';
							ws.send(JSON.stringify(wsObj));
							$.ajax({
								url: "/member/reactionInserter",
								data: {reaction: JSON.stringify(wsObj)}
							});
        			location.href="/companyboard/attend?seq=${dto.seq}"; 
        	}
    		
    	});

    </script>
    
    <!-- 모집마감 / 마감취소-->
    <script>
    	$("#recruitEnd").on("click",function(){
    		if(confirm("모집을 마감하겠습니까?")){    
				location.href="/companyboard/expired?seq=${dto.seq}"; 
			} 
		});
    	
    	$("#recruitEndCancel").on("click",function(){
    		if(confirm("마감을 취소하시곘습니까?")){    	
				location.href="/companyboard/expiredCancel?seq=${dto.seq}"; 
			} 
		});
    </script>
    
    <!-- 참가 신청자 리스트 확인 -->
    <script>
    	$(".recruit_list_see").on("click",function(){
    		$(".recruit_list").slideToggle("1000");
    	});
    </script>
    
    <!-- 삭제버튼 누르면 참가 신청자 리스트에서 삭제 -->
    <script>
    	$(".recruit_no").on("click",function(){
    		if(confirm("해당 신청을 거부하시겠습니까?")){    	
				let id = this.id.substr(10);
				location.href = "/companyboard/deleteMem?seq="+id+"&writeseq=${dto.seq}";
			} 
    	});
    </script>
    
    <!-- 비회원이 하트 클릭시  -->
    <script>
    	$(".heart_nonmem").on("click",function(){
    		alert("로그인 후 이용하세요");
    	});
    </script>
    
    
</body>
</html>