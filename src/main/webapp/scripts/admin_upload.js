$(function() {
	var fileList = [];

	/** 이미지파일 선택하면 fileList 변수에 배열 형태로 담기 */
	$("#file").change(function() {
		fileList = $(this)[0].files;
		fileList = Array.from(fileList);
		showFiles();
	});

	/** 추가된 이미지파일 html로 보여주기 */
	function showFiles() {
		var tb = $(".tbody"); // .tbody 요소 가져오기
		tb.empty();

		for (let i = 0; i < fileList.length; i++) {
			let file = fileList[i];
			let tr = $("<tr>");
			let filenameTd = $("<td>").text(file.name);
			let sizeTd = $("<td>").text((file.size / 1024).toFixed(2) + " KB");
			let deleteTd = $("<td>").html('<button type="button" class="btn btn-sm btn-danger btn-del">삭제</button>');
			tr.append(filenameTd, sizeTd, deleteTd);
			tb.append(tr);
		}
	}

	// 삭제버튼 이벤트
	$(document).on("click", ".btn-del", function() {
		const dataTranster = new DataTransfer();
		var index = $(this).closest("tr").index();
		fileList.splice(index, 1);

		showFiles();

		Array.from(fileList)
			.forEach(file => {
				dataTranster.items.add(file);
			});
		document.querySelector("#file").files = dataTranster.files;
	});

	// 파일 업로드 버튼 이벤트
	$("#submit").click(function() {
		var isProduct = $("#option2").is(":checked");
		var status = true;
		var URL = "";

		if (isProduct) {
			URL = './actions/upload_action.jsp';
		} else {
			URL = './actions/upload_banner.jsp'
		}

		var fl = document.querySelector("#file").files;

		for (var item of fl) {
			console.log(item)
			var formData = new FormData();
			formData.append("file", item);

			$.ajax({
				url: URL,
				async: false,
				type: 'POST',
				data: formData,
				cache: false,
				contentType: false,
				processData: false
			}).fail(function() {
				status = false;
			});
		}
		if (status) {
			alert("업로드 성공.");
			location.href = "./admin_upload.jsp";
		} else {
			alert("업로드 실패.");
		}
	});


	/** 배너 삭제버튼 이벤트 */
	$("#select-banner").change(function() {
		var selectedOption = $(this).children("option:selected");
		var bannerId = selectedOption.val();
		$("#banner_input").val(bannerId);
	});
});