<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty property="*" name="user"/>  <!-- * 해두면 모든걸 호출한다. -->
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
<%
	UserDAO userDAO = new UserDAO();
	int res = userDAO.join(user);
	out.print(res);
	
	switch(res){
	case 1 : response.sendRedirect("main.jsp"); break;
	default : response.sendRedirect("join.jsp"); break;
	}
%>
</body>
</html>