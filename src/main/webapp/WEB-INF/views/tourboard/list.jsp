<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행지 게시판</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<jsp:include page="../base/header.jsp"></jsp:include>
    <style>
        *{
            box-sizing: border-box;
        }

        body{
            margin: 0;  /* 임시로 body margin 0px */
        }

        /* 링크 속성 지우기 */
        a { text-decoration:none  } 
        a:hover { text-decoration:none; color: black; }
        a:link {text-decoration: none; color: black; }
        a:visited {text-decoration: none; color: black; }
        a:active {text-decoration: none; color: black; }

        /* div{border:1px solid black} */

        /* 헤더----------------------------------------------------- */
        .banner{
            background-color: rgb(56, 181, 174);
            height:200px;
        }

        .banner_title{
            width: 100%;
            height: 70%;
            color: white;
            font-size: 35px;
            font-weight: 600;
            padding: 60px 0px 10px 100px;
        }

        .banner_content{
            width: 100%;
            height: 30%;
            color: white;
            font-size: 15px;
            font-weight: 500;
            padding-left: 100px;
        }

        /* 컨테이너 ----------------------------------------------------- */
        .container{
            /* border:1px solid red; */
            padding-bottom :30px;
        }

        /* 미니 사이트맵 루트 */
        .container>.root{
            padding-left: 80px;
            overflow: auto;
        }

        .root>div{
           /*  border:1px solid red; */
            float:left;
            margin: 40px 0px 40px 0px;
            padding-right: 10px;
        }

        .fa-home{
            color: rgb(56, 181, 174);
        }

        /* 검색창 */
        .searchbar{
            /* border: 1px solid red; */
            text-align: right;
            padding-right: 80px;
            height: 30px;
        }
        
        .searchbar > button{
        	height: 30px;
        	border: none;
        }
        
        .searchbar > select{
        	height: 30px;
        }

        /* 게시글 올라오는 목록 부분 */
        .board{
            /* border: 1px solid red; */
            width: 100%;
            padding : 20px 80px 0px 80px;
            text-align: center;
        }

        .board_header{
            overflow: auto;
            width:100%;
        }

        .board_header>div{
            float: left;
            padding: 8px 0px 8px 0px;
            border-top: solid 1.5px #404040;
            border-bottom: solid 1.5px #404040; 
            background-color :white;
            font-weight: 700;
            width: 100%
        }

		.notice_enroll{
            overflow: auto;
        }
        
        .notice_enroll>div{
            float: left;
            padding: 8px 0px 8px 0px;
            /* border-top: solid 1px #404040; */
            border-bottom: solid 1px rgb(207, 207, 207);            
        }
        
        .board_enroll{
            overflow: auto;
            width:100%;
            height:auto;
        }
        
        
        .board_enroll>div{
            float: left;
            padding: 8px 0px 8px 0px;
            /* border-top: solid 1px #404040; */
            border-bottom: solid 1px rgb(207, 207, 207);  
            height:auto;
        }
        
        
       /*  .board_enroll>div : hover{
            background-color : rgb(228, 228, 228);
        } */

        /* 작성 버튼 및 페이지네이션  */
        .writebtn{
        	text-align: right;
        	padding: 20px 80px 0px 0px;
        }
        .button{
            /* border: 1px solid red; */
            text-align: right;
            padding: 20px 80px 0px 0px ;
        }

        .page{
            /* border: 1px solid red; */
            text-align: center;
            padding: 20px 0px 0px 0px;
            line-height: 20px;
        }
    </style>
</head>
<body>
    <!-- .banner에 이미지 추가해야한다.-->
    <div class="banner">
        <div class="banner_title" href="">여행지 게시판</div>
        <div class="banner_content">각 지역의 여행 후기를 남겨보세요</div>
    </div>
    <div class="container">
        <div class="root">
            <div class="home"><a href="/"><i class="fas fa-home"></i></a></div>
            <div> > </div>
            <div class="community" href="/tourboard/list?cpage=1">커뮤니티</div>
            <div> > </div>
            <div class="tourboard"><a href="/tourboard/list?cpage=1">여행지 게시판</a></div>
        </div>
        <form action="/tourboard/list?cpage=1" method="post" id="frmSearch">
        <input type=hidden name="cpage" value=1>
        <div class="searchbar">
            <select name="searchOption">
                <option name="searchTitle" value="search_title">제목</option>
                <option name="searchId" value="search_writer">작성자</option>
            </select>
            <input type=text list="trip" placeholder="search" id="searchText" name="searchText">
            	<datalist id="trip">
            		<option value="여행지 추천">
            		<option value="맛집">
            		<option value="명소">
            		<option value="재미있게 다녀오는 방법">
            	</datalist>
            <input type=submit id="search_btn" class="btn btn-primary btn-sm" style="background-color: rgb(56, 181, 174);" value="검색">
        </div>
        </form>
        <div class="board">
            <div class="board_header">
                <div class="seq" style="width: 10%;">번호</div>
                <div class="category" style="width: 10%;">머리말</div>
                <div class="title" style="width: 30%;">제목</div>
                <div class="mem_seq" style="width: 10%;">작성자</div>
                <div class="writen_time" style="width: 20%;">작성일</div>
                <div class="view_count" style="width: 10%;">조회수</div>
                <div class="rec_count" style="width: 10%;">추천수</div>     
            </div>
			
            <c:forEach var="n" items="${nt_list }">
    	  		<div class="notice_enroll">
       		        <div class="nt_seq" style="width: 10%;"><i class="fas fa-bullhorn"></i></div>
       		        <div class="nt_category" style="width: 10%;">공지</div>
       		        <div class="nt_title" style="width: 30%;"><a href="/tourboard/noticeDetail?seq=${n.seq}">${n.title }</a></div>
       		        <div class="nt_nick" style="width: 10%;">${n.nick }</div>
       		        <div class="nt_writen_time" style="width: 20%;">${n.writen_date }</div>
       		        <div class="nt_view_count" style="width: 10%;">${n.view_count }</div>
       		        <div class="nt_rec_count" style="width: 10%;">-</div>
       		    </div>
            </c:forEach>
            
            <c:forEach var="i" items="${list }">
    	  		<div class="board_enroll">
       		        <div class="seq" style="width: 10%;">${i.seq }</div>
       		        <div class="category" style="width: 10%; color: rgb(56, 181, 174); font-weight: bold">${i.category }</div>
       		        <div class="title" style="width: 30%;"><a href="/tourboard/detail?seq=${i.seq}">${i.title }&nbsp</a>
       		        	<i class="far fa-comment-dots" style="color: rgb(161, 161, 161)"></i><span id="rep_count" name="rep_count" style="color: red"> [${i.rep_count}] </span>
       		        </div>
       		        <div class="mem_nick" style="width: 10%;">${i.nick }</div>
       		        <div class="writen_time" style="width: 20%;">${i.writen_date }</div>
       		        <div class="view_count" style="width: 10%;">${i.view_count }</div>
       		        <div class="rec_count" style="width: 10%;">${i.rec_count }</div>
       		    </div>
            </c:forEach>
        </div>
        <c:if test="${!empty loginEmailID}">
        <div class="writebtn">
        	<input type=button class="btn btn-primary btn-sm" style="background-color: rgb(56, 181, 174);" value="작성하기" id="toWrite_btn">
        </div>
        </c:if>
        <div class="page">
            <div class="paging">
                <div>${navi  }</div>
            </div>
        </div>       
    </div>
    
    <script>
    $("#search_btn").on("click", function(){
		
    	if($("#searchText").val()==""){
    		alert("검색어를 입력해주세요");
    		return false;
    	}
    	if($("#searchOption").val()==""){
    		alert("검색어를 선택해주세요");
    		return false;
    	}
    })
    </script>
    
    <script>
    $("#toWrite_btn").on("click", function(){
		 location.href = "/tourboard/write";
	})
    </script>
</body>
</html>