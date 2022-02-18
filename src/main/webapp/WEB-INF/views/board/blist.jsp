<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 날짜 , 시,분 만 나오게 fmt 라이브러리 추가  -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>목록페이지입니다.</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.4/css/fontawesome.min.css"
	integrity="sha384-jLKHWM3JRmfMU0A5x5AkjWkw/EYfGUAGagvnfryNV3F9VqM98XiIH7VBGVoxVSc7"
	crossorigin="anonymous">
</head>
<%@ include file="../includes/header.jsp"%>

<body style="background-color: #ffffe6 ">

	<div class="text-center"
		style="padding-left: 100px; padding-right: 100px; padding-bottom: 40px; padding-top: 40px">

		<div class="create btn btn-wide pull-right py-5">
			<c:if test="${empty member.memberId}">
				<h4><a class="fa fa-pencil-square-o" href="/member/login" id="popbutton">게시판등록</a></h4>
			</c:if>
			<c:if test="${not empty member.memberId}">
				<a href="/board/bwrite" id="popbutton">글쓰기</a>
			</c:if>
		</div>
		<table id="dtBasicExample" class="table table-striped table-bordered table">
			<thead>
				<tr class="text-dark">
					<th class="text-center col-md-2">작성자</th>
					<th class="text-center col-md-6">제목</th>
					<th class="text-center">작성일</th>
				</tr>
			</thead>

			<c:forEach items="${blist}" var="blist">
				<tr>
					<td><c:out value="${blist.boardWriter}" /></td>
					<td><a class="move" href='<c:out value="${blist.boardNo}"/>'><c:out value="${blist.boardTitle}" /></a></td>
					<td><fmt:formatDate pattern="yyyy.MM.dd hh:mm" value="${blist.boardRegDate}" /></td>
				</tr>
			</c:forEach>
		</table>

		<nav aria-label="Page navigation example">
			<ul id="pageInfo" class="pagination">
				<!-- 이전 페이지 버튼 -->
				<c:if test="${pageMaker.prev}">
					<li class="pageInfo_btn previous"><a
						href="${pageMaker.startPage-1}">Previous</a></li>
				</c:if>
				<!-- 각 번호 페이지 버튼 -->
				<c:forEach var="num" begin="${pageMaker.startPage}"
					end="${pageMaker.endPage}">
					<li class="pageInfo_btn ${pageMaker.cri.pageNum == num ? "active":"" }"><a
						href="${num}">${num}</a></li>
				</c:forEach>

				<!--  다음 페이지 버튼 -->
				<c:if test="${pageMaker.next}">
					<li class="pageInfo_btn next"><a
						href="${pageMaker.endPage + 1 }">Next</a></li>
				</c:if>
			</ul>
		</nav>
		
		<div style="height:30px;width:30%;margin-left: 43%" class="search_wrap">
			<div style="float:left" class="search_area">
				<input style="margin-top:0; height:30px;float:left; width:80%" type="text" class="form-control form-control-user" placeholder="검색어 입력" name="keyword" value="${pageMaker.cri.keyword}">
				<button style="height:30px;float:left">검색</button>
			</div>
		</div>

		<form id="moveForm" method="get">
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
			<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
			<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
		</form>
	</div>
	

	<%@ include file="../includes/footer.jsp"%>
	
	

	<script type="text/javascript">
	
	function timeForToday(value) {
        const today = new Date();
        const timeValue = new Date(value);

        const betweenTime = Math.floor((today.getTime() - timeValue.getTime()) / 1000 / 60);
       
        if (betweenTime < 1) return '방금전';
        
        if (betweenTime < 60) {
            return `${betweenTime}분전`;
        }

        const betweenTimeHour = Math.floor(betweenTime / 60);
        if (betweenTimeHour < 24) {
            return `${betweenTimeHour}시간전`;
        }

        const betweenTimeDay = Math.floor(betweenTime / 60 / 24);
        if (betweenTimeDay < 365) {
            return `${betweenTimeDay}일전`;
        }

        return `${Math.floor(betweenTimeDay / 365)}년전`;
 		}
	
	// 등록 완료 alert function 
		$(document).ready(function() {
			var result = '<c:out value="${result}"/>';
			checkAlert(result);
			function checkAlert(result) {
				if (result === '') {
					return;
				}
				if (result === "bwrite success") {
					alert("작성이 완료됐당..");
				}
				if (result === "modify success") {
					alert("수정이 완료됐당..");
				}
			}
		});

		let moveForm = $("#moveForm");
		$(".move").on("click",function(e) {
				e.preventDefault();
				moveForm.append("<input type='hidden' name='boardNo' value='"+ $(this).attr("href") + "'>");
				moveForm.attr("action", "/board/get");
				moveForm.submit();
						});

		$("#pageInfo a").on("click", function(e) {
			e.preventDefault();
			moveForm.find("input[name='pageNum']").val($(this).attr("href"));
			moveForm.attr("action", "/board/blist");
			moveForm.submit();

		});

		// 검색 기능
		$(".search_area button").on("click", function(e) {
			e.preventDefault();
			let val = $("input[name='keyword']").val();
			
			moveForm.find("input[name='keyword']").val(val);
			moveForm.find("input[name='pageNum']").val(1);
			moveForm.submit();
			
		});
	</script>
</body>
</html>