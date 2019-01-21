<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원 정보 수정DB</title>
<%
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");
String password = request.getParameter("password");
String koreanName = request.getParameter("koreanName");
String englishName = request.getParameter("englishName");
String gender = request.getParameter("gender");
String homeNum = request.getParameter("homeNum");
String phoneNum = request.getParameter("phoneNum");
String email = request.getParameter("email");
String bankCode = request.getParameter("bankCode");
String accountNum = request.getParameter("accountNum");
String accountHolder = request.getParameter("accountHolder");

Connection con = null;
ResultSet rs = null;
PreparedStatement pstmt = null;
String jdbcDriver = "com.mysql.jdbc.Driver";

try {
	Class.forName(jdbcDriver);
	String url = "jdbc:mysql://127.0.0.1:3309/eog?autoReconnect=true&useSSL=false";
	String DBid = "root";
	String pwd = "chlcksdud1!";
	con = DriverManager.getConnection(url, DBid, pwd);
	String sql = "update user_info set password = ?, name_kor = ?, name_eng = ?, gender = ?, bankCode = ?, accountNum = ?, accountHolder = ?, homeTel = ?, phoneNum = ?, email = ? where id = ?";
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1, password);
	pstmt.setString(2, koreanName);
	pstmt.setString(3, englishName);
	pstmt.setString(4, gender);
	pstmt.setString(5, bankCode);
	pstmt.setString(6, accountNum);
	pstmt.setString(7, accountHolder);
	pstmt.setString(8, homeNum);
	pstmt.setString(9, phoneNum);
	pstmt.setString(10, email);
	pstmt.setString(11, id);

	rs = pstmt.executeQuery();
	rs.close();
%>
<script type="text/javascript">
    alert("수정했습니다");
	location.replace("main.jsp");
</script>
<%
} catch (Exception e) {
%>
<script type="text/javascript">
	alert("오류발생!");
	location.replace("main.jsp");
</script>
<%
	e.printStackTrace();
	}
%>
</head>
<body>

</body>
</html>