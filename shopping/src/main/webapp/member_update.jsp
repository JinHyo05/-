<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<style>
	section {
		position: fixed;
		top: 60px;
		width: 100%;
		height: 100%;
		background-color: lightgray;
	}
</style>

<meta charset="UTF-8">
<jsp:include page="header.jsp"/>
<jsp:include page="nav.jsp"/>
	<%
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		int custno = Integer.parseInt(request.getParameter("custno"));

	int max_custno = 0;

	ResultSet rs = null;
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "system";
	String pw = "0413";
	
	Class.forName("oracle.jdbc.OracleDriver");
	conn = DriverManager.getConnection(url, user, pw);
	
	String sql="SELECT custname, phone, address, joindate, grade, city FROM member_tbl_02 where custno = "+ custno;
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	
	rs.next();
%>
<section>
	<h1 style="text-alien:center;">홈쇼핑 회원 정보 수정</h1>	
	<form action="member_update_confirm.jsp" name="form">
		<table style="text-alien:center;" border="1">
			<tr>
				<td>회원번호(자동발생)</td>
				<td><input type="text" name="custno" value="<%=custno %>" readonly></td>
			</tr>
			<tr>
				<td>회원성명</td>
				<td><input type="text" name="custname" value="<%=rs.getString("custname")%>"></td>
			</tr>
			<tr>
				<td>회원전화</td>
				<td><input type="text" name="phone" value="<%=rs.getString(2)%>"></td>
			</tr>
			<tr>
				<td>회원주소</td>
				<td><input type="text" name="address" value="<%=rs.getString(3)%>"></td>
			</tr>
			<tr>
				<td>가입일자</td>
				<td><input type="text" name="joindate" value="<%=rs.getString(4)%>"></td>
			</tr>
			<tr>
				<td>고객등급[A:VIP, B:일반, C:직원]</td>
				<td><input type="text" name="grade" value="<%=rs.getString(5)%>"></td>
			</tr>
			<tr>
				<td>도시코드</td>
				<td><input type="text" name="city" value="<%=rs.getString(6)%>"></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="button" value="수정" onclick="update()"/>
				    <input type="button" value="조회" onclick="Location.href='member_list.jsp';"/></td>
			</tr>
		</table>
	</form>
</section>

<%
	conn.close();
	pstmt.close();
%>

<script>

 	function update() {
		if(document.forms.form.custno.value.trim() == "") {
			alert("회원번호가 번호가 입력되지 않았습니다.");
			form.custno.focus();
			return false;
		} else if(document.forms.form.custname.value.trim() == "") {
			alert("회원성명이 입력되지 않았습니다.");
			form.custname.focus();
			return false;
		} else if(document.forms.form.phone.value.trim() == "") {
			alert("회원전화가 입력되지 않았습니다.");
			form.phone.focus();
			return false;
		} else if(document.forms.form.address.value.trim() == "") {
			alert("회원주소가 입력되지 않았습니다.");
			form.address.focus();
			return false;
		} else if(document.forms.form.joindate.value.trim() == "") {
			alert("가입일자가 입력되지 않았습니다.");
			form.joindate.focus();
			return false;
		} else if(document.forms.form.grade.value.trim() == "") {
			alert("고객등급이 입력되지 않았습니다.");
			form.grade.focus();
			return false;
		} else if(document.forms.form.city.value.trim() == "") {
			alert("도시코드가 입력되지 않았습니다.");
			form.ctiy.focus();
			return false;
		} else {
			alert("등록되었습니다.");
			document.forms.form.submit();
			conn.commit();
			return true;
		}
	} 
	
</script>

<jsp:include page="footer.jsp"/>
