<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<Title>Insert boardTitle here</Title>
<script type="text/javascript" crossorigin="anonymous"
	src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=">
	
</script>
</head>
<body>
	<%@ include file="../includes/header.jsp"%>
	<div
		style="padding-left: 60px; padding-right: 60px; padding-bottom: 40px; padding-top: 40px">
		<h3>
			<c:out value="${pageInfo.boardTitle}" />
		</h3>
		<h5 class="bi-person-circle me-1">
			<c:out value="${pageInfo.boardWriter}" />
			<fmt:formatDate pattern="yyyy/MM/dd" value="${pageInfo.boardRegDate}" />
		</h5>
		<hr>
		<div>${pageInfo.boardContent}</div>
		<br>
		<hr>

		<div class="btn_wrap">
			<a class="btn" id="blist_btn">목록 페이지</a>
			<c:if test='${member.memberId == pageInfo.boardWriter}'>
				<a class="btn" id="modify_btn">수정</a>
			</c:if>
		</div>

		<form id="infoForm" action="/board/modify" method="get">
			<input type="hidden" id="boardNo" name="boardNo"
				value='<c:out value="${pageInfo.boardNo}"/>'> <input
				type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
			<input type="hidden" name="amount"
				value='<c:out value="${cri.amount}"/>'> <input type="hidden"
				name="keyword" value="${cri.keyword }">
		</form>
	</div>

	<!-- 댓글 리스트 부분 -->
	<div class="row" style="padding-left: 60px; padding-right: 60px; padding-bottom: 40px; padding-top: 40px">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<i class="fa fa-comments fa-fw"></i>댓글 목록
				</div>
				<div class="panel-body">
					<ul class="chat list-unstyled">
						<li class="left clearfix" data-replyNo='12'>
							<div>
								<div class="header">
									<strong class="primary-font"></strong> 
									<small class="pull-right text-muted"></small>
								</div>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- 댓글 등록 -->
	<div class="row" style="padding-left: 60px; padding-right: 60px; padding-bottom: 40px; padding-top: 40px">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<c:if test="${member.memberId==null}">
					<div class="panel-heading">
						<i class="fa fa-comments fa-fw"></i> 로그인 후 이용해주세요 <a
							href="/member/login"><button id="addReplyBtn"
								class="btn btn-primary btn-xs pull-right">로그인 하기</button></a> <input
							id="InputReplyer" type="hidden" value="${member.memberId}" />
					</div>
					<div class="panel-body">
						<textarea id="InputReplyContent" class="form-control" rows="2"
							placeholder="로그인 후 이용해주세요" readonly="readonly"></textarea>
					</div>
				</c:if>

				<c:if test="${member.memberId!=null}">
					<div class="panel-heading">
						<button id="addReplyBtn" class="btn btn-primary btn-xs pull-right">댓글등록</button>
						<i class="fa fa-comments fa-fw"></i>${member.memberId} <input
							id="InputReplyer" type="hidden" value="${member.memberId}" />
					</div>
					<div class="panel-body">
						<textarea id="InputReplyContent" class="form-control" rows="2"placeholder="댓글을 입력하세요"></textarea>
					</div>
				</c:if>
			</div>
		</div>
	</div>

	<%@ include file="../includes/footer.jsp"%>

	<!-- 스크립트부분 -->
	<script type="text/javascript" src="/resources/js/replyjs/reply.js"></script>
	<script type="text/javascript">
		var boardNoValue = '<c:out value="${pageInfo.boardNo}"/>';

		let form = $("#infoForm");
		let mform = $("#modifyForm");
		//목록으로 이동
		$("#blist_btn").on("click", function(e) {
			form.find("#boardNo").remove();
			form.attr("action", "/board/blist");
			form.submit();
		});

		// 수정페이지로 이동
		$("#modify_btn").on("click", function(e) {
			form.attr("action", "/board/modify");
			form.submit();
		});
		


		$(document).ready(function() {
			var boardNoValue = '<c:out value="${pageInfo.boardNo}"/>';
			var replyUL = $(".chat");
			var operForm = $("#operForm");
	
			$("button[data-oper='modify']").on("click",function(e) {
					operForm.attr("action","/board/modify").submit();
				});
			
			/* 댓글 리스트 (replyService.getList)*/
			showList(1);
			function showList(pageNum){
				replyService.getList({boardNo : boardNoValue,pageNum : pageNum || 1},function(list) {
						var str = "";
						if (list == null || list.length == 0) {
							replyUL.html("");
							return;
						}
						for (var i = 0, len = list.length || 0; i < len; i++) {
							str += "<li data-rno='"+list[i].replyNo+"'>";
							str += "<div id='replyDiv" + list[i].replyNo + "' style='margin-top : 0px'><div class='header'><strong class='primary-font'>"+ list[i].replyWriter+"</strong>&nbsp&nbsp&nbsp&nbsp&nbsp"
							if("${member.memberId}" == (list[i].replyWriter)){
							str += "<a href='javascript:void(0);' data-replyno='"+list[i].replyNo+"' data-replycontent='"+list[i].replyContent+"' data-replywriter='"+ list[i].replyWriter+"'  class='modifyReplyBtn'>수정</a>"
							str += "<a href='javascript:void(0);' data-replyno='"+list[i].replyNo+"' class='removeReplyBtn'>삭제</a>"
							str += "<small class='pull-right text-muted'>"+ list[i].replyDate+ "</small></div>";
							str += "<p id='textContent" + list[i].replyNo + "'>"+list[i].replyContent+"</p></div></li><br>";
							}else{
							str += "<small class='pull-right text-muted'>"+ list[i].replyDate+ "</small></div>";
							str += "<p id='textContent" + list[i].replyNo + "'>"+list[i].replyContent+"</p></div></li><br>";
							} ;
							console.log("로그인 아이디"+"${member.memberId}");
							console.log("글쓴 아이디"+list[i].replyWriter);
						}
						replyUL.html(str);
						// 댓글 삭제버튼
					    $(".removeReplyBtn").on("click",function(e){
					    	var chk= confirm("삭제할거임?");
					    	if(chk){
							 var replyNo = $(this).data("replyno");
							 replyService.remove(replyNo, function(result) {
									showList(1);
									});
					    	}
						 }); // removeReplyBtn
						 
						// 댓글 수정버튼
 						$(".modifyReplyBtn").on("click", function(e) {
							var replyNo = $(this).data('replyno');
							var replyContent = $(this).data('replycontent');
							var replyWriter = $(this).data('replywriter');
							$('#replyDiv'+replyNo).replaceWith("<strong class='primary-font'>"+replyWriter+"</strong>&nbsp&nbsp&nbsp&nbsp&nbsp <a href='javascript:void(0);' id='modifyReplySuccess'>수정완료</a> <a href='javascript:void(0);' id='modifyReplycancel'>취소</a><textarea id = 'InputmodifyReplyContent' class='textContent form-control' rows='2'>"+replyContent+"</textarea></div></li>");
							
							
							 $("#modifyReplySuccess").on("click", function(e) {
					  			var replyContent = {replyNo,replyContent : $("#InputmodifyReplyContent").val()} // replyContent
								replyService.update(replyContent, function(result) {
									showList(1);
								});// replyService.add
							});
							
							 $("#modifyReplycancel").on("click", function(e) {
									showList(1);
								});// replycancel
					    });
					}); // endfunction
			} // end showList
			

			//댓글 등록버튼 (replyService.add)
			$("#addReplyBtn").on("click", function(e) {
				var replyContent = {
					replyContent : $("#InputReplyContent").val(),
					replyWriter : $("#InputReplyer").val(),
					boardNo : boardNoValue
					};// replyContent
					replyService.add(replyContent, function(result) {
						showList(1);
						document.getElementById("InputReplyContent").value='';
					});// replyService.add
			}); // addReplyBtn
			
		}); // ready function
	</script>
</body>
</html>