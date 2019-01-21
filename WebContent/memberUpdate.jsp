<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<%
	String id = (String)session.getAttribute("id"); 
%>
<title>정보 수정</title>
</head>
<body>
	<div align="center">
		<form name = "updateForm" action="memberUpdateDB.jsp">
		<b>회원 정보 수정</b>
				<br>
				<br>
				<br>
				<br>
			<table border="1">
				<tr>
					<td>아이디</td>
					<td style = "border: hidden;"><input type="text" name="id" value = <%=id%> readonly>&nbsp;&nbsp;&nbsp;</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td style = "border: hidden;"><input type="password" size="21" name="password"></td>
				</tr>
			
				<tr>
					<td>한글성명</td>
					<td style = "border: hidden;"><input type="text" name="koreanName"></td>
				</tr>
				<tr>
					<td>영문성명</td>
					<td style = "border: hidden;"><input type="text" name="englishName"></td>
					<td>성별</td>
					<td style = "border: hidden;"><select name="gender">
							<option selected value="남">남</option>
							<option value="여">여</option>
					</select></td>
				</tr>
				<tr>
					<td style = "border: hidden;"><b>-- 연락처정보 --</b></td>
				</tr>
				<tr>
					<td>집 전화번호</td>
					<td style = "border: hidden;"><input type="text" name="homeNum"></td>
				</tr>
				<tr>
					<td>핸드폰 번호</td>
					<td style = "border: hidden;"><input type="text" name="phoneNum"></td>
				</tr>

				<tr>
					<td>이메일</td>
					<td style = "border: hidden;"><input type="text" name="email"></td>
				</tr>
				<tr>
					<td style = "border: hidden;"><b>-- 계좌정보 --</b></td>
				</tr>
				<tr>
					<td>은행코드</td>
					<td style = "border: hidden;"><select name = "bankCode">
							<option selected>농협</option>
							<option>신한</option>
							<option>우리</option>
							<option>국민</option>
							<option>하나</option>
							<option>기업</option>
					</select></td>
				</tr>
				<tr>
					<td>계좌번호</td>
					<td style = "border: hidden;"><input type="text" name = "accountNum"></td>
					<td>예금주 명</td>
					<td style = "border: hidden;"><input type="text" name = "accountHolder"></td>
				</tr>
				<tr>
					<td style="border: hidden;" colspan="4" align="right"><input
						type="submit" value="수정"> <input type="button" value="취소"
						onclick="history.back()"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>