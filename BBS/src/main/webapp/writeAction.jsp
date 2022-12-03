<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.File" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="bbs.Bbs" %>   
<%@ page import="bbs.BbsDAO" %>    
<%@ page import="java.io.PrintWriter" %>    
<% request.setCharacterEncoding("UTF-8"); %>    
<jsp:useBean id="bbs" class="bbs.Bbs" scope="page"/>
<jsp:setProperty name="bbs" property="bbsTitle"/>
<jsp:setProperty name="bbs" property="bbsContent"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<%
		String userID = null;
	    if(session.getAttribute("userID") != null) {
	    	userID = (String) session.getAttribute("userID");
	    }
	    
	    String realFolder = request.getServletContext().getRealPath("/storage");
		String saveFolder = "/storage";
		String encType = "utf-8";
		int maxSize=5*1024*1024;
		
		ServletContext context = this.getServletContext();
		realFolder = context.getRealPath(saveFolder);
		
		MultipartRequest  multi = null;
		multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());	

		String fileName = multi.getFilesystemName("fileName");
		String bbsTitle = multi.getParameter("bbsTitle");
		String bbsContent = multi.getParameter("bbsContent");
		
		bbs.setBbsTitle(bbsTitle);
		bbs.setBbsContent(bbsContent);
	    
	    
	    if(userID == null){
	    	PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
	    } else{
	    	if(bbs.getBbsTitle() == null || bbs.getBbsContent() == null) {
	    				PrintWriter script = response.getWriter();
	    				script.println("<script>");
	    				script.println("alert('입력이 안 된 사항이 있습니다.')");
	    				script.println("history.back()");
	    				script.println("</script>");
	    			} else{
	    				if(fileName != null){
    						File file = new File(realFolder+"/"+fileName);
    						//File newFile = new File(realFolder+"/"+ bbsID + "사진.jpg");
    						//oldFile.renameTo(newFile);
    					}
	    				
	    				BbsDAO bbsDAO = new BbsDAO();
	    				int result = bbsDAO.write(bbs.getBbsTitle(), userID ,bbs.getBbsContent(), fileName);
	    				if(result == -1){
	    					PrintWriter script = response.getWriter();
	    					script.println("<script>");
	    					script.println("alert('글쓰기에 실패했습니다.')");
	    					script.println("history.back()");
	    					script.println("</script>");
	    				}
	    				else {
	    					PrintWriter script = response.getWriter();
	    					
	    					script.println("<script>");
	    					script.println("location.href = 'board.jsp'");
	    					script.println("</script>");
	    				}
	    			}
	    }
	%>
</body>
</html>
