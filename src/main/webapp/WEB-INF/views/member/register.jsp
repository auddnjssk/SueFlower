<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>회원가입</title>

<!-- Custom fonts for this template-->
<link href="../resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="../resources/css/sb-admin-2.min.css" rel="stylesheet">
<link rel="stylesheet" href="/resources/css/join.css">

<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
</head>
<%@ include file="../includes/header.jsp" %>
<body class="bg-gradient-primary">

	<div class="container">

		<div class="card o-hidden border-0 shadow-lg my-5">
			<div class="card-body p-0">
				<!-- Nested Row within Card Body -->
				<div class="row">
					<div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
					<div class="col-lg-7">
						<div class="p-5">
							<div class="text-center">
								<h1 class="h4 text-gray-900 mb-4">회원가입</h1>
							</div>
							<form class="user" id="join_form" method="post">
								<div class="form-group row">
									<div class="col-sm-6 mb-3 mb-sm-0">
										<input type="text"
											class="form-control form-control-user id_input"
											id="exampleFirstName" placeholder="아이디" name="memberId"> <span
											class="id_input_re_1">사용 가능한 아이디입니다.</span> <span
											class="id_input_re_2">아이디가 이미 존재합니다.</span> <span
											class="final_id_ck">아이디를 입력하세요.</span>
									</div>
									<div class="col-sm-6">
										<input type="text"
											class="form-control form-control-user user_input"
											id="exampleLastName" placeholder="이름" name="memberName"> <span
											class="final_name_ck">이름을 입력하세요.</span>
									</div>
								</div>
								<div class="form-group row">
									<div class="col-sm-6 mb-3 mb-sm-0">
										<input type="password"
											class="form-control form-control-user pw_input"
											id="exampleInputPassword" placeholder="비밀번호 입력" name="memberPassword"> <span
											class="final_pw_ck">비밀번호를 입력하세요.</span>
									</div>
									<div class="col-sm-6">
										<input type="password"
											class="form-control form-control-user pwck_input"
											id="exampleRepeatPassword" placeholder="비밀번호 확인 입력">
										<span class="final_pwck_ck">비밀번호 확인 입력하세요.</span> <span
											class="pwck_input_re_1">비밀번호가 일치 합니다</span> <span
											class="pwck_input_re_2">비밀번호가 불일치 합니다</span>
									</div>
								</div>
								<div class="form-group">
									<input type="text"
										class="form-control form-control-user phonenum_input"
										id="exampleInputPhone" placeholder="전화번호" name="memberPhoneNum"> <span
										class="final_phonenum_ck">전화번호를 입력하세요</span>
								</div>
								<div class="form-group">
									<input type="email"
										class="form-control form-control-user mail_input"
										id="exampleInputEmail" placeholder="이메일" name="memberMail"> <span
										class="final_mail_ck">이메일을 입력하세요.</span> <span
										class="mail_input_box_warn"></span>
								</div>
								<div>
									<div class="form-group row">
										<div class="col-sm-6 mb-3 mb-sm-0">
											<input type="text" class="form-control form-control-user address_input_1"
												id="exampleInputAddr1" placeholder="우편번호" name="memberAddr1">
										</div>
										<div class="col-sm-6">
											<div onclick="execution_daum_address()"
												class="btn btn-primary btn-user btn-block address_button">
												주소찾기</div>
										</div>
									</div>
									<div class="form-group">
										<input type="text" class="form-control form-control-user address_input_2"
											id="exampleRepeatAddr2" placeholder="도로명" name="memberAddr2">
									</div>
									<div class="form-group">
										<input type="text"
											class="form-control form-control-user address_input_3"
											id="exampleInputPhone" placeholder="상세주소" name="memberAddr3">
									</div>
									<span class="final_addr_ck">주소를 입력해주세요.</span>
								</div>
								<hr>
								<input type="button"
									class="btn btn-primary btn-user btn-block join_button"
									value="가입하기">
							</form>
							<hr>
							<div class="text-center">
								<a class="small" href="forgot-password.html">비밀번호 찾기</a>
							</div>
							<div class="text-center">
								<a class="small" href="login.html">이미 가입한 아이디가 있음. 로그인하러 가기</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>

	<!-- Bootstrap core JavaScript-->
	<script src="../resources/vendor/jquery/jquery.min.js"></script>
	<script src="../resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="../resources/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="../resources/js/sb-admin-2.min.js"></script>
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		/* 유효성 검사 통과유무 변수 */
		var idCheck = false; // 아이디
		var idckCheck = false; // 아이디 중복 검사
		var pwCheck = false; // 비번
		var pwckCheck = false; // 비번 확인
		var pwckcorCheck = false; // 비번 확인 일치 확인
		var nameCheck = false; // 이름
		var mailCheck = false; // 이메일
		var phonenumCheck = false; //전화번호
		var addressCheck = false; // 주소

		$(document).ready(function() {
					//회원가입 버튼(회원가입 기능 작동)
					$(".join_button").click(function() {
										/* 입력값 변수 */
										var id = $('.id_input').val(); // id 입력란
										var pw = $('.pw_input').val(); // 비밀번호 입력란
										var pwck = $('.pwck_input').val(); // 비밀번호 확인 입력란
										var name = $('.user_input').val(); // 이름 입력란
										var mail = $('.mail_input').val(); // 이메일 입력란
										var phonenum = $('.phonenum_input')
												.val(); //전화번호 입력란
										var addr = $('.address_input_3').val(); // 주소 입력란

										/*  아이디 유효성 검사 */
										if (id == "") {
											$('.final_id_ck').css('display',
													'block');
											idCheck = false;
										} else {
											$('.final_id_ck').css('display',
													'none');
											idCheck = true;
										}
										/*  비밀번호 유효성 검사 */
										if (pw == "") {
											$('.final_pw_ck').css('display',
													'block');
											pwCheck = false;
										} else {
											$('.final_pw_ck').css('display',
													'none');
											pwCheck = true;
										}
										/*  비밀번호 확인 유효성 검사 */
										if (pwck == "") {
											$('.final_pwck_ck').css('display',
													'block');
											pwckCheck = false;
										} else {
											$('.final_pwck_ck').css('display',
													'none');
											pwckCheck = true;
										}
										/* 이름 유효성 검사 */
										if (name == "") {
											$('.final_name_ck').css('display',
													'block');
											nameCheck = false;
										} else {
											$('.final_name_ck').css('display',
													'none');
											nameCheck = true;
										}
										/*이메일 유효성 검사*/
										if (mail == "") {
											$('.final_mail_ck').css('display',
													'block');
											mailCheck = false;
										} else {
											$('.final_mail_ck').css('display',
													'none');
											mailCheck = true;
										}

										/* 전화번호 유효성 검사 */
										if (phonenum == "") {
											$('.final_phonenum_ck').css(
													'display', 'block');
											phonenumCheck = false;
										} else {
											$('.final_phonenum_ck').css(
													'display', 'none');
											phonenumCheck = true;
										}

										/* 주소 유효성 검사 */
										if (addr == "") {
											$('.final_addr_ck').css('display',
													'block');
											addressCheck = false;
										} else {
											$('.final_addr_ck').css('display',
													'none');
											addressCheck = true;
										}
										/* 최종 유효성 검사 */
										if (idCheck && idckCheck && pwCheck
												&& pwckCheck && pwckcorCheck
												&& nameCheck && mailCheck
												&& phonenumCheck
												&& addressCheck) {
											$("#join_form").attr("action",
													"/member/register");
											$("#join_form").submit();
											alert("가입완료...");
										}
										return false;
									});
				});

		//아이디 중복검사
		$('.id_input').on(
				"propertychange change keyup paste input",
				function() { /* console.log("keyup테스트"); */

					var memberId = $('.id_input').val(); // .id_input에 입력되는 값
					var data = {
						memberId : memberId
					} // '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'

					$.ajax({
						type : "post",
						url : "/member/memberIdChk",
						data : data,
						success : function(result) {
							// console.log("성공 여부" + result);
							if (result != 'fail') {
								$('.id_input_re_1').css("display",
										"inline-block");
								$('.id_input_re_2').css("display", "none");
								idckCheck = true;
							} else {
								$('.id_input_re_2').css("display",
										"inline-block");
								$('.id_input_re_1').css("display", "none");
								idckCheck = false;
							}

						}// success 종료
					}); // ajax 종료
				});//function종료

		/* 다음 주소 연동 */
		function execution_daum_address() {

			new daum.Postcode(
					{
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
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
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
							$(".address_input_1").val(data.zonecode);
							//$("[name=memberAddr1]").val(data.zonecode);    // 대체가능
							$(".address_input_2").val(addr);
							//$("[name=memberAddr2]").val(addr); 

							// 상세주소 입력란 disabled 속성 변경 및 커서를 상세주소 필드로 이동한다.
							$(".address_input_3").attr("readonly", false);
							$(".address_input_3").focus();

						}
					}).open();
		}

		/* 비밀번호 확인 일치 유효성검사 */
		$('.pwck_input').on("propertychange change keyup paste input",
				function() {
					var pw = $('.pw_input').val();
					var pwck = $('.pwck_input').val();
					$('.final_pwck_ck').css('display', 'none');

					if (pw == pwck) {
						$('.pwck_input_re_1').css('display', 'block');
						$('.pwck_input_re_2').css('display', 'none');
						pwckcorCheck = true;
					} else {
						$('.pwck_input_re_1').css('display', 'none');
						$('.pwck_input_re_2').css('display', 'block');
						pwckcorCheck = false;
					}
				});

	</script>
	
</body>
<%@ include file ="../includes/footer.jsp" %>
</html>