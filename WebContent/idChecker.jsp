<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	String id = request.getParameter("id");
	boolean result = false;
	if(id == null || id.equals("")){
		id = "";
	}else{
		PreparedStatement pstmt = null;
		String select_sql = null;
		Connection con = null;
		String driverName = "com.mysql.jdbc.Driver";
		ResultSet rs = null;
		try {
			Class.forName(driverName);
			String url = "jdbc:mysql://127.0.0.1:3309/eog?autoReconnect=true&useSSL=false";
			String DBid = "root";
			String pwd = "chlcksdud1!";
			con = DriverManager.getConnection(url, DBid, pwd);
		

			String sql = "SELECT id from user_info where id = ?;";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				result = true;
			}
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
	}
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>id 중복체크</title>
<script>
function setId(){
	opener.registForm.id.value = document.checkForm.id.value;
	opener.registForm.idCheck.value = 't';
	self.close();
}
</script>
</head>
<body>
<form name = "checkForm" action = "idChecker.jsp">
	<input type = "text" name = "id" value="<%=id %>"/><input type = "submit" value="검색"/>
</form>
<%
	if(id.equals("")){
		%>아이디를 입력하세요.<%
	}
	else if(result == false){
		%><a href = "#" onclick = "setId()">사용가능</a><%
	}
	else{ %>
	아이디가 중복됩니다.
	<%
	}
%>
</body>
</html>