<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>



<%
    request.setCharacterEncoding("UTF-8"); // 한글 정상 인식을 위해

    MemberDTO member = new MemberDTO();
    // member_info.jsp 페이지에서 전달받은 폼파라미터를 사용해서
    // member 테이블의 레코드를 수정!

    MemberDAO memberDAO = new MemberDAO();
    member.setLogin_id(request.getParameter("login_id"));
    member.setPassword(request.getParameter("password")); // Use request.getParameter to get the password parameter
    member.setMember_name(request.getParameter("member_name")); // Use request.getParameter to get the member_name parameter
    member.setNickname(request.getParameter("nickname")); // Use request.getParameter to get the nickname parameter

    MemberDAO dao = new MemberDAO();
    

    boolean isRightUser= false;

    if (isRightUser) {
        boolean isChangePass = false;
        String newPass = request.getParameter("newPass");

        if (newPass != null && !newPass.equals("")) {
            // newPass에 새로운 값이 들어왔을 때
            member.setPassword(newPass);
            isChangePass = true;
            // 비밀번호 바꿨으니까 isChangePass 변수도 true값으로 바꿔주기
        }

        int updateCount = dao.updateMember(member, isChangePass);

        if (updateCount > 0) {
%>
            <script>
                alert("회원 정보 수정 성공!");
                location.href = "member_info.jsp";
            </script>
<%
        } else {
%>
            <script>
                alert("회원 정보 수정 실패!");
                history.back();
            </script>
<%
        }
    }
%>
