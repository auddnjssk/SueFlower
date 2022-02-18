<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<Title>Insert boardTitle here</Title>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
</head>
<body>
	<%@ include file="../includes/header.jsp"%>
	<form id="modifyForm" action="/board/modify" method="post">
		<div
			style="padding-left: 60px; padding-right: 60px; padding-bottom: 40px; padding-top: 40px">
			<input name="boardTitle" class="form-control"
				value='<c:out value="${pageInfo.boardTitle}" />'></input>
			<h5 class="bi-person-circle me-1">
				<c:out value="${pageInfo.boardWriter}" />
				<fmt:formatDate pattern="yyyy/MM/dd"
					value="${pageInfo.boardRegDate}" />
			</h5>
			<hr>
			<br>
			<textarea id="boardContent" name="boardContent"></textarea>

			<div class="btn_wrap">
				<a class="btn" id="blist_btn">목록 페이지</a> <a class="btn"
					id="modify_btn">수정 완료</a> <a class="btn" id="cancel_btn">수정 취소</a>
				<a class="btn" id="delete_btn">게시글 삭제</a>
			</div>
			<input type="hidden" name="boardWriter" value="${member.memberId}" />
			<input type="hidden" name="boardNo" readonly="readonly"
				value='<c:out value="${pageInfo.boardNo}"/>'>
		</div>
	</form>
	<form id="infoForm" action="/board/modify" method="get">
		<input type="hidden" id="boardNo" name="boardNo"
			value='<c:out value="${pageInfo.boardNo}"/>'> <input
			type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
		<input type="hidden" name="amount"
			value='<c:out value="${cri.amount}"/>'> <input type="hidden"
			name="keyword" value="${cri.keyword }">
	</form>


	<script>
		// Summernote에 글 내용 추가하는 코드
		$("#boardContent").summernote('code', '${pageInfo.boardContent}');
		
		let form = $("#infoForm"); // 페이지 이동 Form
		let mform = $("#modifyForm"); // 페이지 데이터 수정Form

		//목록으로 이동
		$("#blist_btn").on("click", function(e) {
			form.find("#boardNo").remove();
			form.attr("action", "/board/blist");
			form.submit();
		});

		// 수정하기 버튼
		$("#modify_btn").on("click", function(e) {
			var chk = confirm("정말 수정할거양??");
			if (chk) {
				mform.submit();
				javascript:history.go(-1);
			}
		});

		// 수정 취소버튼
		$("#cancel_btn").on("click", function(e) {
			var chk = confirm("정말 취소할거양??");
			if (chk) {
				form.attr("action", "/board/get");
				form.submit();
			}
		});

		// 게시글 삭제 버튼
		$("#delete_btn").on("click", function(e) {
			var chk = confirm("정말 삭제할거양??");
			if (chk) {
				form.attr("action", "/board/delete");
				form.attr("method", "post");
				form.submit();
			}
		});
	</script>
</body>
</html>
<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<Title>Insert boardTitle here</Title>
</head>
<body>

	
	<form id="modifyForm" action="/board/modify" method="post">
		<div style="padding-left: 110px; padding-right: 110px; padding-bottom: 40px; padding-top: 40px; content: center">
			<div class="input_wrap">
				<input name="boardTitle" class="form-control"
					value='<c:out value="${pageInfo.boardTitle}" />'></input>
				<br>
				<textarea id="summernote" name="boardContent"></textarea>
			</div>
		</div>
		<input type="hidden" name="boardWriter" value="${member.memberId}" />
		<input type="hidden" name="boardNo" readonly="readonly" value='<c:out value="${pageInfo.boardNo}"/>' >
		<div class="btn_wrap">
			<a class="btn" id="blist_btn">목록 페이지</a> 
			<a class="btn" id="modify_btn">수정 완료</a> 
			<a class="btn" id="cancel_btn">수정 취소</a> 
			<a class="btn" id="delete_btn">게시글 삭제</a>
		</div>
	</form>
	
	<form id="infoForm" action="/board/modify" method="get">
		<input type="hidden" id="boardNo" name="boardNo"
			value='<c:out value="${pageInfo.boardNo}"/>'> <input
			type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
		<input type="hidden" name="amount"
			value='<c:out value="${cri.amount}"/>'> <input type="hidden"
			name="keyword" value="${cri.keyword }">
	</form>

	<%@ include file="../includes/footer.jsp"%>

</body>
</html>  --%>