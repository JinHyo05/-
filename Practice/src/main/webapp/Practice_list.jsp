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
	background-color: lightgray
}
</style>

<jsp:include page = "nav.jsp"/>
<jsp:include page = "header.jsp"/>
<jsp:include page = "section.jsp"/>

<%
	String gender_check = null;
	String skill_check = null;
	Connection conn = null;
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "system";
	String pw = "0413";
	
	Class.forName("oracle.jdbc.OracleDriver");
	conn = DriverManager.getConnection(url, user, pw);
	
	String sql ="select p_no, p_name, substr(p_birth, 1, 4), substr(p_birth, 5, 2), substr(p_birth, 7, 2), p_gender, p_tel1, p_tel2, p_tel3, p_city" +
			" from tbl_practice_30306";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
%>
<section>
<center>
<h2 style = "text-align = center">요원조회</h2>
<table style ="text-align = center" border =1>
<tr>
	<td>요원 코드</td>
	<td>요원 이름</td>
	<td>요원 생년월일</td>
	<td>요원 성별</td>
	<td>요원 전화번호</td>
	<td>요원 역활군</td>
</tr>
<% while(rs.next()) {
	if(rs.getString(6).equals("M")) 
		gender_check = "남";
	else if(rs.getString(6).equals("F"))
		gender_check = "여";
	
	if(rs.getString(10).equals("10")) 
		skill_check = "척후대";
	else if(rs.getString(10).equals("20"))
		skill_check = "타격대";
	else if(rs.getString(10).equals("30"))
		skill_check = "감시자";
	else if(rs.getString(10).equals("40"))
		skill_check = "전략가";
	
	System.out.println(rs.getString(10));
	
	
	
	%>
<tr>
	<td><%=rs.getInt(1)%></td>
	<td><%=rs.getString(2)%></td>
	<td><%=rs.getString(3)%>년<%=rs.getString(4)%>월<%=rs.getString(5)%>일</td>
	<td><%=gender_check%></td>
	<td><%=rs.getString(7)%>-<%=rs.getString(8)%>-<%=rs.getString(9)%></td>
	<td><%=skill_check%></td>
</tr>
<%
}
%>
</table>
</section>
</center>
<jsp:include page = "footer.jsp"/>
