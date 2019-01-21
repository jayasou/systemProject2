<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 가입</title>
<script type="text/javascript">
function idChecking(){
	var sid = document.registForm.id.value;
	window.open('idChecker.jsp?id='+sid,'_blank','width = 200, height=300');	
}
function measure(){
	var sid = document.registForm.id.value;
	window.open('registMeasure.jsp?id='+sid,'_blank','width = 600, height=400');
}
function regSubmit(){
	var idCheck = document.idCheck.idCheck.value;
	if(idCheck == 't' && measureCheck == 't'){
		document.registForm.submit();
	}
	else if(idCheck == 't' && measureCheck == 'f'){
		alert("뇌파측정을 해주세요.");
	}
	else{
		alert("아이디 중복체크를 해주세요");
	}
}
</script>
</head>
<body>
	<div align="center">
		<form name = "registForm" method = "post" action = "memberRegisterDB.jsp">
		<input type="hidden" name = "idCheck" value="f"/>
		<input type="hidden" name = "measureCheck" value="f"/>
		<center><b>회원 정보 기입</b></center>
		<br><br><br><br>
<table border = "1">
				
					
				<tr>
					<td>아이디</td>
					<td style = "border: hidden;"><input type="text" name="id">&nbsp;&nbsp;&nbsp;</td>
					<td style = "border: hidden;"><input type = "button" value = "중복체크" onClick = "idChecking();"></td>
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
					<td>뇌파 측정</td>
					<td style = "border: hidden;"><input type="button" value="뇌파 측정하기" onClick="measure();"></td>
				</tr>
</table>
<br>
<br>
		<input type="button" class="btn btn-primary col-xs-2"
			style="float: center; margin-right: 5px;" value="확인" 
			onClick="submit()"/>
			
</form>
</div>
</body>
</html>