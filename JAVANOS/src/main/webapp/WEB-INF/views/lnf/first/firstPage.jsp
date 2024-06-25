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
	
	<div>
		<h2>분실물 찾기</h2>
		<br>
		<form action="${ pageContext.servletContext.contextPath }/board/list" method="post">
			<table>
			<!-- 호선 선택 -->
				<tr>
					<td>호선</td>
					<td>
						<select name="staLine">
							<c:forEach var="station" items="${stationList}">
								<option value="${station.stationLine}">${station.stationLine}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				
			<!-- 호선 필터링해서 역 선택; 비동기 통신으로 가지고 오기 -->
				<tr>
					<td>역</td>
					<td>
						<select name="staName">
							<option value=""></option>
							<option value=""></option>
						</select>
					</td>
				</tr>
				
			<!-- 날짜 범위 설정 -->
				<tr>
					<td>기간</td>
					<td>
						<input type="date" name="startDate"/>
						~
        				<input type="date" name="endDate"/>
					</td>
				</tr>
			
			</table>
				<br>
				
			<div align="center">
				<button type="submit">찾기</button>
			</div>
		
		</form>		
	</div>	
	
	<div>
		<h2>분실물 등록하기</h2>
		<br>
		<form action="${ pageContext.servletContext.contextPath }/board/insert" method="post">
			<table>
			<!-- 호선 선택 -->
				<tr>
					<td>호선</td>
					<td>
						<select name="staLine">
							<option value="1">1호선</option>
							<option value="2">2호선</option>
						</select>
					</td>
				</tr>
				
			<!-- 호선 필터링해서 역 선택 -->
				<tr>
					<td>역</td>
					<td>
						<select name="staName">
							<option value="what">아몰라</option>
							<option value=""></option>
						</select>
					</td>
				</tr>
				
			<!-- 발견 일 등록 -->
				<tr>
					<td>발견일</td>
					<td>
						<input type="date" name="findDate"/>
					</td>
				</tr>		
			</table>
				<br>
			<div align="center">
				<button type="submit">글쓰기</button>
			</div>	
		</form>		
	</div>	
	
</body>
</html>