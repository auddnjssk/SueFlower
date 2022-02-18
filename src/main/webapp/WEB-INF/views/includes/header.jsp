<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
  <!-- Favicons -->
  <link href="../resources/img/favicon.png" rel="icon">
  <link href="../resources/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="../resources/vendor/animate.css/animate.min.css" rel="stylesheet">
  <link href="../resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="../resources/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="../resources/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="../resources/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="../resources/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="../resources/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

  <!-- Template Main CSS File -->
  <link href="../resources/css/style.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: Sailor - v4.7.0
  * Template URL: https://bootstrapmade.com/sailor-free-bootstrap-theme/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
  </head>


<body>

  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top d-flex align-items-center">
    <div class="container d-flex align-items-center">

      <h1 class="logo me-auto" style="width:20%"><a href="/">Sue flower</a></h1>

      <nav id="navbar" class="navbar" style="width:60%">
        <ul>
          <li><a href="/" class="active">Home</a></li>
          <li><a href="services.html">꽃다발</a></li>
          <li><a href="/board/blist">소품샵</a></li>
          <li><a href="/board/blist">게시판</a></li>
        </ul>
		<c:if test="${member.memberId == null }">
			<ul>
	          <li><a href="/member/login" class="getstarted">로그인</a></li>
	        </ul>
		</c:if>
		
		<c:if test="${member.memberId != null }">
			<ul>
	          <li><a id ="logout_button" class="getstarted">로그아웃</a></li>
	        </ul>
		</c:if>
		
		
		
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

    </div>
  </header><!-- End Header -->

	<c:if test="${message != null }">
		<script>
		alert('${message}');
		</script>
	</c:if>
	
	<script>
		/* 로그아웃 버튼 작동 */
		$("#logout_button").click(function() {
			$.ajax({
				type : "POST",
				url : "/member/logout",
				success : function(data) {
					alert("로그아웃 성공");
					document.location.reload();
				}
			})
		})
		
	</script>

</body>
</html>