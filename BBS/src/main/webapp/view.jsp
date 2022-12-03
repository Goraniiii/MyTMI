<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="java.io.File" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<link rel="stylesheet" href="css/board.css">
<title>MyTMI</title>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
		int bbsID = 0;
		if(request.getParameter("bbsID") != null){
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		if(bbsID == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href = 'board.jsp'");
			script.println("</script>");
		}
		Bbs bbs = new BbsDAO().getBbs(bbsID);
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
		<div class="row" style="padding-top: 90px">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="3" style="background-color: #eeeeee; text-align:center;">게시판 글 보기</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 20%;">글 제목</td>
						<td colspan="2"><%= bbs.getBbsTitle() %></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td colspan="2"><%= bbs.getUserID() %></td>
					</tr>
					<tr>
						<td>작성일자</td>
						<td colspan="2"><%= bbs.getBbsDate().substring(0, 11) + bbs.getBbsDate().substring(11, 13) + "시 " + bbs.getBbsDate().substring(14, 16) + "분" %></td>
					</tr>
					<tr>
						<td>사진</td>
						
						<%
						//String real = "/Users/goraniiii/eclipse-workspace/teamproject/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/BBS/storage";
						File viewFile = new File(request.getServletContext().getRealPath("/storage") + "/" + bbs.getBbsImageUrl());
						if(viewFile.exists()){ %>
							
								<td colspan="6"><img src =storage/<%=bbs.getBbsImageUrl() %> border="300px" width="500px" height="auto"><br><br>
						<% }
						else {%><td colspan="6"><%} %>
					</tr>
					<tr>
						<td>내용</td>
						<td colspan="2" style="min-height: 200px; text-align: left;"><%= bbs.getBbsContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">","&gt").replaceAll("\n","<br>") %></td>
					</tr>
				</tbody>
			</table>
			<a href="board.jsp" class="btn btn-primary">목록</a>
			<%
				if(userID != null && userID.equals(bbs.getUserID())){
			%>
				<a href="update.jsp?bbsID=<%= bbsID %>" class="btn btn-primary">수정</a>
				<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="deleteAction.jsp?bbsID=<%= bbsID %>" class="btn btn-primary">삭제</a>
			<% 		
				}
			%>
			<input type="submit" class="btn btn-primary pull-right" value="글쓰기">
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>
