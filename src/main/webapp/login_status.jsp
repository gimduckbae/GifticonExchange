<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>

	<h1>로그인 상태 확인 페이지</h1>

	<%
	//String userId = request.getParameter("userId"); //url 파라미터 버전

	//쿠키버전
	/*
	Cookie[] cookies = request.getCookies();
	String userId = null;
	for(int i=0; i<cookies.length; i++){
		if(cookies[i].getName().equals("userId")){
			userId = cookies[i].getValue();
			break;
		}
	}
	*/

	Cookie[] c = request.getCookies();
	if (c != null) {
		for (Cookie cf : c) {
			if (cf.getName().equals("id")) {
		String ids = cf.getValue();
		session.setAttribute("id", ids);
			}
		}
	}

	String userId = (String) session.getAttribute("loginid"); //return type  "Object"			
	// String userId  = name이 userId 인 쿠키의 Value 값
	%>
	로그인 아이디 :
	<%=userId%>
	님이 로그인하였습니다.
	<form action="" method="post">
		<button id="logout" type="submit" onclick="test()">로그아웃</button>
	</form>
	<%
	//post 방식 전송했을때 한글 깨지지 않도록
	request.setCharacterEncoding("utf-8");
	//nick 이라는 파라미터명으로 전달된 파라미터 추출
	String id = request.getParameter("input_id");
	//session 영역에 "nick" 이라는 키값으로 추출한 내용을 담기
	session.setAttribute("input_id", id);
	//session 영역에 저장한 데이터 유지시간 지정하기
	session.setMaxInactiveInterval(500);
	%>

	<p>
		<strong><%=id%></strong> 님 반갑습니다.
	</p>
<p>
 <label for="Timer">남은 시간:</label>
 <input id="Timer" type="text" value="" readonly/>
</p>
	로그인은 3분동안 유지됩니다.
	</p>
	<a href="./login.jsp">로그인으로 가기</a>

	<script>
	const Timer=document.getElementById('Timer'); //스코어 기록창-분
	let time= 180000;
	let min=3;
	let sec=60;


	Timer.value=min+":"+'00'; 

	function TIMER(){
	    PlAYTIME=setInterval(function(){
	        time=time-1000; //1초씩 줄어듦
	        min=time/(60*1000); //초를 분으로 나눠준다.

	       if(sec>0){ //sec=60 에서 1씩 빼서 출력해준다.
	            sec=sec-1;
	            Timer.value=Math.floor(min)+':'+sec; //실수로 계산되기 때문에 소숫점 아래를 버리고 출력해준다.
	           
	        }
	        if(sec===0){
	         	// 0에서 -1을 하면 -59가 출력된다.
	            // 그래서 0이 되면 바로 sec을 60으로 돌려주고 value에는 0을 출력하도록 해준다.
	            sec=60;
	            Timer.value=Math.floor(min)+':'+'00'
	        }     
	   
	    },1000); //1초마다 
	}


	TIMER();
	setTimeout(function(){
	    clearInterval(PlAYTIME);
	},180000);//3분이 되면 타이머를 삭제한다.
	</script>

	<script>
		document.getElementById('logout').addEventListener('click', ()=>{
				if(confirm("정말 로그아웃 하시겠습니까?")){
				location.href="./actions/logout_action.jsp";
			}
		});
		//쌤하고 한 것
	</script>


	<%
	//로그인 관련 쿠키 삭제
	Cookie[] cookies = request.getCookies();
	if (cookies != null) {
		for (Cookie tempCookie : cookies) {
			if (tempCookie.getName().equals("id")) {
		tempCookie.setMaxAge(0);
		tempCookie.setPath("/");
		response.addCookie(tempCookie);

			}
		}
	}
	%>


	<%
	/* String id = (String) session.getAttribute("input_id"); */
	%>

	<%
	if (id != null) {
	%>
	<p>
		당신의 아이디는 <strong><%=id%></strong> 이군요 ^^
	</p>
	<%
	}
	%>

</body>
</html>

















