<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<header id="mainPageHeader">
      <nav class="headerContainer">
         <div class="logoContainer" style="margin-left : -80px">
            <a href="main.jsp"><img id="logo" src="images/logo.png"></a>  
         </div>         
         
          
          <%-- 로그인 버튼을 로그아웃 버튼으로 바꾸기 --%>
 		   <div class="BoardButtonContainer">
 		   		<button id="board" type="button"><a href="board.jsp">게시판</a></button>
 		   </div>
           
           <div class="signUpButtonContainer">
              <% 
               if(session.getAttribute("userid")==null){%>
                     <button id="signUp" type="button"><a href="join.jsp">회원가입</a></button><%
               }
            %>
           </div>
           <!-- <div class="myPageButtonContainer">
           	  <% 
	           	if(session.getAttribute("userid")==null){%>
	            	<button id="mypage" type="button">게시판</button><%
	   			}
           	 %>
           </div> -->
      </nav>
    </header>
	<div class="container"style="padding-top : 90px">
		<div class="col-lg-4" ></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px;">
				<form method="post" action="loginAction.jsp">
					<h3 style="text-align: center;">로그인 화면</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="20">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호" name="userPassword" maxlength="20">
					</div>
					<input type ="submit" class="btn-primary form-control" value="로그인">
				</form>
			</div>
		</div>
		<div class="col-lg-4"></div> 
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>
