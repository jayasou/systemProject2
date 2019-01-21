<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*" %>
<%@ page import="MatController.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	String sid = request.getParameter("id");
	int no = 0;
	boolean result = false;
	boolean isExist = false;
	boolean isSuccess = false;
	if(sid == null || sid.equals("")){
		sid = "";
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
			pstmt.setString(1, sid);
			rs = pstmt.executeQuery();
			if(rs.next()){
				result = true;
			}
			pstmt.close();
			if(result == true){

				sql = "SELECT MAX(no) from eeg where user_id = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1,sid);
				rs = pstmt.executeQuery();
				if(rs.next()){
					no = rs.getInt(1);
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
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>뇌파 측정</title>
<script>
	function setMeasureCheck() {
		opener.loginForm.checker.value = 't';
		self.close();
	}
</script>
</head>
<body>
	<% 
	++no;
	FunctionManagement fm = new FunctionManagement();
	fm.measurement(sid, no);
	
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
	
		sql = "SELECT MAX(id) from eeg ";
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		if(rs.next()){
			index = rs.getInt(1);
			++index;
		}
		pstmt.close();
		sql = "INSERT INTO eeg values (?, ?, ?, ?);";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, index);
		pstmt.setString(2, sid);
		pstmt.setString(3, sid+no+".txt");
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
	io.convertData("C:\\Users\\ccy58\\Desktop\\sample\\뇌파txt파일", sid+no+".txt");
%>
	<form name="measureForm" action="measureBrainWave.jsp?id="<%= sid%>>
		<%
			if (result == false) {
		%>존재하지 않는 ID 입니다.<%
			} else {
				try {
					fm.encrytion(sid + no + ".txt", "암호화" + sid + no + ".txt");
		%>
		측정완료.
		<%
			}

				catch (Exception e) {
		%>
		측정값이 이상합니다. 소리에 맞춰 8번 눈을 깜빡이세요. <input type="button"
			value="다시 측정하기" onClick="submit();" />
		<%
			e.printStackTrace();
				}
				try {
					isSuccess = fm.certification(sid + "1.txt", sid + no + ".txt");
				} catch (Exception e) {
					e.printStackTrace();
				}
				if (isSuccess == true) {
		%>
		인증 완료.<input type="button" value="확인"
			onClick="setMeasureCheck();" />
		<%
			}
				else{
					%>인증 실패. 다시 측정해주세요. <input type="button" value="다시 측정하기"
			onClick="submit();" />
			<%
				}
			}
		%>

	</form>
</body>
</html>