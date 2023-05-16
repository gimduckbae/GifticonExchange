<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./header.jsp"%>

<div class="container">
	<div class="tb">
		<table class="table">
			<thead>
				<tr>
					<th scope="col">파일명:</th>
					<th scope="col">용량:</th>
				</tr>
			</thead>
			<tbody class="tbody">

			</tbody>
		</table>
	</div>
	<img src="./images/모바일 금액권 1만원권.png">


	<hr>
	<form action="./upload_action.jsp" method="post" enctype="multipart/form-data">
		<input type="file" id="file" name="file" multiple>
		<button type="button" class="btn btn-dark">파일 선택</button>
		<button type="button" id="submit" class="btn btn-primary">업로드</button>
	</form>


</div>
<script>
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

		// Delete button click event handler
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
		
		$("#submit").click(function() {
			var status = true;
			
			var fl = document.querySelector("#file").files;
			
			for(var item of fl) {
				console.log(item)
				var formData = new FormData();			
				formData.append("file", item);
				
				$.ajax({
					url : './upload_action.jsp',
					type : 'POST',
					data : formData,
					cache: false,
					contentType : false,
					processData : false
				}).fail(function(data) {
					status = false;
				});
			}
			if(status) {
				alert("업로드 성공.");
				location.href = "./upload.jsp";
			} else {
				alert("업로드 실패.");
			}
		});

	});
</script>
<%@ include file="./footer.jsp"%>