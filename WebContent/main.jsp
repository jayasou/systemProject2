<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메인_수정,삭제,로그아웃</title>
</head>
<script>
function logout(){
	window.open('logout.jsp','_blank','width = 600, height=400');	
	location.replace="Main_logIn.jsp";
}
</script>
<body>
<br>
<br>
<br>
<br>
	<center>
		<table>
			<tr>
				<td style="border: hidden;"><center><input type="button"
					class="btn btn-primary col-xs-2" style="margin-right: 5px;"
					value="수정" onClick="javascript:location.href='memberUpdate.jsp'" /></center>
				</td>
			</tr>
			<tr><td style="border: hidden;"><br></td></tr>
			<tr>
				<td style="border: hidden;"> <center><input type="button" class="btn btn-primary col-xs-2"
					style="margin-right: 5px;" value="삭제"
					onClick="location.href='memberDelete.jsp'" /></center>
				</td>
			<tr>
			<tr><td style="border: hidden;"><br></td></tr>
			<tr>
				<td style="border: hidden;"><center><input type="button" class="btn btn-primary col-xs-2"
					style="margin-right: 5px;" value="로그아웃"
					onClick="logout()" /></center>
				</td>
			</tr>
		</table>
	</center>
</body>
</html>