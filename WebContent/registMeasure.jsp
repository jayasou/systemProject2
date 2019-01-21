<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*" %>
<%@ page import="MatController.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>뇌파 측정</title>
<script>
	function setMeasureCheck() {
		opener.registForm.measureCheck.value = 't';
		self.close();
	}
</script>
</head>
<body>
	<%

	String id = request.getParameter("id");
	int no = 1;
	FunctionManagement fm = new FunctionManagement();
	fm.measurement(id, no);
	/*FFTDrive fd = new FFTDrive();
	fd.read_file(id, no);
	fd.drive();
	fd.alpha_write();*/
	
	PreparedStatement pstmt = null;
	String sql = null;
	Connection con = null;
	String driverName = "com.mysql.jdbc.Driver";
	ResultSet rs = null;
	int index = 1;
	try {
		Class.forName(driverName);
		String url = "jdbc:mysql://127.0.0.1:3309/eog?autoReconnect=true&useSSL=false";
		String DBid = "root";
		String pwd = "chlcksdud1!";
		con = DriverManager.getConnection(url, DBid, pwd);
	
		sql = "SELECT MAX(id) from eeg; ";
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		if(rs.next()){
			index = rs.getInt(1);
			++index;
		}else{
			index = 1;
		}
		sql = "INSERT INTO eeg values (?, ?, ?, ?);";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, index);
		pstmt.setString(2, id);
		pstmt.setString(3, id+no+".txt");
		pstmt.setInt(4, no);
		pstmt.executeUpdate();
		
		rs.close();
	}
	catch (Exception e) {
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

	IOcontroller io = new IOcontroller();
	io.convertData("C:\\Users\\ccy58\\Desktop\\sample\\뇌파txt파일", id+no+".txt");
	%>
	<form name="measureForm" action="registMeasure.jsp?id="+<%= id%>>
	<%
	try{
	fm.encrytion(id+no+".txt", "암호화"+id+no+".txt");
	%>
		측정완료.
		<input type = "button" value = "확인" onClick="setMeasureCheck();"/>
	<%
	}
	
	catch (Exception e) {
		e.printStackTrace();
		%>
		측정값이 이상합니다. 소리에 맞춰 8번 눈을 깜빡이세요. 
		<input type = "button" value = "다시 측정하기" onClick="submit();"/>
		<%
	}
%>
	</form>
</body>
</html>