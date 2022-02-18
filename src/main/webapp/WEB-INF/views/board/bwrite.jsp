<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<%@ include file="../includes/header.jsp"%>
	<form action="/board/bwrite" method="post">
		<div style="padding-left: 110px; padding-right: 110px; padding-bottom: 40px; padding-top: 40px; content: center">
			<div class="input_wrap">
				<textarea name="boardTitle" class="form-control" rows="2" placeholder="제목을 입력하세요"></textarea>
				<br>
			</div>
			<textarea name="boardContent" id="boardContent" ></textarea>
			<button type="submit" class="btn btn-outline-secondary pull-center">전송</button>
		<input type="hidden" name="boardWriter" value="${member.memberId}" />
		</div>

	</form>
	<%@ include file="../includes/footer.jsp"%>

</body>
<script type="text/javascript">

	$(document).ready(function() {
		$('#boardContent').summernote({
						height : 400, // 에디터 높이
						focus : true, // 에디터 로딩후 포커스를 맞출지 여부
						lang : "ko-KR", // 한글 설정
						placeholder : '내용을 입력하세요',
						disableResizeEditor : true, // 크기 조절 기능 삭제
						toolbar : [[ 'fontname',[ 'fontname' ] ],[ 'fontsize',[ 'fontsize' ] ],
							['style',['bold','italic','underline','strikethrough','clear' ] ],
								['color',[ 'forecolor','color' ] ],
								[ 'table', [ 'table' ] ],['para',['ul', 'ol','paragraph' ] ],
								[ 'height', [ 'height' ] ],
								['insert',[ 'picture','link','video' ] ],
								['view',[ 'fullscreen','help' ] ] ],
						fontNames : [ 'Arial','Arial Black','Comic Sans MS','Courier New', '맑은 고딕','궁서', '굴림체', '굴림', '돋움체','바탕체' ],
						fontSizes : [ '8', '9', '10', '11','12', '14', '16', '18','20', '22', '24', '28','30', '36', '50', '72' ]
					});
});
</script>
</html>

