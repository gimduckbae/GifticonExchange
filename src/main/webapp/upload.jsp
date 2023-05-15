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


	<hr>
	<form name="fileForm" id="fileForm" method="post" enctype="multipart/form-data">
		<input type="file" id="file" name="thisFile" multiple> <input type="button" value="업로드">
	</form>
</div>
<script>
$(function() {
    var fileList = new Object();
    

    /** 이미지파일 선택하면 fileList 변수에 객체 형태로 담기 */
    $("#file").change(function() {
        fileList = $(this)[0].files;
        showFiles();

        for (let item of fileList) {
            console.log(item.name);
            console.log(item.size/1024);
            console.log();
        }
    });

    /** 추가된 이미지파일 html로 보여주기 */
    function showFiles() {
        var tb = $(".tbody"); // .tbody 요소 가져오기

        // 기존의 자식 요소들을 모두 지웁니다
        tb.empty();

     // 선택된 파일을 순회하면서 해당 요소들을 생성합니다
        for (let i = 0; i < fileList.length; i++) {
            let file = fileList[i];

            // 각 파일마다 새로운 <tr> 요소를 생성합니다
            let tr = $("<tr>");

            // 파일명을 담는 <td> 요소를 생성하고 파일명을 설정합니다
            let filenameTd = $("<td>").text(file.name);
            
            // 용량을 담는 <td> 요소를 생성하고 용량을 설정합니다
            let sizeTd = $("<td>").text((file.size / 1024).toFixed(2) + " KB");
            
            // 삭제 버튼을 담는 <td> 요소를 생성합니다
            let deleteTd = $("<td>").html('<button type="button" class="btn btn-sm btn-danger">삭제</button>');
            
            // 삭제 버튼에 클릭 이벤트 리스너를 추가합니다
            deleteTd.find("button").click(function() {
                // 클릭된 삭제 버튼의 부모 요소인 <tr> 요소를 제거합니다
                
                // fileList에서 해당 파일을 제거합니다
                //console.log(fileList);
                //fileList.splice(i, 1);
                //tr.remove();
            });
            
            // <td> 요소들을 <tr> 요소에 추가합니다
            tr.append(filenameTd, sizeTd, deleteTd);

            // <tr> 요소를 .tbody 요소의 자식으로 추가합니다
            tb.append(tr);
        }
    }

});
</script>
<%@ include file="./footer.jsp"%>
