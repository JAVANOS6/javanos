<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 게시글 작성</title>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	<div>
		<h2>커뮤니티 게시글 작성</h2>
			<br>
			<form action="${pageContext.servletContext.contextPath}/community/insert" method="post" enctype="multipart/form-data">
				<div class="thumbnail-insert-area">
					<table>
							<tr>
								<td>제목</td>
								<td>
									<input type="text" name="communityTitle">
								</td>
							</tr>
							<tr>
								<td>썸네일 이미지</td>
								<td>
									<div class="title-img-area" id="titleImgArea">
										<img id="titleImg">
									</div>
								</td>
							</tr>
							<tr>
								<td>내용 사진</td>
								<td>
									<div class="body-img-area1" id="bodyImgArea1">
										<img id="bodyImg1">
									</div>	
								</td>
								<td>
									<div class="body-img-area2" id="bodyImgArea2">
										<img id="bodyImg2">
									</div>	
								</td>
								<td>
									<div class="body-img-area3" id="bodyImgArea3">
										<img id="bodyImg3">
									</div>	
								</td>
							</tr>
							<tr>
								<td>내용</td>
								<td>
									<textarea name="communityBody" rows="5" cols="50" style="resize:none;"></textarea>
								</td>
							</tr>
						</table>
						<div class="thumbnail-file-area">
							<input type="file" id="thumbnailImg1" name="thumbnailImg1" onchange="loadImg(this,1)">
							<input type="file" id="thumbnailImg2" name="thumbnailImg2" onchange="loadImg(this,2)">
							<input type="file" id="thumbnailImg3" name="thumbnailImg3" onchange="loadImg(this,3)">
							<input type="file" id="thumbnailImg4" name="thumbnailImg4" onchange="loadImg(this,4)">
						</div>
				</div>
				<br>
				<input type="hidden" name="userNo" value="${ sessionScope.loginUser.userNo }">
				<div>
					<button type="submit">등록</button>
					<button onclick="gobackList()">취소</button>
				</div>
			</form>
			
			<script>
				const $titleImgArea = document.getElementById("titleImgArea");
				const $bodyImgArea1 = document.getElementById("bodyImgArea1");
				const $bodyImgArea2 = document.getElementById("bodyImgArea2");
				const $bodyImgArea3 = document.getElementById("bodyImgArea3");
				
				$titleImgArea.onclick = function() { 
					document.getElementById("thumbnailImg1").click(); 
				}
				
				$bodyImgArea1.onclick = function() {
					document.getElementById("thumbnailImg2").click();
				}
				
				$bodyImgArea2.onclick = function() {
					document.getElementById("thumbnailImg3").click();
				}
				
				$bodyImgArea3.onclick = function() {
					document.getElementById("thumbnailImg4").click();
				}
				
				function loadImg(value, num) {
					if (value.files && value.files[0]) {
						//파일 입력 요소에서 선택된 파일 리스트/ 그 중 첫번재 파일
						const reader = new FileReader();
						reader.onload = function(e) {
							switch(num){
							case 1:
								document.getElementById("titleImg").src = e.target.result;//파일의 데이터 url, 이미지 소스로 설정되어 브라우저에 이미지 표시
								break;
							case 2:
								document.getElementById("bodyImg1").src = e.target.result;
								break;
							case 3:
								document.getElementById("bodyImg2").src = e.target.result;
								break;
							case 4:
								document.getElementById("bodyImg3").src = e.target.result;
								break;
							}
						}
						reader.readAsDataURL(value.files[0]);
						// 파일을 읽고, 결과를 데이터 url형식으로 반환
						// 반환된 결과는 reader.onload 이벤트 핸들러에서 처리됨
					}
				}
				/* 
					파일 입력 요소에서 파일이 입력되면, 해당 파일을 읽고 데이터  url 형식으로 변환하여 지정된 이미지 요소에 미리보기를 표시
					'num' 매개변수를 사용하여 어떤 이미지 요소에 이미지를 표시할지를 결정
					사용자는 파일 선택시 즉시 미리보기 가능
				*/
			
			
				function gobackList() {
					window.history.back();
					//혹시 모르니까
					/* location.href="${pageContext.servletContext.contextPath}/community/list";  */
				}
			</script>
		</div>

</body>
</html>