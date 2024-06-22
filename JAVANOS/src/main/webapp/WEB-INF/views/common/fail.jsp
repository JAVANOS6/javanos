<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
		alert('${ requestScope.message }');
		
		const code = '${ requestScope.code }';
		if(code === 'userRegist') {
			window.location.replace('${ pageContext.servletContext.contextPath }/user/regist');
		} else if(code === 'userLogin') {
			window.location.replace('${ pageContext.servletContext.contextPath }/user/login');
		} 
	</script>

</body>
</html>