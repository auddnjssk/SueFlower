<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link href="../resources/css/sb-admin-2.min.css" rel="stylesheet">
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<!-- daum 도로명주소 찾기 api -->
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	//우편번호 찾기 버튼 클릭시 발생 이벤트 
	/* 다음 주소 연동 */
	function execution_daum_address() {

		new daum.Postcode({
			oncomplete : function(data) {
				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수

				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}

				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				if (data.userSelectedType === 'R') {
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraAddr !== '') {
						extraAddr = ' (' + extraAddr + ')';
					}
					// 주소변수 문자열과 참고항목 문자열 합치기
					addr += extraAddr;

				} else {
					addr += ' ';
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				//$(".address_input_1").val(data.zonecode);
				$("[name=memberAddr1]").val(data.zonecode); // 대체가능
				//$(".address_input_2").val(addr);
				$("[name=memberAddr2]").val(addr);

				// 상세주소 입력란 disabled 속성 변경 및 커서를 상세주소 필드로 이동한다.
				$("[name=memberAddr3]").attr("readonly", false);
				$("[name=memberAddr3]").focus();

			}
		}).open();
	}
</script>
<body>
	<%@ include file="../includes/header.jsp"%>
	<form action="/member/update" id="update_form" method="post">
		<div class="container">
	<%@ include file="../includes/sidebar.jsp"%>

			<div class="card o-hidden border-0 shadow-lg my-5 info_f">
				<div class="card-body p-0">
					<!-- Nested Row within Card Body -->
					<div class="row">
						<div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
						<div class="col-lg-7">
							<div class="p-5">
								<div class="text-center">
									<h1 class="h4 text-gray-900 mb-4">회원수정</h1>
								</div>
								<div class="form-group row">
									<div class="col-sm-6 mb-3 mb-sm-0">
										<input type="text"
											class="form-control form-control-user id_input"
											id="exampleFirstName" value="${member.memberId}"
											name="memberId" readonly>
									</div>
									<div class="col-sm-6">
										<input type="text"
											class="form-control form-control-user user_input"
											id="exampleLastName" placeholder="변경할 이름 입력"
											value="${member.memberName}" name="memberName">
									</div>
								</div>
								<div class="form-group">
									<input type="text"
										class="form-control form-control-user phonenum_input"
										id="exampleInputPhone" placeholder="변경할 전화번호 입력:"
										value="${member.memberPhoneNum}" name="memberPhoneNum">
								</div>
								<div class="form-group">
									<input type="email"
										class="form-control form-control-user mail_input"
										id="exampleInputEmail" placeholder="변경할 이메일 입력"
										name="memberMail" value="${member.memberMail }">
								</div>
								<div>
									<div class="form-group row">
										<div class="col-sm-6 mb-3 mb-sm-0">
											<input type="text"
												class="form-control form-control-user address_input_1"
												id="exampleInputAddr1" placeholder="우편번호" name="memberAddr1"
												value="${member.memberAddr1}">
										</div>
										<div class="col-sm-6">
											<div onclick="execution_daum_address()"
												class="btn btn-primary btn-user btn-block address_button">
												주소찾기</div>
										</div>
									</div>
									<div class="form-group">
										<input type="text"
											class="form-control form-control-user address_input_2"
											id="exampleRepeatAddr2" placeholder="도로명" name="memberAddr2"
											value="${member.memberAddr2}">
									</div>
									<div class="form-group">
										<input type="text"
											class="form-control form-control-user address_input_3"
											id="exampleInputPhone" placeholder="변경할 상세주소 입력"
											value="${member.memberAddr3}" name="memberAddr3">
									</div>
								</div>
								<hr>
								<div class="update_btn">
									<input type="button"
										class="btn btn-primary btn-user btn-block update_button"
										value="수정">&nbsp;&nbsp;
									<c:if test="${not empty message}">
										<br>=> ${message}<br>
										<br>
									</c:if>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</form>
	<script>
		$('.update_button').click(function() {
			$('#update_form').attr("action", "/member/update");
			$('#update_form').submit();
			alert("수정완료");
		});
	</script>

	<%@ include file="../includes/footer.jsp"%>
</body>
</html>