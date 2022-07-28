<%@page import="bbs.BbsDAO"%>
<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("UTF-8");
	String userID = (String) session.getAttribute("userID");
%>
<jsp:useBean id="bbs" class="bbs.Bbs" scope="page" />
<jsp:setProperty property="*" name="bbs"/>  <!-- * 해두면 모든걸 호출한다. -->
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
<%
	BbsDAO bbsDAO = new BbsDAO();
	/* bbs.setUserID(userID); */
	
	/* <> 를 문자로 바꿔 이미지 태그를 못하게 막는다. */
	/* String bbsContent = bbs.getBbsContent().replaceAll("<", "&lt;").replaceAll(">", "&gt;");
	bbs.setBbsContent(bbsContent);
	 */
	int res = bbsDAO.delete(bbs.getBbsID());
	
	switch(res){
	case 1 : response.sendRedirect("bbs.jsp"); break;
	default : response.sendRedirect("update.jsp?bbsID="+bbs.getBbsID()); break;
	}
%>
</body>
</html>