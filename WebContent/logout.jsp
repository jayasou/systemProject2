<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그아웃</title>
</head>
<body>
<%
	session.invalidate();
%>
<table>
<tr>
	<td style="border: hidden;"><center>로그아웃되었습니다.</center></td>
</tr>
<tr>
	<td style="border: hidden;"><input type="button" class="btn btn-primary col-xs-2"
			style="margin-right: 5px;" value="확인"
			onClick="self.close()" /></td>
<tr>
</table>
</body>
</html>