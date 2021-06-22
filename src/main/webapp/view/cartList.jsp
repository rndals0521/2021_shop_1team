<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {
	margin: 10px auto;
	width: 600;
	border-collapse: collapse;
	font-size: 8pt;
	border-color: navy;
}

table, th, td {
	border: 1px solid black;
}
</style>
</head>
<body>
	<table>
		<tr>
			<td colspan="6">:: 장바구니 내용</td>
		</tr>
		<tr bgcolor="#dedede">
			<th>제품번호</th>
			<th width="25%">제품명</th>
			<th>단가</th>
			<th>수량</th>
			<th>금액</th>
			<th>삭제</th>
		</tr>

		<tr align="center">
			<td></td>
			<td></td>
			<td>정가:<br> <font color="red"> 세일가격: </font>
			</td>
			<td>
				<!-- 수량 조정 폼 --> <!------------------>
			</td>
			<td></td>
			<td><input type="button" value="삭제"
				style="border: 1 solid black; cursor: pointer"
				onclick="javascript:location.href='delProduct.jsp?p_num='">
			</td>
		</tr>

		<tr align="center">
			<td colspan="6"><b>장바구니가 비었습니다.</b></td>
		</tr>
		<tr>
			<td colspan="5" align="right">총 결재액 :</td>
			<td></td>
		</tr>
	</table>

</body>
</html>