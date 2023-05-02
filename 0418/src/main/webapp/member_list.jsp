<%@page import="oracle.jdbc.OracleDriver"%>
<%@ page import = "java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<style>
section {
	Position : fixed;
	top : 60px;
	width: 100%;
	height: 100%;
	background-color: lightgary;
}
</style>
<jsp:include page = "header.jsp"/>
<jsp:include page = "nav.jsp"/>
<jsp:include page = "section.jsp"/>

<%	
	String gender_check = null;
	String city_check = null;
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "system";
	String pw = "0413";
	String sql = "select p_no, p_name, substr(p_birth, 1, 4), substr(p_birth, 5, 2), substr(p_birth, 7, 2), p_gender, p_tel1, p_tel2, p_tel3, p_city" +
			" from TBL_PATIENT_202004";
	
	Class.forName("oracle.jdbc.OracleDriver");
	conn = DriverManager.getConnection(url, user, pw);
	
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
%>

<section>
	<h2 style ="text-align: center;" >환자조회</h2>
	<table style = "text-align: center" border = 1">
	<tr>
		<td>환자 코드</td>
		<td>환자 이름</td>
		<td>환자 생년월일</td>
		<td>환자 성별</td>
		<td>환자 전화번호</td>
		<td>환자 거주지</td>
	</tr>
	<%
	while(rs.next()) {
		if(rs.getString(6).equals("M"))
		gender_check = "남";
		else if(rs.getString(6).equals("F"))
			gender_check = "여";
		
		if(rs.getString(10).equals("10"))
			city_check = "서울";
		else if(rs.getString(10).equals("20"))
			city_check = "경기";
		else if(rs.getString(10).equals("30"))
			city_check = "강원";
		else if(rs.getString(10).equals("40"))
			city_check = "대구";
		
		System.out.println(rs.getString(10));
	%>
	
	<tr>
		<td><%=rs.getInt(1)%></td>
		<td><%=rs.getString(2)%></td>
		<td><%=rs.getString(3)%>년<%=rs.getString(4)%>월<%=rs.getString(5)%>일</td>
		<td><%=gender_check%></td>
		<td><%=rs.getString(7)%>-<%=rs.getString(8)%>-<%=rs.getString(9)%></td> 
		<td><%=city_check%></td>
	</tr>
	<%
	}
	%>
	</table>
</section>




<jsp:include page = "footer.jsp"/>
