<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="gallery.Gallery" %>
<%@ page import="gallery.GalleryDAO" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- <meta name="viewport" content="width=device-width", initial-scale="1">

<link rel="stylesheet" href="css/custom.css"> --> 

<link rel="stylesheet" href="css/mainpage2.css">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css">

<title>MyTMI</title>
</head>
<body>
	<div class="wrapper">
		<!-- 헤더 -->
		<header id="mainPageHeader">
      <nav class="headerContainer">
         <div class="logoContainer">
            <a href="main.jsp"><img id="logo" src="images/logo.png"></a>  
         </div>         
         
          
          <%-- 로그인 버튼을 로그아웃 버튼으로 바꾸기 --%>
 		   <div class="BoardButtonContainer">
 		   		<button id="board" type="button"><a href="board.jsp">게시판</a></button>
 		   </div>
           <div class="LoginButtonContainer">
              <% 
               if(session.getAttribute("userID")==null){%>
                     <button id="login" type="button"><a href="login.jsp">로그인</a></button><%}
               else{
                  %><%=session.getAttribute("userID")%>님 환영합니다!<button align="right" id="logout" type="button" onclick="location.href='logoutAction.jsp'">로그아웃</button><br>
                  
               <%}
            %>
           </div>
           <div class="signUpButtonContainer">
              <% 
               if(session.getAttribute("userID")==null){%>
                     <button id="signUp" type="button"><a href="join.jsp">회원가입</a></button><%
               }
            %>
           </div>
           <div class="myPageButtonContainer">
           	  <% 
	           	if(session.getAttribute("userID")==null){%>
	            	<button id="mypage" type="button">게시판</button><%
	   			}
           	 %>
           </div>
      </nav>
    </header>
   
   
	<div class="container">
		<!-- Carousel -->
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1" ></li>
				<li data-target="#myCarousel" data-slide-to="2" ></li>
			</ol>
			
			<div class="carousel-inner">
				<div class="item active">
					<a href = "https://ktestone.com/kapable.github.io/personalColor2022/"><img src="images/slide1.jpg" ></a>
				</div>
				<div class="item">
					<a href = "https://chemicalmbti.netlify.app/"><img src="images/slide2.jpg" ></a>
				</div>
				<div class="item">
					<a href = "https://ktestone.com/kapable.github.io/flowerBTI/"><img src="images/slide3.jpg" ></a>
				</div>
			</div>
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span>
			</a>
			<a class="right carousel-control" href="#myCarousel" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right"></span>
			</a>
		</div>
		
		<div style="padding-top:20px">
			
		</div>
		
		<!-- gallery -->
		<div class="allGame" id="allGame">
				<ul class="pc cardView">
				
				<%
				GalleryDAO gallDao = new GalleryDAO();
				ArrayList<Gallery> list = gallDao.getList();
				for(int i = 0; i < list.size(); i++){ 
				%>
					<li> 
					<a href ="<%= list.get(i).getTestLink() %>" >
						<div class ="game">
							<span class ="gameImg">
								<img src ="<%=list.get(i).getImgLink() %>" data-img="<%=list.get(i).getImgLink() %>" data-gif width="255" height="170">
							</span>
							<span style="font-family:'Noto Sans KR', sans-serif; color : black; font-size:18px; font-weight:bold; padding:10px 0px 20px 20px;"><%=list.get(i).getTitle() %></span>
							
						</div>
						</a>
					</li>
				<%
				}  
				%>
				</ul>
				
			</div>
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
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	
	
</body>

</html>
