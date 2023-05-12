<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.beans.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@ page import="java.util.*"%>
<%@page import="java.util.regex.Pattern"%>
<%@page import="bank.dao.BoardDAO"%>
<%@page import="bank.dto.BoardDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="./css/board.css" rel="stylesheet" type="text/css">
<title>게시글 조회</title>

<style type="text/css">
.bb {
	display: flex;
	font-weight: 800;
	justify-content: center;
}

.aa {
	padding: 15px;
}
</style>
</head>
<body>
	<%@ include file="navBar.jsp"%>

	<h3 class="tit_cont">문의 내역</h3>
		<ul id="localNav" class="tab_cont">
			<li id="lnb_Ask" class=""><a href="./q_board.jsp" role="tab"
				aria-selected="true" class="link_tab">등록하기</a></li>
			<li id="lnb_MyHistory" class="on"><a href="#" role="tab"
				aria-selected="false" class="link_tab">조회하기</a></li>
		</ul>

		<%
	BoardDAO boardDAO = new BoardDAO(); //DAO 메소드를 불러오기 위한 선행조건
   List<BoardDTO> questionList = boardDAO.QuestionInfoList(userID); 
//DTO 필드 모양의 배열(List) 타입 생성자(questionList)에 로그인된 아이디(userID)의 검색값을 전부 저장 



		//		한 사이클 당 item 필드에 SELECT해서 저장한 값을 넣고 출력(questionList배열 수 만큼 실행)
		for(BoardDTO item : questionList){
	%>
			<tr>
				<a href="" method="post">
					<td <%=userID%></td>
					<td><%=item.getTitle()%></td>
					<td><%=item.getQuastDate()%></td>
				</a>
			</tr>
	<%
		}
	%>

			</tr>
			</table>
			
			
			
			
			
		
	
			
	




		<ul class="bb">
			<li class="aa"><a href="#">&laquo;</a></li>
			<%-- 유니코드 &laquo = << --%>
			<li class="aa"><a class="w3-green" href="./boardList.jsp">1</a></li>
			<li class="aa"><a href="#">2</a></li>
			<li class="aa"><a href="#">3</a></li>
			<li class="aa"><a href="#">4</a></li>
			<li class="aa"><a href="#">5</a></li>
			<li class="aa"><a href="#">&raquo;</a></li>
			<%-- 유니코드 &raquo = >>--%>
		</ul>


		</form>
</body>
</html>