<%@ page import = "java.sql.*" %>
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

<section>
  <h1 style="text-alien:center;">판매등록</h1>
    <form name="form" action="coffee_insert_confirm.jsp" method="post">
    <table style="text-alien:center;" border="1">
        <tr>
        <td>상품번호</td><td><input type="text" name ="saleno"></td>
        </tr>
        <tr>
        <td>상품코드</td><td><input type="text" name ="pcode"></td>
        </tr>
        <tr>
        <td>판매날짜</td><td><input type="text" name ="saledate"></td>
        </tr>
        <tr>
        <td>매장코드</td><td><input type="text" name ="scode"></td>
        </tr>
        <tr>
        <td>판매수량</td><td><input type="text" name = "amount"></td>
        </tr>
        <tr>
        <td> <input type="button" value="등록"  onclick="update();"> 
        <input type="button" value="다시쓰기" onclick ="Location.href='coffee_list.jsp';"> </td>
        </tr>
        </table>
    </form>
</section>


<script>

 	function update() {
		if(document.forms.form.saleno.value.trim() == "") {
			alert("상품번호가 번호가 입력되지 않았습니다.");
			form.custno.focus();
			return false;
		} else if(document.forms.form.pcode.value.trim() == "") {
			alert("상품코드가 입력되지 않았습니다.");
			form.custname.focus();
			return false;
		} else if(document.forms.form.saledate.value.trim() == "") {
			alert("판매날짜가 입력되지 않았습니다.");
			form.phone.focus();
			return false;
		} else if(document.forms.form.scode.value.trim() == "") {
			alert("매장코드가 입력되지 않았습니다.");
			form.address.focus();
			return false;
		} else if(document.forms.form.amount.value.trim() == "") {
			alert("판매수량이 입력되지 않았습니다.");
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