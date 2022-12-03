<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/board.css">
<link rel="stylesheet" href="css/custom.css">
<title>MyTMI</title>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
		
		if(userID == null){
	    	PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
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
	<div class="container" style="padding-top: 90px">
		<div class="row">
			<form method="post" enctype = "multipart/form-data" action="writeAction.jsp?keyValue=multipart/form-data">
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="2" style="background-color: #eeeeee; text-align:center;">게시판 글쓰기 양식</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="text" class="form-control" placeholder="글 제목" name="bbsTitle" maxlength="50"></td>
					</tr>
					<tr>
						<td><textarea class="form-control" placeholder="글 내용" name="bbsContent" maxlength="2048" style="height: 350px"></textarea></td>
					</tr>
					<tr>
						<td><input type="file" name="fileName"></td>
					</tr>
				</tbody>
			</table>
			<input type="submit" class="btn btn-primary pull-right" value="글쓰기">
			</form>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>
