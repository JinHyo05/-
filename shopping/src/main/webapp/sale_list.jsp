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
	
	String sql="select me.custno, me.custname, me.grade, sum(mo.price) " +
		"from member_tbl_02 me, money_tbl_02 mo " +
		"where me.custno = " +
		"mo.custno group by me.custno, me.custname, me.grade " +
		"order by sum(mo.price) desc";
	 
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	
	

	

%>
<h1> 회원 매출 조회</h1>
<table border =1>
	<tr>
		<td><b>회원번호</b></td>
		<td><b>회원성명</b></td>
		<td><b>고객등급</b></td>
		<td><b>매출</b></td>
	</tr>

<%
	while(rs.next()){
%>

	<tr>
		<td><%=rs.getString(1) %></td>
		<td><%=rs.getString(2) %></td>
		<td><%=rs.getString(3) %></td>
		<td><%=rs.getString(4) %></td>
	</tr>
	<%
	}
	%>
</table>
</section>

<jsp:include page="footer.jsp"/>
