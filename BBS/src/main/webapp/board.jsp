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
<link rel="stylesheet" href="css/custom.css">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/board.css">
<title>MyTMI</title>
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
         <div class="logoContainer" style="margin-left : -80px">
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
		<div class="row" style="padding-top : 90px">
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
