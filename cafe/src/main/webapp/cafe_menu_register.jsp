<%@ page import = "java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<meta charset="UTF-8">
<style>
    section {
        position: fixed;
        top: 60px;
        width: 100%;
        height: 100%;
        background-color: lightgray;

    }

</style>

<jsp:include page="header.jsp"/>
<jsp:include page="nav.jsp"/>
<%

	String menu_check = null;
	ResultSet rs = null;
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "system";
	String pw = "0413";
	
	Class.forName("oracle.jdbc.OracleDriver");
	conn = DriverManager.getConnection(url, user, pw);

	String sql="select menu_cd, menu_nm, to_char(price, '999,999'), menu_fg" +
			" from menu_tbl_007";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	%>

<section>
    <h2 style="text-align:center">메뉴등록/수정</h2>

    <table style="text-align:center" border=1>
        <tr>
            <td>메뉴코드</td>
            <td>메뉴명</td>
            <td>메뉴가격</td>
            <td>메뉴구분</td>
            </tr>
  

        <% while(rs.next()) {
        	if(rs.getString(4).equals("0"))
        		menu_check = "커피";
        	else if(rs.getString(4).equals("1"))
        		menu_check = "티";
        %>
        
        
        
            <tr>
                <td><%=rs.getInt(1)%></td>
                <td><%=rs.getString(2)%></td>
                <td><%=rs.getString(3)%> 원</td>
                <td><%=menu_check%></td>
            </tr>
        <% 
        } 
        %>
        <td> <input type="button" value="등록"  onclick="update();"> </td>
    </table>
</section>

<jsp:include page="footer.jsp"/>