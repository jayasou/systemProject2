<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메인_ 로그인 화면</title>
<script type="text/javascript">
function measure(){
	var sid = document.loginForm.id.value;
	window.open('measureBrainWave.jsp?id='+sid,'_blank','width = 600, height=400');	
}
function loginSubmit(){
	//if(idCheck == 't'){
	document.loginForm.submit();
	//}
	//else{
		//alert("아이디 중복체크를 해주세요");
	//}
}
</script>
</head>
<body>
	<center>
		<form name="loginForm" method="post" action="logIn.jsp">
			<b>로그인</b> <br> <br> <br> <br> <br>
			<input type = hidden name = "checker" value = "f">
			<table border="1">
				<tr>
					<td>아이디</td>
					<td style="border: hidden;"><input type="text" name="id"></td>
				</tr>
				<tr>
					<td>패스워드</td>
					<td style="border: hidden;"><input type="password"
						name="password"></td>
				</tr>
				<tr>
					<td>뇌파 측정</td>
					<td style="border: hidden;"><input type="button"
						value="뇌파 측정하기" onClick="measure();"></td>
					<td colspan="2" style="border: hidden;" align="center"><input
						type="button" value="로그인" onClick="loginSubmit()"></td>
				</tr>

			</table>
		</form>
		<br> <input type="button" class="btn btn-primary col-xs-2"
			style="float: center; margin-right: 5px;" value="회원 가입"
			onClick="javascript:location.href='memberRegister.jsp'" />

	</center>
</body>
</html>