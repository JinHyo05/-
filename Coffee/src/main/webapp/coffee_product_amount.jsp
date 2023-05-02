<%@ page import = "java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<meta charset="UTF-8">

<style>
section {
position : fixed;
top : 60px;
width : 100%;
height : 100%;
background-color: lightgray;
}
</style>
 
<jsp:include page="header.jsp"/>
<jsp:include page="nav.jsp"/>



<section>

<%

	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "system";
	String pw = "0413";
	
	ResultSet rs = null;
	Connection conn = null;
	PreparedStatement pstmt = null;

	Class.forName("oracle.jdbc.OracleDriver");
	conn = DriverManager.getConnection(url, user, pw);
	
	String sql="select p.pcode, p.name, sum(s.amount * p.cost)"
			+"from tbl_product_01 p, tbl_salelist_01 s "
			+ "where p.pcode =s.pcode group by p.pcode, p.name";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	
	

	

%>
<h1> 상품별 판매액</h1>
<table border =1>
	<tr>
		<td><b>상품코드</b></td>
		<td><b>상품명</b></td>
		<td><b>상품별 판매액</b></td>
	</tr>

<%
	while(rs.next()){
%>

	<tr>
		<td><%=rs.getString(1) %></td>
		<td><%=rs.getString(2) %></td>
		<td><%=rs.getString(3) %></td>
	</tr>
	<%
	}
	%>
</table>
</section>

<jsp:include page="footer.jsp"/>
