<%@page import="bbs.Bbs"%>
<%@page import="bbs.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String userID = null;
if (session.getAttribute("userID") != null) {
	userID = (String) session.getAttribute("userID");
}

//해당 게시글 가져오는 것
int bbsID = Integer.parseInt(request.getParameter("bbsID"));
Bbs bbs = new BbsDAO().getBbs(bbsID);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>BBS</title>
</head>
<body>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse -1"
				aria-expanded="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">JSP 게시판 웹 사이트</a>
		</div>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">메인</a></li>
				<li class="active"><a href="bbs.jsp">게시판</a></li>
			</ul>
			<%
			if (userID == null) {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">접속하기<span class="caret"></span></a>

					<ul class="dropdown-menu">
						<li><a href="login.jsp">로그인</a></li>
						<li><a href="join.jsp">회원가입</a></li>
					</ul></li>
			</ul>
			<%
			} else {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">접속하기<span class="caret"></span></a>

					<ul class="dropdown-menu">
						<li><a href="logoutAction.jsp">로그아웃</a></li>
					</ul></li>
			</ul>
			<%
			}
			%>
		</div>
	</nav>
	<div class="container">
		<div class="row">
			<form method="post" action="writeAction.jsp">
			<table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
			<thead>
			<tr>
			<th colspan="2" class="table table-striped" style="text-align:center; border:1px solid #dddddd">게시판 글보기</th>
			</tr>
			</thead>
			<tbody>
			<tr>
			<td>제목</td>
			<td><%=bbs.getBbsTitle() %></td>
			</tr>
			<tr>
			<td>작성자</td>
			<td><%=bbs.getUserID() %></td>
			</tr>
			<tr>
			<td>작성일</td>
			<td><%=bbs.getBbsDate() %></td>
			</tr>
			<tr>
			<td>내용</td>
			<td><%=bbs.getBbsContent().replaceAll("\\r\\n", "<br/>") %></td>  <!-- r태그와 n 태그를 br로 수정 -->
			</tr>
			</tbody>
			</table>
			<a href="bbs.jsp" class="btn btn-primary pull-right">목록</a>
			<%if(userID != null && userID.equals(bbs.getUserID())){ %>
			<a href="update.jsp?bbsID=<%=bbs.getBbsID() %>" class="btn btn-primary pull-right">수정</a>
			<a href="deleteAction.jsp?bbsID=<%=bbs.getBbsID() %>" class="btn btn-primary pull-right">삭제</a>
			<%} %>
			</form>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>