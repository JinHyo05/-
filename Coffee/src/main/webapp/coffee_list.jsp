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

	String grade_check = null;
	ResultSet rs = null;
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "system";
	String pw = "0413";
	
	Class.forName("oracle.jdbc.OracleDriver");
	conn = DriverManager.getConnection(url, user, pw); 
	
	String sql= "select sa.saleno, sa.pcode, sa.saledate, sa.scode, pr.name, sa.amount, (sa.amount * pr.cost) "
			+ "from tbl_salelist_01 sa, tbl_product_01 pr where sa.pcode = pr.pcode";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	%> 

<section>
    <h2 style="text-align:center">판매현황</h2>

    <table style="text-align:center" border=1>
        <tr>
            <td>비번호</td>
            <td>상품코드</td>
            <td>판매날짜</td>
            <td>매장코드</td>
            <td>상품명</td>
            <td>판매수량</td>
            <td>총판매액</td>
        </tr>
        
        <%
        while(rs.next()) {
       
        %>
            <tr>
                <td><%=rs.getInt(1)%></td>
                <td><%=rs.getString(2)%></td>
                <td><%=rs.getString(3)%></td>
                <td><%=rs.getString(4)%></td>
                <td><%=rs.getString(5)%></td>
                <td><%=rs.getString(6)%></td>
                <td><%=rs.getString(7)%></td>
            </tr>
             <%
        }
             %>
    </table>
</section>

<jsp:include page="footer.jsp"/>