<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<link rel="stylesheet" href="css/mainpage2.css">

<title>JSP 게시판 웹 사이트</title>
<style type="text/css">
	a, a:hover {
	color: #000000;
	text-decoration: none;
	}
</style>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
		int pageNumber = 1;
		if(request.getParameter("pageNumber") != null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
	%>
	
	<header id="mainPageHeader">
      <nav class="headerContainer">
         <div class="logoContainer">
            <a href="main.jsp"><img id="logo" src="images/logo.png"></a>  
         </div>         
         
          <button id="login" type="button"><a href="board.jsp">게시판</a></button>
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
	
	<!-- <nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">JSP 게시판 웹 사이트</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">메인</a></li>
				<li class="active"><a href="bbs.jsp">게시판</a></li>
			</ul>
			<%
				if(userID == null){
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">로그인</a></li>
						<li><a href="join.jsp">회원가입</a></li>
					</ul>
				</li>
			</ul>
			<% 		
				} else {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">회원관리<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="logoutAction.jsp">로그아웃</a></li>
					</ul>
				</li>
			</ul>
			<% 
				}
			%>
		</div>
	</nav> -->
	
	
	
	<div class="container">
		<div class="row" style="padding-top: 90px">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align:center;">번호</th>
						<th style="background-color: #eeeeee; text-align:center;">제목</th>
						<th style="background-color: #eeeeee; text-align:center;">작성자</th>
						<th style="background-color: #eeeeee; text-align:center;">작성일</th>
					</tr>
				</thead>
				<tbody>
					<%
						BbsDAO bbsDAO = new BbsDAO();
						ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
						for(int i = 0; i < list.size(); i++){
					%>
					<tr>
						<td><%= list.get(i).getBbsID() %></td>
						<td><a href = "view.jsp?bbsID=<%= list.get(i).getBbsID() %>"><%= list.get(i).getBbsTitle() %></a></td>
						<td><%= list.get(i).getUserID() %></td>
						<td><%= list.get(i).getBbsDate().substring(0, 11) + list.get(i).getBbsDate().substring(11, 13) + "시 " + list.get(i).getBbsDate().substring(14, 16) + "분" %></td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
			<%
				if(pageNumber != 1){
			%>
				<a href="board.jsp?pageNumber=<%=pageNumber - 1 %>" class="btn btn-success btn-arrow-left">이전</a>
			<% 		
				} if(bbsDAO.nextPage(pageNumber + 1)){
			%>
				<a href="board.jsp?pageNumber=<%=pageNumber + 1 %>" class="btn btn-success btn-arrow-left">다음</a>
			<% 		
				}
			%>
			<a href = "write.jsp" class="btn btn-primary pull-right">글쓰기</a>
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
	
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>