<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {
	margin: 10px auto;
	width: 800px;
	border-collapse: collapse;
	font-size: 8pt;
	border-color: navy;
}

table, th, td {
	border: 1px solid black;
}
.bg{
	background-color:#dedede;
	width:40%;
}
</style>
<script type="text/javascript">
	function add_cart() {
		if(${login=='ok'}){
			location.href="/MyController?cmd=addCart&idx=${vo.idx}&p_num=${vo.p_num}"
		}else{
			alert("로그인하세요.")
			location.href="/MyController?cmd=login";
		}
		
	}
	function show_cart() {
		if(${login=='ok'}){
			location.href="/MyController?cmd=showCart"
		}else{
			alert("로그인하세요.")
			location.href="/MyController?cmd=login";
		}
	}
</script>
</head>
<body>
	<%-- 현재 페이지에서 다른 페이지 가져오기 --%>
	<%@ include file="top.jsp" %>
	<hr>
	<table>
		<tr>
			<td class="bg">제품Category</td>
			<td>${vo.category }</td>
		</tr>
		<tr>
			<td class="bg">제품번호</td>
			<td>${vo.p_num }</td>
		</tr>
		<tr>
			<td class="bg">제품이름</td>
			<td>${vo.p_name }</td>
		</tr>
		<tr>
			<td class="bg">제품판매사</td>
			<td>${vo.p_company }</td>
		</tr>
		<tr>
			<td class="bg">제품가격</td>
			<td>시중가 : <fmt:formatNumber value="${vo.p_price }" pattern="#,###"/>원
			<font style="color: tomato;">(할인가: <fmt:formatNumber value="${vo.p_saleprice }" pattern="#,###"/>원 )</font></td>
		</tr>
		<tr>
			<td class="bg">제품설명</td>
			<td>${vo.p_content }</td>
		</tr>
		<tr>
			<td colspan="2" align="center"><img src="../images/${vo.p_image_l }" style="width: 350px;"></td>
		</tr>
		<tr>
			<td colspan="2"></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
			<input type="button" value="장바구니에 담기" onclick="add_cart()" /> 
			<input type="button" value="장바구니 보기" onclick="show_cart()" /></td>
		</tr>
	</table>
</body>
</html>