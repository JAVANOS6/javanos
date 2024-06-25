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
		/* alert('${ requestScope.message }');
		
		const code = '${ requestScope.code }';
		console.log(code);
		switch(code) {
			case "joinUser":
				window.location.replace('${ pageContext.servletContext.contextPath }/user/join');
				break;
			case "loginUser":
				window.location.replace('${ pageContext.servletContext.contextPath }/user/login');
				break;
			case "updateUser":
				window.location.replace('${ pageContext.servletContext.contextPath }/user/mypage');
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
		} */
	</script>

</body>
</html>