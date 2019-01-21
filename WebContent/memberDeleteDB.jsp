<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.Date"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 정보 삭제DB</title>
</head>
<body>
	<%
		String id = (String)session.getAttribute("id");

		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = null;
		Statement stmt = null;
		PreparedStatement pstmt = null;

		int updateCount = 0;
		try {
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3309/eog", "root", "chlcksdud1!");
			String sql = "delete from user_info where id = ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);

			pstmt.executeUpdate();
			session.invalidate();
		} catch (Exception e) {
			out.println("My sql 데이터베이스 접속에 문제가 있습니다. <hr>");
			e.printStackTrace();
			response.sendRedirect("main.jsp");
		} finally {
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();
		}
	%>
	<script type = "text/javascript">
		alert("계정이 삭제되었습니다.");
		alert("로그아웃 되었습니다.");
		location.herf="Main_logIn.jsp";
	</script>
</body>
</html>