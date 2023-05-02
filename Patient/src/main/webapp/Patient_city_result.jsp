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

<%
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "system";
	String pw = "0413";
	
	String city_code_check = null;
	ResultSet rs = null;
	Connection conn = null;
	PreparedStatement pstmt = null;

	Class.forName("oracle.jdbc.OracleDriver");
	conn = DriverManager.getConnection(url, user, pw);
	
	String sql="select PA.p_city, count(PA.p_city)" +
			" from TBL_PATIENT_202004 PA, tbl_result_202004 re" + 
			" where PA.p_no = re.p_no group by PA.p_city" +
			" order by PA.p_city asc";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	
	

	

%>
<section>
<center>
<h1> 지역별검사건수</h1>
<table border =1>
	<tr>
		<td><b>지역코드</b></td>
		<td><b>지역명</b></td>
		<td><b>검사건수</b></td>
	</tr>

 <% while(rs.next()) {
	 		System.out.println(rs.getString(1));
        	if(rs.getString(1).equals("10"))
        		city_code_check = "서울";
        	else if(rs.getString(1).equals("20"))
        		city_code_check = "경기";
        	else if(rs.getString(1).equals("30"))
        		city_code_check = "강원";
        	else if(rs.getString(1).equals("40"))
        		city_code_check = "대구";
%>

	<tr>
		<td><%=rs.getString(1) %></td>
		<td><%=city_code_check %></td>
		<td><%=rs.getString(2) %></td>
	</tr>
	<%
	}
	%>
</table>
</center>
</section>

<jsp:include page="footer.jsp"/>
