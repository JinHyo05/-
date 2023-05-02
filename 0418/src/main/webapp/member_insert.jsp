<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<script>
function update() {
	if(document.forms.form.p_no.value.trim() == "") }
	alert('환자코드를 입력하지 않았습니다');
	form.p_no.focus();
	return false;
}
	if(document.forms.form.p_status.value.trim() == "") }
	alert('검사 상태를 입력하지 않았습니다');
	form.p_status.focus();
	return false;
	}
else if(document.forms.form.t_ldate.value.trim() == ""){
	alert('검사 완료일을 입력하지 않았습니다');
	form.t_ldate.focus();
	return false;
}
else if(document.forms.form.t_result.value.trim() == ""){
	alert('검사 결과를 선택하지 않았습니다');
	form.t_result.focus();
	return false;
}
else {
	alert('등록되었습니다.')
	document.forms.form.submit();
	conn.commit();
	return true;
}
}
</script>
<style>
section {
	position : fixed;
	top : 60px;
	width: 100%;
	height: 100%;
	background-color: lightgray;
}
</style>
<jsp:include page = "header.jsp"/>
<jsp:include page = "nav.jsp"/>
<jsp:include page = "section.jsp"/>
<section>
<h1>검사결과입력</h1>
<form name = "form" action = "member_insert_confrim.jsp">
<table border =1>
<tr>
	<td>환자코드</td>
	<td><input type = "text" name ="p_no">예)1001</td>
	</tr>
	<tr>
		<td>검사명</td>
		<td><select id = "t_code">
		<option value = "">검사명</option>
		<option value = "T001">[T001]결핵</option>
		<option value = "T001">[T002]장티푸스</option>
		<option value = "T001">[T003]수두</option>
		<option value = "T001">[T004]홍역</option>
		<option value = "T001">[T005]콜레라</option>
		</select></td>
	</tr>
	<tr>
	<td>검사시작일</td>
	<td><input type = "text" name ="t_sdate">예)20200101</td>
	</tr>
	<tr>
		<td>검사상태</td>
		<td><input type = "radio" name = "t_status" value ="1">검사 중
		<input type = "radio" name = "t_status" value ="2">검사 완료</td>
	</tr>
	<tr>
	<td>검사완료일</td>
	<td><input type = "text" name ="t_ldate">예)20200101</td>
	</tr>
	<tr>
		<td>검사결과</td>
		<td><input type = "radio" name = "t_result" value ="1">미입력
		<input type = "radio" name = "t_result" value ="2">음성
		<input type = "radio" name = "t_result" value ="2">양성</td>
	</tr>
	<tr>
	<td colspan="2"><input type ="button" value = "등록" onclick = "update();">
	<input type ="reset" value = "재입력"></td>
	</tr>
</form>
</table>
</section>

<jsp:include page = "footer.jsp"/>