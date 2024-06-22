<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 게시글 상세보기</title>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	<table>
		<tr>
			<th>제목: ${ community.communityTitle }</th>
			<td>조회수: ${ community.communityCount }</td>
		</tr>
		<tr>
			<td>작성일: ${ community.communityEnrollDate }</td>
			<td>작성자: ${ community.user.userNickname }</td>
		</tr>
		<tr>
			<td>
			사진 나오는 곳
			</td>
		</tr>
		<tr>
			<td>내용: ${ community.communityBody }</td>
		</tr>
	</table>
	
		<button onclick="gomModifypage()">수정</button>
		<button>삭제</button>
<%-- 	<c:if test="${ sessionScope.loginUser.userId eq community.userNo }">
	</c:if> --%>
	<script>
	function gomModifypage() {
		let communityNo = ${ community.communityNo }
		location.href="${pageContext.servletContext.contextPath}/community/modify?communityNo="+ communityNo;
	}
	
	</script>
</body>
</html>