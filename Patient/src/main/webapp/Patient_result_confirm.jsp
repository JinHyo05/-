<%@ page import="java.sql.*" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
	
	Class.forName("oracle.jdbc.OracleDriver");
	conn = DriverManager.getConnection(url, user, pw);
	
	String sql = "insert into tbl_result_202004 (p_no, t_no, t_sdate, t_status, t_ldate, t_result) " +
	             " values(?, ?, ?, ?, ?, ?)";
	
	pstmt.setString(1, p_no);
	pstmt.setString(2, t_code);
	pstmt.setString(3, t_sdate);
	pstmt.setString(4, t_status);
	pstmt.setString(5, t_ldate);
	pstmt.setString(6, t_result);
	
	pstmt = conn.prepareStatement(sql);
	
	pstmt.executeUpdate();
	
	response.sendRedirect("patient_insert.jsp");
%>