<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
    <title>Layouts.jsp</title>
	<meta name="description" content="Travello template project">
	<link rel="stylesheet" href="<c:url value='/styles/bootstrap4/bootstrap.min.css'/>">
	<link href="<c:url value='/plugins/font-awesome-4.7.0/css/font-awesome.min.css'/>" rel="stylesheet">
	<link rel="stylesheet" href="<c:url value='/plugins/OwlCarousel2-2.2.1/owl.carousel.css'/>">
	<link rel="stylesheet" href="<c:url value='/plugins/OwlCarousel2-2.2.1/owl.theme.default.css'/>">
	<link rel="stylesheet" href="<c:url value='/plugins/OwlCarousel2-2.2.1/animate.css'/>">
	<link rel="stylesheet" href="<c:url value='/styles/main_styles.css'/>">
	<link rel="stylesheet" href="<c:url value='/styles/responsive.css'/>">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<!-- 제이쿼리 UI용 라이브러리 임베드 -->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

	
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
  
<!-- <script src="js/jquery-3.2.1.min.js"></script> -->
	
	<script src="<c:url value='/styles/bootstrap4/popper.js'/>"></script>
	<script src="<c:url value='/styles/bootstrap4/bootstrap.min.js'/>"></script>
	<script src="<c:url value='/plugins/OwlCarousel2-2.2.1/owl.carousel.js'/>"></script>
	<script src="<c:url value='/plugins/Isotope/isotope.pkgd.min.js'/>"></script>
	<script src="<c:url value='/plugins/scrollTo/jquery.scrollTo.min.js'/>"></script>
	<script src="<c:url value='/plugins/easing/easing.js'/>"></script>
	<script src="<c:url value='/plugins/parallax-js-master/parallax.min.js'/>"></script>
	<script src="<c:url value='/js/custom.js'/>"></script>
</html>