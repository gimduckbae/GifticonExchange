$(function() {
	
	// 문의답변하기. 해당 문의번호로 넘겨줌
	$(".answer").click(function() {
		const postno = $(this).data("postno");
		location.href = "./admin_answer.jsp?post_no=" + postno;
	});
});