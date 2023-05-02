<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
	
	String p_no = request.getParameter("p_no");
	String t_code = request.getParameter("t_code");
	String t_sdate = request.getParameter("t_sdate");
	String t_status = request.getParameter("t_status");
	String t_ldate = request.getParameter("t_ldate");
	String t_result = request.getParameter("t_result");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "system";
	String pw = "0413";
	String sql = "";
	
	Class.forName("oracle.jdbc.OracleDriver");
	conn = DriverManager.getConnection(url, user, pw);
	
	pstmt.setString(1, p_no);
	                                                                                                                            
%>
