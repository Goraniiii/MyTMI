<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- <meta name="viewport" content="width=device-width", initial-scale="1">

<link rel="stylesheet" href="css/custom.css"> -->

<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/mainpage2.css">
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css">

<title>MyTmi</title>
</head>
<body>
	<div class="wrapper">
		<!-- 헤더 -->
		<header id="mainPageHeader">
      <nav class="headerContainer">
         <div class="logoContainer">
            <a href="main.jsp"><img id="logo" src="images/logo.png"></a>  
         </div>         
         <div class="searchContainer">
            <form action="search.jsp" style="width: 100%">
                <label class="searchLabel">
                    <div class="searchBox">
                        <input class="inputSearch" name="searchisbn" type="search" placeholder="검색" autocomplete="off" value="">
                    </div>
                </label>
            </form>
          </div> 
          
          <%-- 로그인 버튼을 로그아웃 버튼으로 바꾸기 --%>

           <div class="LoginButtonContainer">
              <% 
               if(session.getAttribute("userid")==null){%>
                     <button id="login" type="button"><a href="login.jsp">로그인</a></button><%}
               else{
                  %><%=session.getAttribute("userid")%>님 환영합니다!<button align="right" id="logout" type="button" onclick="location.href='logout.jsp'">로그아웃</button><br>
                  <button align="left" id="logout" type="button" onclick="location.href='mypage.jsp'">마이페이지</button><br>
               <%}
            %>
           </div>
           <div class="signUpButtonContainer">
              <% 
               if(session.getAttribute("userid")==null){%>
                     <button id="signUp" type="button"><a href="join.jsp">회원가입</a></button><%
               }
            %>
           </div>
           <div class="myPageButtonContainer">
           	  <% 
	           	if(session.getAttribute("userid")==null){%>
	            	<button id="mypage" type="button">게시판</button><%
	   			}
           	 %>
           </div>
      </nav>
    </header>
   
   
	<div class="container">
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1" ></li>
				<li data-target="#myCarousel" data-slide-to="2" ></li>
			</ol>
			
			<div class="carousel-inner">
				<div class="item active">
					<img src="images/1.jpg" >
				</div>
				<div class="item">
					<img src="images/2.jpg">
				</div>
				<div class="item">
					<img src="images/3.jpg">
				</div>
			</div>
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span>
			</a>
			<a class="right carousel-control" href="#myCarousel" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right"></span>
			</a>
		</div>
		
		<!-- footer -->
		<footer>
	      <div style="padding: 20px 0 38px">
	          <div class="siteInfoConatiner">
	              동국대학교<br>웹프로그래밍 
	          </div>
	          <div class="makerInfoConatiner">
	              임치현 | 김민환 | 이수연 | 박고운 <br>
	              © 2022 MyTMI. project
	          </div>
	       </div>
		</footer>
		</div>
		
	</div>
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	
	
</body>
</html>
