<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table,fieldset{
		margin: 20px auto; 
		width:300px; 
		border: 1px solid black;
		border-collapse: collapse;
	}
	th,td,input {
		padding: 10px;
	}
</style>
<script type="text/javascript">
	function login_go(f) {
		if(f.id.value==""||f.pw.value==""){
			alert("id 혹은 pw를 입력하세요.");
			f.id.value="";
			f.pw.value="";
			f.id.focus();
			return;
		}
		f.action="/MyController?cmd=login_ok";
		f.submit();
	}
	function join_go(f) {
		alert("회원가입하러 갑니다.");
		f.action="/MyController?cmd=join_ok";
		f.submit();
	}
</script>
</head>
<body>
	<%@ include file="top.jsp" %>
	
	<div id="mydiv">
		<form method="post">
			<fieldset>
			<legend><h2>로그인</h2></legend>
			<table>
				<tbody>
					<tr>
						<th>아이디</th>
						<td><input type="text" name="id" required></td>
					</tr>
					<tr>
						<th>패스워드</th>
						<td><input type="password" name="pw" required></td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="2">
							<input type="button" value="회원가입" onclick="join_go(this.form)">
							<input type="button" value="로그인" onclick="login_go(this.form)">
						</td>
					</tr>
				</tfoot>
			</table>
			
			</fieldset>
		</form>
	</div>
</body>
</html>