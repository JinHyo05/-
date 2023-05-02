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
	height: 100%;
	background-color: lightgray;
}
</style>
<jsp:include page="header.jsp"/>
<jsp:include page="nav.jsp"/>
<jsp:include page="section.jsp"/>
<%
	String pay_check = null;
ResultSet rs = null;
Connection conn = null;
PreparedStatement pstmt = null;

String url = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "system";
String pw = "0413";

Class.forName("oracle.jdbc.OracleDriver");
conn = DriverManager.getConnection(url, user, pw);
	
	String sql ="select sa.sale_ymd, sa.sale_no, st.store_nm, me.menu_nm, si.size_nm, sa.sale_cnt, to_char(sa.sale_cnt*(me.price+si.plus_price), '999,999'), sa.pay_type" +
			" from sale_tbl_003 sa, store_tbl_007 st, menu_tbl_007 me, size_tbl_007 si" +
			" where me.menu_cd = sa.menu_cd and si.size_cd = sa.size_cd and st.store_cd = sa.store_cd" +
			" order by sa.sale_no asc";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
%>
<section>
<center>
<h2 style = "text-align: center">매출현황</h2>
<table style = "text-align: center" border = 1>
<tr>
	<td>판매일자</td>
	<td>판매번호</td>
	<td>점포명</td>
	<td>판매매뉴</td>
	<td>사이즈</td>
	<td>판매수량</td>
	<td>판매금액</td>
	<td>수취구분</td>
</tr>

<%
while(rs.next()) {
	if(rs.getString(8).equals("01"))
		pay_check = "현금";
	else if(rs.getString(8).equals("02"))
		pay_check = "카드";
%>

<tr>
	<td><%=rs.getInt(1)%></td>
	<td><%=rs.getString(2)%></td>
	<td><%=rs.getString(3)%></td>
	<td><%=rs.getString(4)%></td>
	<td><%=rs.getString(5)%></td>
	<td><%=rs.getString(6)%></td>
	<td><%=rs.getString(7)%>원</td>
	<td><%=pay_check%></td>
</tr>
<%
}
%>

</table>
</center>
</section>




<jsp:include page="footer.jsp"/>