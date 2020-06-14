<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>TravelMaking</title>
<meta content="" name="descriptison">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="<c:url value='/plugins/assets/img/favicon.png'/>" rel="icon">
<link href="<c:url value='/plugins/assets/img/apple-touch-icon.png'/>" rel="apple-touch-icon">

<!-- Google Fonts -->
<link href="<c:url value='https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i'/>" rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="<c:url value='/plugins/assets/vendor/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet">
<link href="<c:url value='/plugins/assets/vendor/icofont/icofont.min.css'/>" rel="stylesheet">
<link href="<c:url value='/plugins/assets/vendor/boxicons/css/boxicons.min.css'/>" rel="stylesheet">
<link href="<c:url value='/plugins/assets/vendor/venobox/venobox.css'/>" rel="stylesheet">
<link href="<c:url value='/plugins/assets/vendor/owl.carousel/assets/owl.carousel.min.css'/>" rel="stylesheet">
<link href="<c:url value='/plugins/assets/vendor/aos/aos.css'/>" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="<c:url value='/plugins/assets/css/style.css?ver=16'/>" rel="stylesheet">


	
</head>
  
<body>
	<div class="super_container">
		<!-- top부분 -->
		<tiles:insertAttribute name="top"/>
		  <!-- body부분 -->
		<tiles:insertAttribute name="body"/> 
		  
		  <!-- footer부분 -->
		<tiles:insertAttribute name="footer"/>  
	</div>
  
  
</body>
  
<a href="#" class="back-to-top"><i class="bx bx-up-arrow-alt"></i></a>
	<div id="preloader"></div>

	<!-- Vendor JS Files -->
	<script src="<c:url value='/plugins/assets/vendor/jquery/jquery.min.js'/>"></script>
	<script src="<c:url value='/plugins/assets/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>
	<script src="<c:url value='/plugins/assets/vendor/jquery.easing/jquery.easing.min.js'/>"></script>
	<script src="<c:url value='/plugins/assets/vendor/php-email-form/validate.js'/>"></script>
	<script src="<c:url value='/plugins/assets/vendor/waypoints/jquery.waypoints.min.js'/>"></script>
	<script src="<c:url value='/plugins/assets/vendor/counterup/counterup.min.js'/>"></script>
	<script src="<c:url value='/plugins/assets/vendor/isotope-layout/isotope.pkgd.min.js'/>"></script>
	<script src="<c:url value='/plugins/assets/vendor/venobox/venobox.min.js'/>"></script>
	<script src="<c:url value='/plugins/assets/vendor/owl.carousel/owl.carousel.min.js'/>"></script>
	<script src="<c:url value='/plugins/assets/vendor/typed.js/typed.min.js'/>"></script>
	<script src="<c:url value='/plugins/assets/vendor/aos/aos.js'/>"></script>

	<!-- Template Main JS File -->
	<script src="<c:url value='/plugins/assets/js/main.js'/>"></script>

</body>

</html>