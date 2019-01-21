<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원 정보 삭제</title>
</head>
<body>
	<div align="center">
		<form>
			<table border="1">
				<tr>
					<td style="border: hidden;" align="center">아이디</td>
					<td style="border: hidden;"><input type="text" name="id"></td>
				</tr>
				<tr>
					<td style="border: hidden;" align="center">비밀번호</td>
					<td style="border: hidden;"><input type="password" size="21"
						name="password"></td>
				</tr>
				<tr>
					<td style="border: hidden;" colspan="2" align="center"><input
						type="submit" value="삭제"> <input type="button" value="취소"
						onclick="history.back()"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>