<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/notice/event.js"></script>

</head>
<body>


	<jsp:include page="../common/menubar.jsp" />

	<div class="outer outer-notice-list">
		<br>
		<h2 align="center">공지사항</h2>
		<div class="table-area">
			<table align="center" id="listArea">
				<tr>
					<th>번호</th>
					<th width="300px">제목</th>
					<th width="100px">작성자</th>
					<th>조회수</th>
					<th width="100px">작성일</th>
				</tr>
				각각의 공지사항 정보를 테이블 형태로 반복 출력
				var: 반복 중 사용할 각 요소를 지칭하는 변수?!
				<c:forEach items="${ noticeList }" var="notice">
					<tr>
						<td><c:out value="${ notice.noticeNo }" /></td>
						<td><c:out value="${ notice.noticeTitle }" /></td>
						<td><c:out value="${ notice.noticeWriter.userNickname }" /></td>
						<td><c:out value="${ notice.noticeCount }" /></td>
						<td><c:out value="${ notice.noticeEnrollDate }" /></td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div class="search-area" align="center">
			<select id="searchCondition" name="searchCondition">
				<option value="writer">작성자</option>
				<option value="title">제목</option>
				<option value="content">내용</option>
			</select> <input type="search">
			<button type="submit">검색하기</button>

			관리자인 경우에만 작성하기 버튼이 보여짐
			<c:if test="${ sessionScope.loginUser.userRole eq 'ROLE_ADMIN' }">
				<button id="writeNotice">작성</button>
			</c:if>
		</div>
	</div>

	<script>
		if(document.getElementsByTagName("td")) {
			const $tds = document.getElementsByTagName("td");
			for(let i = 0; i < $tds.length; i++) {
				
				$tds[i].onmouseenter = function() {
					this.parentNode.style.backgroundColor = "pink";
					this.parentNode.style.cursor = "pointer";
					this.parentNode.style.textAlign = "center";
					this.parentNode.style.verticalAlign = "middel";
				}
				
				$tds[i].onmouseout = function() {
					this.parentNode.style.backgroundColor = "white";
				}
				
				$tds[i].onclick = function() {
					
					const no = this.parentNode.children[0].innerText;
					/* 공지사항 클릭 시 상세정보 페이지로 이동함 */
					location.href = "${ pageContext.servletContext.contextPath }/notice/detail?no=" + no;
				}
				
			}
			
		}
		
		/* 제이쿼리 이용하는 경우 */
		/* $(function() {
			$("#listArea td").hover(function() {
				$(this).parent().css({"background":"orangered", "cursor":"pointer"});
			}, function() {
				$(this).parent().css({"background":"black"});
			}).click(function() {
				const no = $(this).parent().children(":eq(0)").text();
				location.href = "${ pageContext.servletContext.contextPath }/notice/detail?no=" + no;
			});
		}); */
	</script>



</body>
</html> --%>

<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 목록</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/notice/event.js"></script>

<script>
    // JavaScript로 작성 버튼 클릭 이벤트 처리
    window.onload = function() {
        // 작성 버튼 클릭 시 작성 페이지로 이동
        const writeButton = document.getElementById("writeNotice");
        if (writeButton) {
            writeButton.onclick = function() {
                location.href = "${pageContext.servletContext.contextPath}/notice/insert";
            }
        }
    };
</script>
</head>
<body>

<jsp:include page="../common/menubar.jsp" />

<div class="outer outer-notice-list">
    <br>
    <h2 align="center">공지사항</h2>
    <div class="table-area">
        <table align="center" id="listArea">
            <tr>
                <th>번호</th>
                <th width="300px">제목</th>
                <th width="100px">작성자</th>
                <th>조회수</th>
                <th width="100px">작성일</th>
            </tr>
            <c:forEach items="${ noticeList }" var="notice">
                <tr>
                    <td><c:out value="${ notice.noticeNo }" /></td>
                    <td><c:out value="${ notice.noticeTitle }" /></td>
                    <td><c:out value="${ notice.noticeWriter.userNickname }" /></td>
                    <td><c:out value="${ notice.noticeCount }" /></td>
                    <td><c:out value="${ notice.noticeEnrollDate }" /></td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <div class="search-area" align="center">
        <select id="searchCondition" name="searchCondition">
            <option value="writer">작성자</option>
            <option value="title">제목</option>
            <option value="content">내용</option>
        </select> <input type="search">
        <button type="submit">검색하기</button>

        <c:if test="${ sessionScope.loginUser.userRole eq 'ROLE_ADMIN' }">
            <!-- 관리자인 경우에만 작성 버튼이 보여집니다. -->
            <button id="writeNotice">작성</button>
        </c:if>
    </div>
</div>

</body>
</html>
 --%>
 
 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 목록</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/notice/event.js"></script>

<script>
    // JavaScript로 작성 버튼 클릭 이벤트 처리
    window.onload = function() {
        // 작성 버튼 클릭 시 작성 페이지로 이동
        const writeButton = document.getElementById("writeNotice");
        if (writeButton) {
            writeButton.onclick = function() {
                location.href = "${pageContext.servletContext.contextPath}/notice/insert";
            }
        }

        // 각 공지사항 행 클릭 시 상세보기 페이지로 이동
        const noticeRows = document.querySelectorAll("#listArea tr");
        noticeRows.forEach(function(row) {
            row.onclick = function() {
                const noticeNo = this.cells[0].innerText.trim(); // 첫 번째 셀의 텍스트(공지번호)
                location.href = "${pageContext.servletContext.contextPath}/notice/detail?no=" + noticeNo;
            };
        });
    };
</script>
</head>
<body>

<jsp:include page="../common/menubar.jsp" />

<div class="outer outer-notice-list">
    <br>
    <h2 align="center">공지사항</h2>
    <div class="table-area">
        <table align="center" id="listArea">
            <tr>
                <th>번호</th>
                <th width="300px">제목</th>
                <th width="100px">작성자</th>
                <th>조회수</th>
                <th width="100px">작성일</th>
            </tr>
            <c:forEach items="${ noticeList }" var="notice">
                <tr>
                    <td><c:out value="${ notice.noticeNo }" /></td>
                    <td><c:out value="${ notice.noticeTitle }" /></td>
                    <td><c:out value="${ notice.noticeWriter.userNickname }" /></td>
                    <td><c:out value="${ notice.noticeCount }" /></td>
                    <td><c:out value="${ notice.noticeEnrollDate }" /></td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <div class="search-area" align="center">
        <select id="searchCondition" name="searchCondition">
            <option value="writer">작성자</option>
            <option value="title">제목</option>
            <option value="content">내용</option>
        </select> <input type="search">
        <button type="submit">검색하기</button>

        <c:if test="${ sessionScope.loginUser.userRole eq 'ROLE_ADMIN' }">
            <!-- 관리자인 경우에만 작성 버튼이 보여집니다. -->
            <button id="writeNotice">작성</button>
        </c:if>
    </div>
</div>

</body>
</html>
 