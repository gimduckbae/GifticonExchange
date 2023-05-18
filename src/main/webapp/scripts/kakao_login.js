$(function() {


	Kakao.init('1c875a9b356e9a16e8e2b9647e26dd6a'); //발급받은 키 중 javascript키를 사용해준다.
	console.log(Kakao.isInitialized()); // sdk초기화여부판단
	//카카오로그인

	function checkId(input_id) {
		var result = "error";
		$.ajax({
			async: false, // 비동기 true
			type: 'GET', // GET 타입
			data: { // 넘겨줄 매개변수, 실제로 ?id=input_id 형식으로 넘어감
				"id": input_id
			},
			url: "./actions/register_idCheck.jsp", // 타겟 url 주소
			dataType: "json", // json 형태로 받아오겠다
			contentType: "application/json; charset=UTF-8",
			success: function(data) {
				if (data.result === "true") { // 사용가능한 아이디면 가입버튼 활성
					result = "true";
				} else if (data.result === "false") { // 중복 아이디 (이미 카카오로 가입됐다)
					result = "false";
				} else {
					result = "error";
				}
			},
			error: function() {
				alert("오류가 발생했습니다. 다시 시도해주세요.");
			}
		});
		return result;
	}


	/** 회원가입양식 테이블에 insert하기. ajax 방식으로 호출해서 성공유무 json 형태로 리턴받음 */
	function register(input_id, input_pw, input_name, input_nickname) {

		$.ajax({
			async: false, // 비동기 true
			type: 'get', // GET 타입
			data: { // 넘겨줄 매개변수, 실제로 ?id=input_id 형식으로 넘어감
				"input_id": input_id,
				"input_pw": input_pw,
				"input_name": input_name,
				"input_nickname": input_nickname
			},
			url: "./actions/register_action.jsp", // 타겟 url 주소
			dataType: "json", // json 형태로 받아오겠다
			contentType: "application/json; charset=UTF-8",
			success: function(data) {
				//console.log(data.result);
				if (data.result === 'true') { // 회원가입 DB insert 성공
					alert("카카오 계정 정보로 간편 가입완료!");
					location.href = "./login.jsp";
				} else {
					alert("카카오 간편가입중 오류가 발생했습니다."); // DB insert중 오류발생함
				}
			},
			error: function() {
				alert("오류가 발생했습니다. 다시 시도해주세요.");
			}
		})
	}


	function kakaoLogin() {
		let res_pw;
		let res_email;
		let res_nickname;

		Kakao.Auth.login({
			success: function(response) {
				Kakao.API.request({
					url: '/v2/user/me',
				})
					.then(function(response) {
						console.log(response);
						res_pw = response.id;
						res_email = response.kakao_account.email;
						res_nickname = response.kakao_account.profile.nickname;
						var checkStatus = checkId(res_email);
						
						if (checkStatus === "true") {
							register(res_email, res_pw, res_nickname, res_nickname);
							location.href = "./actions/login_action.jsp?login_id=" + res_email + "&password=" + res_pw;
						} else if (checkStatus === "false") {
							location.href = "./actions/login_action.jsp?login_id=" + res_email + "&password=" + res_pw;
						} else {
							alert("오류가 발생했습니다.");
						}
					})
					.catch(function(error) {
						console.log(error);
					});
			},
			fail: function(error) {
				console.log(error)
			},
		})
	}
	//카카오로그아웃  
	function kakaoLogout() {
		if (Kakao.Auth.getAccessToken()) {
			Kakao.API.request({
				url: '/v1/user/unlink',
				success: function(response) {
					console.log(response)
				},
				fail: function(error) {
					console.log(error)
				},
			})
			Kakao.Auth.setAccessToken(undefined)
		}
	}

	$(".kakao-login").click(kakaoLogin);
	$(".kakao-logout").click(kakaoLogout);
});
