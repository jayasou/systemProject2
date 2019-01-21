<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 가입 DB</title>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String koreanName = request.getParameter("koreanName");
	String englishName = request.getParameter("englishName");
	//String residentRegistrationNum = request.getParameter("residentRegistrationNum");
	String gender = request.getParameter("gender");
	//String residentRegistrationAddress = request.getParameter("residentRegistrationAddress");
	//String abodeAddress = request.getParameter("abodeAddress");
	String homeNum = request.getParameter("homeNum");
	String phoneNum = request.getParameter("phoneNum");
	//String emergencyPhoneNum = request.getParameter("emergencyPhoneNum");
	String email = request.getParameter("email");
	//String job = request.getParameter("job");
	String bankCode = request.getParameter("bankCode");
	String accountNum = request.getParameter("accountNum");
	String accountHolder = request.getParameter("accountHolder");
	

	PreparedStatement pstmt = null;
	String select_sql = null;
	Connection con = null;
	String driverName = "com.mysql.jdbc.Driver";
	
	try {
		Class.forName(driverName);
		String url = "jdbc:mysql://127.0.0.1:3309/eog?autoReconnect=true&useSSL=false";
		String DBid = "root";
		String pwd = "chlcksdud1!";
		con = DriverManager.getConnection(url, DBid, pwd);
	

		String insert_sql = "INSERT INTO user_info values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
		pstmt = con.prepareStatement(insert_sql);
		
		pstmt.setString(1, id);
		pstmt.setString(2, password);
		pstmt.setString(3, koreanName);
		pstmt.setString(4, englishName);
		pstmt.setString(5, gender);
		pstmt.setString(6, bankCode);
		pstmt.setString(7, accountNum);
		pstmt.setString(8, accountHolder);
		pstmt.setString(9, homeNum);
		pstmt.setString(10, phoneNum);
		pstmt.setString(11, email);
		
		pstmt.executeUpdate();
		
%>
<script type="text/javascript">
	<%//location.replace("Main_logIn.jsp?id=<%=id%><%//);%>
</script>
<%
	} catch (Exception e) {
%>
<script type="text/javascript">
	alert("오류발생!");
	location.replace("Main_logIn.jsp");
</script>
<%
	e.printStackTrace();
	}
	finally {
        if (pstmt != null) {
            try {
                pstmt.close();
            } catch (SQLException sqle) {
            }
        }
        if (con != null) {
            try {
                con.close();
            } catch (SQLException sqle) {
            }
        }
    }
%>
<script type="text/javascript">
	alert("가입완료!!");
	location.replace("Main_logIn.jsp");
</script>

</head>
<body>

</body>
</html>