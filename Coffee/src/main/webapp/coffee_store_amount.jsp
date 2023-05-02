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
	
	String sql="select h.scode, h.sname, sum(s.amount * p.cost)"
			+"from tbl_shop_01 h, tbl_product_01 p, tbl_salelist_01 s "
			+ "where p.pcode =s.pcode and h.scode = s.scode group by h.scode, h.sname "
			+"order by h.scode asc ";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	
	

	

%>
<h1> 매장별 판매액</h1>
<table border =1>
	<tr>
		<td><b>매장코드</b></td>
		<td><b>매장명</b></td>
		<td><b>매장별 판매액</b></td>
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
