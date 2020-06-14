<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!-- ======= Mobile nav toggle button ======= -->
	<button type="button" class="mobile-nav-toggle d-xl-none">
		<i class="icofont-navigation-menu"></i>
	</button>

	<!-- ======= Header ======= -->
	<header id="header" class="d-flex flex-column justify-content-center">

		<nav class="nav-menu">
			<ul>
				<li><a href='<c:url value="/"/>'><i class="bx bx-home"></i>
						<span>Home</span></a></li>
				<li class="active"><a href="#hero"><i class="bx bx-user"></i> <span>Search</span></a></li>
				<li><a href="#searchImages"><i class="bx bx-file-blank"></i> <span>SearchImages</span></a></li>
				<li><a href="#resume"><i class="bx bx-book-content"></i>
						<span>city</span></a></li>
				<li><a href="#testimonials"><i class="bx bx-server"></i> <span>Tip</span></a></li>
			</ul>
		</nav>
		<!-- .nav-menu -->

	</header>