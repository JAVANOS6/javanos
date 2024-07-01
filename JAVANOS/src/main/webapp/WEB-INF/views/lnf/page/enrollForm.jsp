<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>습득 글 작성 - 분실물 게시판</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 20px;
        }
        .table-area {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        table, th, td {
            border: 1px solid #ddd;
            text-align: center;
        }
        th, td {
            padding: 10px;
        }
        th {
            background-color: #f2f2f2; /* 밝은 회색 배경 */
            color: #333; /* 검은색 글자 */
        }
        input[type="text"], select, textarea {
            padding: 10px;
            font-size: 16px;
            border-radius: 5px;
            border: 1px solid #ccc;
            width: 100%;
            box-sizing: border-box; /* 내용 박스 크기를 포함한 전체 상자 크기 설정 */
        }
        input[type="date"], input[type="time"] {
            padding: 10px;
            font-size: 16px;
            border-radius: 5px;
            border: 1px solid #ccc;
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
        button[type="reset"] {
            background-color: #6c757d; /* 회색으로 변경 */
        }
        button[type="reset"]:hover {
            background-color: #5a6268; /* hover 시 더 짙은 회색으로 변경 */
        }
    </style>
    <script>
        function cancelAction() {
            window.location.href = "${pageContext.servletContext.contextPath}/lnf/first";
        }
    </script>
</head>
<body>

    <jsp:include page="../../common/menubar.jsp"/>

<div id = "wrap">
    <section>
    <div>
        <br>
        <h2 align="center">게시판 작성</h2>
        <div class="table-area">
            <form action="${pageContext.servletContext.contextPath}/lnf/insert" method="post">
                <table>
                    <tr>
                        <td>호선</td>
                        <td>
                            <select name="staLine">
                                <option value="1">1호선</option>
                                <option value="2">2호선</option>
                                <option value="3">3호선</option>
                                <option value="4">4호선</option>
                                <option value="5">5호선</option>
                                <option value="6">6호선</option>
                                <option value="7">7호선</option>
                                <option value="8">8호선</option>
                                <option value="9">9호선</option>
                                <option value="경의중앙선">경의중앙선</option>
                                <option value="공항철도">공항철도</option>
                                <option value="수인분당선">수인분당선</option>
                            </select>
                        </td>
                        <td>역</td>
                        <td>
                            <input type="text" name="staName">
                        </td>
                        <td>발견일</td>
                        <td>
                            <input type="date" name="findDate">
                        </td>
                        <td>발견 시간</td>
                        <td>
                            <input type="time" name="findTime">
                        </td>
                    </tr>
                    <tr>
                        <td>분실 품목</td>
                        <td colspan="3">
                            <input type="text" name="missing" style="width: 100%;">
                        </td>
                        <td>보관 장소</td>
                        <td colspan="3">
                            <input type="text" name="keep" style="width: 100%;">
                        </td>
                    </tr>
                    <tr>
                        <td>상세 설명</td>
                        <td colspan="7">
                            <textarea name="description" cols="100" rows="15" style="resize: none; width: 100%;"></textarea>
                        </td>
                    </tr>
                </table>
                <br>
                <div align="center">
                    <button type="button" onclick="cancelAction()">취소</button>
                    <button type="submit">등록</button>
                </div>
            </form>
        </div>
    </div>
</section>
</div>

</body>
</html>
