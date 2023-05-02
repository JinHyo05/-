<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.Date" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<style>
	section {
		position: fixed;
		top: 60px;
		width: 100%;
		height: 100%;
		background-color: lightfuchsia;
	}
</style>

<meta charset="UTF-8">
<jsp:include page="header.jsp"/>
<jsp:include page="nav.jsp"/>
<jsp:include page="footer.jsp"/>
<script>

function update() {
	if(document.forms.form.p_no.value.trim() == "") {
		alert("환자코드를 입력하세요!");
		form.p_no.focus();
		return false;
	} else if(document.forms.form.t_sdate.value.trim() == "") {
		alert("검사시작일을 입력하세요!");
		form.t_sdate.focus();
		return false;
	} else if(document.forms.form.t_ldate.value.trim() == "") {
		alert("검사 완료일을 입력하세요!");
		form.t_ldate.focus();
		return false;
	} else {
		alert("매출이 정상적으로 저장되었습니다.");
		document.forms.form.submit();
		conn.commit();
		return true;
	}
} 
</script>
<section>
<%
	Date a = new Date();
	SimpleDateFormat b = new SimpleDateFormat("yyyyMMdd");
	
%>
  <h1 style="text-alien:center;">매출 등록</h1>
    <form name="form" action="cafe_sales_check_confirm.jsp" method="post">
    <table style="text-alien:center;" border="1">
        <tr>
			<td>판매일자(자동발생)</td>
			<td><input type="text" value="<%=b.format(a)%>" name="sale_ymd" readonly></td>
			</tr>
        <tr>
				<td>판매번호(자동발생)</td>
				<td><input type="text" name="sale_no" value="<%=a%>" readonly></td>
			</tr>
        <tr>
        <td>판매점포</td><td><select name="test_store">
    <option selected value ="">선택</option>
    <option value="store1">동부이촌동점</option>
    <option value="store2">이태원점</option>
    <option value="store3">서울타워점등점</option>
    <option value="store4">소공동점</option>
    <option value="store5">명동길점</option>
    <option value="store6">충무로역점</option>
	</select></td>
        </tr>
        <tr>
        <td>메뉴코드</td><td><select name="test_menu">
    <option selected value ="">선택</option>
    <option value="menu1">아메리카노</option>
    <option value="menu2">카페라떼</option>
    <option value="menu3">카페모카</option>
    <option value="menu4">카라멜 마키아또</option>
    <option value="menu5">호지 티 라떼</option>
    <option value="menu6">그린 티 라떼</option>
    <option value="menu7">차이 티 라떼</option>
	</select></td>
        </tr>
        <tr>
        <td>사이즈</td><td><select name="test_size">
    <option selected value ="">선택</option>
    <option value="size1">Short</option>
    <option value="size2">Tall</option>
    <option value="size3">Grande</option>
    <option value="size4">Venti</option>
	</select></td>
        </tr>
        <tr>
        <td>판매수량</td><td><input type="text" name = "sale_cnt"></td>
        </tr>
  		<tr>
        <td>사이즈</td><td><select name="test_pay">
    <option selected value ="">선택</option>
    <option value="pay1">현금</option>
    <option value="pay2">카드</option>
	</select></td>
        </tr>
         <tr>
        <td> <input type="button" value="등록"  onclick="update();"> 
        <input type="button" value="조회" onclick ="Location.href='Patient_list.jsp';"> </td>
        </tr>
        </table>
    </form>
</section>
