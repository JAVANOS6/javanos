<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- 새로운 공지사항 작성 화면 폼 -->
	<jsp:include page="../common/menubar.jsp"/>
	
	<button onclick="moveLocation('insertNotice')">작성 페이지로 이동</button>
	
	<div class="outer outer-notice-insert">
		<br>
		<h2 align="center">공지 사항 작성</h2>
		<div class="table-area">
			<%-- form action: form 안의 입력값이 전송될 url / method: post방식으로 보내짐
			${pageContext.servletContext.contextPath}: jsp에서 현재 웹 애플리케이션의 루트 경로를 동적으로 가져오는 기능임 --%>
			<form action="${ pageContext.servletContext.contextPath }/notice/insert" method="post">
				<table>
					<tr>
						<td>제목 </td>
						<td><input type="text" size="50" name="title"></td>
					</tr>
					<tr>
						<td>작성자 </td>
						<td>
							<!-- 작성자: 로그인한 사용자의 닉네임 표시, 수정 못함
							sessionScope: 현재 사용자의 세션에 저장된 데이터에 접근 / loginMember: 로그인한 사용자 정보를 담고있음 / nickname: 사용자 닉네임 -->
							<input type="text" value="${ sessionScope.loginUser.userNickname }" name="writer" readonly>
						</td>
					</tr>
					<tr>
						<td>내용 </td>
					</tr>
					<tr>
						<td colspan="2">
							<textarea name="body" cols="60" rows="15" style="resize:none;" required></textarea>
						</td>
					</tr>
				</table>
				<br>
				<div align="center">
					<!-- 취소하기(reset)되면 위의 입력된 모든 값이 초기화됨(삭제됨) / id: js나 css에서 불러올때 쓰려고해놓은 이름 -->
					<button type="reset" id="cancleNotice">취소</button>
					<!-- 등록하기(submit)되면 form action 속성의 url로 데이터가 전송됨 -->
					<button type="submit">등록</button>
				</div>
			</form>
		</div>
	</div>


</body>
</html>

<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 사항 작성</title>
</head>
<body>

<jsp:include page="../common/menubar.jsp"/>

<button onclick="moveLocation('insertNotice')">작성 페이지로 이동</button>

<div class="outer outer-notice-insert">
    <br>
    <h2 align="center">공지 사항 작성</h2>
    <div class="table-area">
        <form action="${pageContext.servletContext.contextPath}/notice/insert" method="post">
            <table>
                <tr>
                    <td>제목</td>
                    <td><input type="text" size="50" name="title" required></td>
                </tr>
                <tr>
                    <td>작성자</td>
                    <td><input type="text" value="${sessionScope.loginUser.userNickname}" name="writer" readonly></td>
                </tr>
                <tr>
                    <td>내용</td>
                </tr>
                <tr>
                    <td colspan="2">
                        <textarea name="body" cols="60" rows="15" style="resize:none;" required></textarea>
                    </td>
                </tr>
            </table>
            <br>
            <div align="center">
                <!-- 취소 버튼 -->
                <button type="button" id="cancelNotice">취소</button>
                <!-- 등록 버튼 -->
                <button type="submit">등록</button>
            </div>
        </form>
    </div>
</div>

<script>
    // 취소 버튼 클릭 시 공지사항 목록 페이지로 이동하는 함수
    document.getElementById("cancelNotice").onclick = function() {
        location.href = "${pageContext.servletContext.contextPath}/notice/list";
    };

    // 작성 페이지로 이동하는 함수
    function moveLocation(destination) {
        var movePath = "${pageContext.servletContext.contextPath}";
        switch(destination) {
            case "insertNotice":
                movePath += "/notice/insert";
                break;
            default:
                break;
        }
        location.href = movePath;
    }
</script>

</body>
</html> --%>
