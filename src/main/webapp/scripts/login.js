window.onload = () => {

	const btn = document.getElementById('join_btn');
	const inputId = document.getElementById('login_id');
	const inputPw = document.getElementById('password');
	const inputCheck = document.getElementById('loginsave');

	let loginId_LocalStorage = localStorage.getItem('login_id');
	console.log(loginId_LocalStorage);

	if (loginId_LocalStorage !== null) {
		inputId.value = loginId_LocalStorage;
		inputCheck.checked = true;
	}

	if (btn) {
		btn.addEventListener('click', function() {
			if (inputCheck.checked) {
				console.log(inputCheck.checked);
				localStorage.setItem('login_id', inputId.value);
			} else {
				console.log(inputCheck.checked);
				localStorage.removeItem('login_id');
			}
		});
	}
}