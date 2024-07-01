<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 수정 - 분실물 게시판</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 20px;
        }
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        table, th, td {
            border: 1px solid #ccc;
        }
        th, td {
            padding: 10px;
            text-align: center;
        }
        th {
            background-color: #f2f2f2; /* 밝은 회색 배경 */
            color: #333; /* 검은색 글자 */
        }
        button {
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            border: none;
            cursor: pointer;
            margin-right: 10px;
            border-radius: 5px;
        }
        button:hover {
            background-color: #0056b3;
        }
        button#cancel {
            background-color: #dc3545;
        }
        button#cancel:hover {
            background-color: #bd2130;
        }
    </style>
</head>
<body>

    <jsp:include page="../../common/menubar.jsp"/>

    <h2 style="text-align: center;">게시글 수정</h2>
<div id = "wrap">
    <section>
    <div align="center">
        <form action="${pageContext.servletContext.contextPath}/lnf/modify" method="post">
            <table>
                <tr>
                    <th>습득 호선</th>
                    <th>습득 역</th>
                    <th>발견일</th>
                    <th>등록일</th>
                    <th>분실 품목</th>
                    <th>보관 장소</th>
                    <th>상세 설명</th>
                </tr>
                <c:forEach items="${boardList}" var="lnfBoard">
                    <tr>
                        <td><c:out value="${lnfBoard.lnfStaLine}"/></td> <!-- 습득 호선 -->
                        <td><c:out value="${lnfBoard.lnfStaName}"/></td> <!-- 습득 역 -->
                        <td><c:out value="${lnfBoard.findDate}"/></td> <!-- 발견일 -->
                        <td><c:out value="${lnfBoard.findTime}"/></td> 
                        <td><c:out value="${lnfBoard.enrollDate}"/></td> <!-- 등록일 -->
                        <td><c:out value="${lnfBoard.missing}"/></td> <!-- 분실 품목 -->
                        <td><c:out value="${lnfBoard.keep}"/></td> <!-- 보관 장소 -->
                        <td><c:out value="${lnfBoard.description}"/></td> <!-- 상세 설명 -->
                    </tr>
                </c:forEach>
            </table>

            <div align="center">
                <button type="reset" id="cancel">취소하기</button>
                <button type="submit">수정하기</button>
            </div>
        </form>
    </div>
  	</section>
</div>

</body>
</html>
