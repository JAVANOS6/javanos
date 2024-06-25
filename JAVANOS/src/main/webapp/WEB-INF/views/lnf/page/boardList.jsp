<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>분실물 게시판</title>
</head>
<body>
	
	<jsp:include page="../../common/menubar.jsp"/>
	
	<!-- 게시글 출력할 것 -->
	<div>
		<table>
			<tr>
				<th>#</th>
				<th>습득 호선</th>
				<th>습득 역</th>
				<th>분실 품목</th>
				<th>등록일</th>
				<th>발견일</th>
			</tr>
			<c:forEach var="lnfBoard" items="${ requestScope.boardList }">
			<tr>
				<td><c:out value="${ board.no }"/></td>
				<td><c:out value="${ board.sta.line }"/></td>
				<td><c:out value="${ board.sta.date }"/></td>
				<td><c:out value="${ board.missing }"/></td>
				<td><c:out value="${ board.enroll.date }"/></td>
				<td><c:out value="${ board.find.date }"/></td>
			</tr>
			</c:forEach>
		</table>
	</div>
	
	<!-- 검색 -->

</body>
</html>