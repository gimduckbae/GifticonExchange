<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%		
		//로그인 성공 여부
		request.setCharacterEncoding("UTF-8");
	
		String id = request.getParameter("loginEmail");
		String pw = request.getParameter("loginpassword");
		
		//Dao DB 연결. 아이디 비번 맞는지....
		//과정...
		
		//쿠키...
		if( (id.equals("user") && pw.equals("1234")) 
					|| (id.equals("admin") && pw.equals("1234"))  ) {
			
			session.setAttribute("userId", id); //서버저장
			response.sendRedirect("login_status.jsp"); 	//response에 이동할 페이지정보
			//성공
// 			Cookie cookie = new Cookie("userId", id); //id="user" //쿠키로 로그인 여부 처리
// 			//Key, Value
// 			response.addCookie(cookie); //userId 가 담긴 쿠키를 response에 추가
// 			response.sendRedirect("login_status.jsp"); 	//response에 이동할 페이지정보 
			
// 			response.sendRedirect("login_status.jsp?userId="+id);  //url에 포함하는 과정
		} else {
			
	%>
			<script>
				alert('실패');
				location.href = "login_status.jsp";
			</script>
	<%
		}
		
	%>

</body>
</html>








