<%@page import="cash.CashChargeDto"%>
<%@page import="java.util.List"%>
<%@page import="cash.CashChargeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- 입력 : 없음 --%>

<%-- 처리 : 포인트상품 목록 --%>    
<%
	CashChargeDao cashDao = new CashChargeDao();
	List<CashChargeDto> list = cashDao.list();
%>

<%-- 출력 --%>

<h2>포인트 충전</h2>
<h3>원하시는 상품을 선택하세요</h3>
<form action="charge.txt" method="post">

	<table>
		<tbody>
			<%for(CashChargeDto cashDto : list){ %>
			<tr>
				<td><input type="radio" name="coinNo" value="<%=cashDto.getCashNo()%>"></td>
				<td><%=cashDto.getCashName()%></td>
				<td>(<%=cashDto.getCashAmount()%> point)</td>
			</tr>
			<%} %>
		</tbody>
		<tfoot>
			<tr align="center">
				<td colspan="3">
					<input type="submit" value="충전">
				</td>
			</tr>
		</tfoot>
	</table>
	
	
</form>

