<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색 - 분실물 게시판</title>
</head>
<body>

<jsp:include page="../../common/menubar.jsp"/>

<div id = "wrap">
<section>
<div>
		<br>
		<h2 align="center">검색/h2>
		<div>
			<table align="center" id="searchResultTable">
				<thead>
					<tr>
					<th>#</th>
                	<th>습득 호선</th>
                	<th>습득 역</th>
                	<th>분실 품목</th>
                	<th>등록일</th>
                	<th>발견일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${boardList}" var="lnfBoard">
                	<tr>
                    	<td>${lnfBoard.lnfNo}</td>
                    	<td>${lnfBoard.lnfStaLine}</td> <!-- 습득 호선 -->
                    	<td>${lnfBoard.lnfStaName}</td> <!-- 습득 역 -->
                    	<td>${lnfBoard.missing}</td> <!-- 분실 품목 -->
                    	<td>${lnfBoard.enrollDate}</td> 
                    	<td>${lnfBoard.findDate}</td> 
                </tr>
            </c:forEach>
					<c:if test="${ empty searchResultList }">
						<tr>
							<td colspan="5" align="center">검색 결과가 없습니다.</td>
						</tr>
					</c:if>
				</tbody>
			</table>
		</div>
		<div class="search-area" align="center">
			<form id="searchForm"
				action="${pageContext.servletContext.contextPath}/lnf/search"
				method="GET">
				<select id="searchCondition" name="searchCondition">
					<option value="staLine">호선</option>
					<option value="staName">호선</option>
					<option value="missing">분실 품목 </option>
				</select> <input type="search" name="keyword">
				<button type="submit">검색하기</button>
			</form>

		</div>
	</div>
</section>
</div>

</body>
</html>