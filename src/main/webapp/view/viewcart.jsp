<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 보기</title>
<style type="text/css">
table {
	margin: 10px auto;
	width: 800px;
	border-collapse: collapse;
	font-size: 10pt;
	border-color: navy;
}

table, th, td {
	border: 1px solid black;
	padding: 2px;
	
}

input{
	width: 100px;
}


</style>

<script type="text/javascript">
	
	
	function edit_cart(f) {
		f.action="/MyController?cmd=editCart";
		f.submit();
	}
	
	function delete_cart() {
		
		const query = 'input[name="checkBox"]:checked';
		const selectedEls = 
			document.querySelectorAll(query);
		
		var result = new Array();
		selectedEls.forEach((el) => {
			result.push(el.value);
		});
		
	
		location.href="/MyController?cmd=deleteCart&result="+result;
	}
	
	function selectAll() {
		if(document.getElementById("selectAll").checked==true){
			for(var i=0;i< document.getElementsByName("checkBox").length; i++) document.getElementsByName("checkBox")[i].checked=true;
		}
		if(document.getElementById("selectAll").checked==false){
			for(var i=0;i< document.getElementsByName("checkBox").length; i++) document.getElementsByName("checkBox")[i].checked=false;
		}
		
		document.querySelector('input[name="checkBox"]');
		
	}
	
	function checkSelectAll(checkbox) {
		const selectall = document.querySelector('input[name="selectAll"]');
		
		if(checkbox.checked === false){
			selectall.checked = false;
		}
	}
	
	
	

</script>

</head>
<body>

	<%@ include file = "top.jsp" %>
	<hr>
	<table>
		<caption class="caption"><h2> :: 장바구니 내용 :: </h2>
			<button onclick="delete_cart()" style="float:right; margin:5px;">삭제</button>
		</caption>
				
		<thead>
			<tr bgcolor="#dedede">
				<th style="width: 10%;">전체<input type="checkbox" id="selectAll" name="selectAll" onclick="selectAll()"></th>
				<th style="width: 12.5%;">제품번호</th>
				<th style="width: 12.5%;">제품명</th>
				<th style="width: 25%;">단가</th>
				<th style="width: 30%;">수량</th>
				<th style="width: 15%;">금액</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${empty cartList }">
					<tr>
						<td colspan="6"><h2>장바구니가 비었습니다.</h2></td>
						
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="k" items="${cartList }">
						<tr>
							<td>
								<form method="post">
									<input type="checkbox" name="checkBox" value="${k.idx }" onclick='checkSelectAll(this)'>
								</form>
							</td>
							<td>${k.p_num }</td>
							<td>${k.p_name }</td>
							<td>시중가 : <fmt:formatNumber value="${k.p_price }" pattern="#,###" />원 <br>
								<font style="color:tomato;">(할인가 : <fmt:formatNumber value="${k.p_saleprice }" pattern="#,###" />원)</font>
							</td>
							<td>
								<form method="post">
									<input type="number" name="su" value="${k.p_su }" size="5">
									<input type="hidden" name="idx" value="${k.idx }">
									<input type="button" value="수정" onclick="edit_cart(this.form)">
								</form>
							</td>
							<%! int sum = 0; %>
							<td>${k.p_saleprice * k.p_su}</td>
							
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</tbody>
		<tfoot>
			<tr style="text-align: right;">
				<td colspan="6" style="padding-right: 50px;">
					<h2> 총 결재액 : ${total } 원 </h2>
				</td>
			</tr>			
		</tfoot>
	</table>
</body>
</html>