<%@ page import = "java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<meta charset="UTF-8">
<style>
section {
	position : fixed;
	top : 60px;
	height: 100%;
	width : 100%;
	background-color: lightgray;
}
</style>
<jsp:include page = "nav.jsp"/>
<jsp:include page = "header.jsp"/>
<jsp:include page = "section.jsp"/>
<%
	String s_check = null;
	String r_check = null;
	Connection conn= null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "system";
	String pw = "0413";
	
	Class.forName("oracle.jdbc.OracleDriver");
	conn = DriverManager.getConnection(url, user, pw);
	
	String sql ="select re.p_no, pr.p_name, te.t_name, to_char(re.t_sdate, 'YYYY-DD-MM'), re.t_status, to_char(re.t_ldate, 'YYYY-DD-MM'), re.t_result" +
			" from tbl_practice_30306 pr, tbl_practice_test_30306 te, tbl_p_result_30306 re" +
			" where pr.p_no = re.p_no and te.t_code = re.t_code";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
%>
<section>
<h2 style = "text-align: center">요원결과조회</h2>
<table style = "text-align: center" border=1>
	<tr>
		<td>환자 코드</td>
		<td>환자 이름</td>
		<td>세부역활명</td>
		<td>검사 시작일</td>
		<td>검사 상태</td>
		<td>검사 완료일</td>
		<td>검사 결과</td>
		</tr>
	<%
	while(rs.next()) {
	if(rs.getString(5).equals("1   "))
		s_check = "조회 중";
	else if(rs.getString(5).equals("2   "))
		s_check = "조회 완료";
		
	if(rs.getString(7).equals("X  "))
		r_check = "엔트리";
	else if(rs.getString(7).equals("P  "))
		r_check = "엔트리 보조";
	else if(rs.getString(7).equals("N   "))
		r_check = "공격 시야";
		
	System.out.println(rs.getString(7));
		
		
	%>
	<tr>
		<td><%=rs.getInt(1)%></td>
		<td><%=rs.getString(2)%></td>
		<td><%=rs.getString(3)%></td>
		<td><%=rs.getString(4)%></td>
		<td><%=s_check%></td>
		<td><%=rs.getString(6)%></td>
		<td><%=r_check%></td>
	</tr>

<%
}
%>
</table>
</section>



<jsp:include page = "footer.jsp"/>