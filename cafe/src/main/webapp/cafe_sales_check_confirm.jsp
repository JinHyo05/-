<%@ page import = "java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<meta charset="UTF-8">
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
	
	int sale_ymd = Integer.parseInt(request.getParameter("sale_ymd"));
	String sale_no = request.getParameter("sale_no");
	String test_store = request.getParameter("test_store");
	String test_menu = request.getParameter("test_menu");
	String test_size = request.getParameter("test_size");
	String sale_cnt = request.getParameter("sale_cnt");
	String test_pay = request.getParameter("test_pay");
	
	Connection conn = null;
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "system";
	String pw = "0413";
	

	Class.forName("oracle.jdbc.OracleDriver");
	conn = DriverManager.getConnection(url, user, pw);
	String sql = "insert into sale_tbl_003(sale_ymd, sale_no, store_cd, menu_cd, size_cd, sale_cnt, pay_type)" +
		"values(?, ?, ?, ?, ?, ?, ?)";
	
	pstmt = conn.prepareStatement(sql);
	
	pstmt.setInt(1, sale_ymd);
	pstmt.setString(2, sale_no);
	pstmt.setString(3, test_store);
	pstmt.setString(4, test_menu);
	pstmt.setString(5, test_size);
	pstmt.setString(6, sale_cnt);
	pstmt.setString(7, test_pay);
	
	pstmt.executeUpdate();
	
	pstmt.close();
	conn.close();
	
	response.sendRedirect("cafe_sales_check.jsp");
	
%>

