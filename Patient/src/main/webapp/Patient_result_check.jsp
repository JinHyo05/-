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

	String patient_s_check = null;
	String patient_r_check = null;
	ResultSet rs = null;
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "system";
	String pw = "0413";
	
	Class.forName("oracle.jdbc.OracleDriver");
	conn = DriverManager.getConnection(url, user, pw);

	String sql="select re.p_no, PA.p_name, la.t_name, to_char(re.t_sdate, 'YYYY-MM-DD'), re.t_status, to_char(re.t_ldate, 'YYYY-MM-DD'), re.t_result" +  
			" from tbl_result_202004 re, TBL_PATIENT_202004 PA, tbl_lab_test_202004 la" +
			" where PA.p_no = re.p_no and la.t_code = re.t_code";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	%>

<section>
    <h2 style="text-align:center">검사결과조회</h2>

    <table style="text-align:center" border=1>
        <tr>
            <td>환자 코드</td>
            <td>환자 이름</td>
            <td>검사 명</td>
            <td>검사 시작일</td>
            <td>검사 상태</td>
            <td>검사 완료일</td>
            <td>검사 결과</td>
        </tr>

        <% while(rs.next()) {
        	if(rs.getString(5).equals("1   "))
        		patient_s_check = "검사중";
        	else if(rs.getString(5).equals("2   "))
        		patient_s_check = "검사 완료";
        	
                if(rs.getString(7).equals("X   "))
                	patient_r_check = "미입력";
                else if(rs.getString(7).equals("P   "))
                	patient_r_check = "양성"; 
                else if(rs.getString(7).equals("N   "))
                	patient_r_check = "음성";
                
                System.out.println(rs.getString(7));
        %>
        
        
        
            <tr>
                <td><%=rs.getInt(1)%></td>
                <td><%=rs.getString(2)%></td>
                <td><%=rs.getString(3)%></td>
                <td><%=rs.getString(4)%></td>
                <td><%=patient_s_check%></td>
                <td><%=rs.getString(6)%></td>
                <td><%=patient_r_check%></td>
            </tr>
        <% 
        } 
        %>
    </table>
    </center>
</section>

<jsp:include page="footer.jsp"/>