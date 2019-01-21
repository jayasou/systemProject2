<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="java.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
</head>
	<%
		request.setCharacterEncoding("UTF-8");
		String logInId = request.getParameter("id");
		String logInPassword = request.getParameter("password");

		boolean result = false;
		if(logInId == null || logInId.equals("")){
			logInId = "";
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
			

				String sql = "SELECT * from user_info where id = ?;";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, logInId);
				rs = pstmt.executeQuery();
				if(rs.next()){
					if(rs.getString(2).equals(logInPassword)){
						result = true;
					}
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
		if(result==true){
		session.setAttribute("id", logInId);
		response.sendRedirect("main.jsp");
		}
		else{
			%>
			<script>
				alert("아이디와 비밀번호를 확인해주세요.");
				location.replace = "Main_logIn.jsp";
			</script>
			<%	
		}
	%>
<body>
</body>
</html>
