<%@ page import = "java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<jsp:include page = "header.jsp"/>
<jsp:include page = "nav.jsp"/>
<jsp:include page = "section.jsp"/>
<%
	String Edu_check = null;
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

String url = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "system";
String pw = "0413";
String sql = "select M.M_NO, M.M_NAME, M.P_CODE, M.P_SCHOOL, M.M_JUMIN, M.M_CITY, P.P_TEL1, P.P_TEL2, P.P_TEL3" +
			" from tbl_member_202005 M, tbl_party_202005 P" +
			" WHERE M.P_CODE = P.P_CODE";

Class.forName("oracle.jdbc.OracleDriver");
conn = DriverManager.getConnection(url, user, pw);

pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();
%>

<section>
<center>
<h2 style = "text-align: center">후보조회</h2>
<table style = "text-align: center" border =1>
	<tr>
		<td>후보번호</td>
		<td>성명</td>
		<td>소속정당</td>
		<td>학력</td>
		<td>주민번호</td>
		<td>지역구</td>
		<td>대표전화</td>
	</tr>
	<%
	while(rs.next()) {
		if(rs.getString(4).equals("1"))
			Edu_check = "고졸";
		else if(rs.getString(4).equals("2"))
			Edu_check = "학사";
		else if(rs.getString(4).equals("2"))
			Edu_check= "석사";
		else if(rs.getString(4).equals("2"))
			Edu_check = "박사";
	%>
	<tr>
		<td><%=rs.getInt(1)%></td>
		<td><%=rs.getString(2)%></td>
		<td><%=rs.getString(3)%></td>
		<td><%=Edu_check%></td>
		<td><%=rs.getString(5)%></td>
		<td><%=rs.getString(6)%></td>
		<td><%=rs.getString(7)%>-<%=rs.getString(8)%>-<%=rs.getString(9)%></td>
		
	</tr>
<%
}
%>




</table>
</center>

</section>

<jsp:include page = "footer.jsp"/>