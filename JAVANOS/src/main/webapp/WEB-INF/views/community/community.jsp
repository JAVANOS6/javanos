<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티</title>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	<c:forEach items="${ communityList}" var="community">
		<div>
			<table onclick="showCommunityDeatil(${community.communityNo})">
			<tr>
				<td>사진 넣는 곳</td>
			</tr>
			<tr>
				<td><c:out value="${community.communityTtile}"></c:out></td>
			</tr>
		</table>
		</div>
	</c:forEach>
	
	
	<script>
		function showCommunityDeatil(communityNo) {
			load.href="${pageContext.servletContext.contextPath}/community/deatil?communityNo="+ communityNo;
		}
	</script>
</body>
</html>