<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="CashMember.CashMemberDAO"%>
<%@page import="CashMember.CashMemberDTO"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

    <%
        ArrayList<CashMemberDTO> list = CashMemberDTO.getBank(DTO );
    %>
    
    

    <h2>Transaction Result</h2>

    <form method="post" name="f">

    <table border="1">
        <tr >
            <th>계좌번호</th><th>이름</th><th>잔고</th>
        </tr>
        
        <%
        
            for(CashMemberDTO v : list){
                
        %>
    
        <%
            }
        
        %>


    </table>
    
        <h3 ><a href="transactionFrom.html">[추가이체하기]</a></h3>
    
    </form>
</body>
</html>