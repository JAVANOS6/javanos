<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Javanos</title>
</head>
<body>
	<script>
		alert('${ requestScope.message }');
		
		const code = '${ requestScope.successCode }';
		if(code === 'userRegist') {
			window.location.replace('${ pageContext.servletContext.contextPath }/user/regist');
		} else if(code === 'userLogin') {
			window.location.replace('${ pageContext.servletContext.contextPath }/user/login');
		} else if(code === 'communityInsert') {
			window.location.replace('${ pageContext.servletContext.contextPath }/community/list');
		}  else if(code === 'communityDelete') {
			window.location.replace('${ pageContext.servletContext.contextPath }/community/list');
		}  else if(code === 'communityUpdate') {
			window.location.replace('${ pageContext.servletContext.contextPath }/community/detail?communityNo=${ requestScope.communityNo }');
		} 


		/* (function(){
			const successCode = "${ requestScope.successCode }";
			
			let successMessage = "";
			let movePath = "";
			
			switch(successCode){
				case "joinUser" : 
					successMessage = "회원가입에 성공하셨습니다.";
					movePath = "${ pageContext.servletContext.contextPath }";
					break;
				case "updateUser" : 
					successMessage = "정상적으로 수정되었습니다.";
					movePath = "${ pageContext.servletContext.contextPath }/user/mypage";
					break;
				case "deleteUser" : 
					successMessage = "탈퇴가 완료되었습니다.";
					movePath = "${ pageContext.servletContext.contextPath }";
					break;
				case "communityInsert":
					window.location.replace('${ pageContext.servletContext.contextPath }/community/list');
					break;
				case "communityDelete":
					window.location.replace('${ pageContext.servletContext.contextPath }/community/list');
					break;
				case "communityUpdate":
					window.location.replace('${ pageContext.servletContext.contextPath }/community/list');
					break;
			}

			alert(successMessage);
			
			location.replace(movePath);
		})(); */
	
	</script>
</body>
</html>
