<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


	<header class="header">
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="header_content d-flex flex-row align-items-center justify-content-start">
						<div class="header_content_inner d-flex flex-row align-items-end justify-content-start">
							<div class="logo"><a href="<c:url value="/"/>">TravelMaker</a></div>
							<nav class="main_nav">
								<ul class="d-flex flex-row align-items-start justify-content-start">
									<li><a class="active" href="<c:url value="/"/>">HOME</a></li>
									<li>
										<a href="<c:url value='/TravelMaker/CitySearch.kosmo'/>" >PLANNER</a>
									</li>
									<li>
										<a href="#" class="dropdown-toggle" data-toggle="dropdown">REVIEW<span class="caret"></span>
										</a>
										<ul class="dropdown-menu">
											<li><a href="<c:url value='/TravelMaker/ReviewList.kosmo'/>">리뷰 리스트</a></li>
											<li><a href="<c:url value='/TravelMaker/ReviewView.kosmo'/>">리뷰 보기</a></li>
											<li><a href="#">리뷰 작성</a></li>
										</ul>
									</li>
									<li>
										<a href="#" class="dropdown-toggle" data-toggle="dropdown">MEMBER<span class="caret"></span>
										</a>
										<ul class="dropdown-menu">
											<li><a href="<c:url value='/TravelMaker/MyInfo.kosmo'/>">회원정보</a></li>
											<li><a href="<c:url value='/TravelMaker/MyInfoEdit.kosmo'/>">회원정보수정</a></li>
											<li><a href="<c:url value='/TravelMaker/BookMark.kosmo'/>">즐겨찾기</a></li>
											<li><a href="<c:url value='/TravelMaker/SignIn.kosmo'/>">로그인</a></li>
											<li><a href="<c:url value='/TravelMaker/SignUp.kosmo'/>">회원가입</a></li>
											<li><a href="<c:url value='/TravelMaker/Planner.kosmo'/>">나의플랜</a></li>
											<li><a href="<c:url value='/TravelMaker/ReviewList.kosmo'/>">나의리뷰</a></li>
										</ul>
									</li>
									<li>
										<a href="#" class="dropdown-toggle" data-toggle="dropdown">Customer Service<span class="caret"></span>
										</a>
										<ul class="dropdown-menu">
											<li><a href="<c:url value='/TravelMaker/CustomerService.kosmo'/>">공지사항</a></li>
											<li><a href="#">QnA</a></li>
										</ul>
									</li>
								</ul>
							</nav>
							<!--  <div class="header_phone ml-auto">Call us:010-7928-1552</div>-->
							
							<!-- Hamburger -->

							<div class="hamburger ml-auto">
								<i class="fa fa-bars" aria-hidden="true"></i>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="header_social d-flex flex-row align-items-center justify-content-start">
			<ul class="d-flex flex-row align-items-start justify-content-start">
				<li><a href="#"><i class="fa fa-pinterest" aria-hidden="true"></i></a></li>
				<li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
				<li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
				<li><a href="#"><i class="fa fa-dribbble" aria-hidden="true"></i></a></li>
				<li><a href="#"><i class="fa fa-behance" aria-hidden="true"></i></a></li>
				<li><a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a></li>
			</ul>
		</div>
	</header>
	
	<!-- Home -->

	<div class="home">
		
		<!-- Home Slider -->
		<div class="home_slider_container">
			<div class="owl-carousel owl-theme home_slider">
				<!-- Slide -->
				<div class="owl-item">
					<div class="background_image"></div>
					<div class="home_slider_content_container">
						<div class="container">
							<div class="row">
								<div class="col">
									<div class="home_slider_content">
										<div class="home_title"><h3>ONLY YOU NEED JUST <span>'COURAGE'</span></h3></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="home_page_nav">
				<ul class="d-flex flex-column align-items-end justify-content-end">
					<li><a href="#" data-scroll-to="#destinations">추천지<span>01</span></a></li>
					<li><a href="#" data-scroll-to="#testimonials">리뷰<span>02</span></a></li>
					<li><a href="#" data-scroll-to="#news">특별 상품<span>03</span></a></li>
				</ul>
			</div>
		</div>
	</div>
	
	<div class="menu">
		<div class="menu_header d-flex flex-row align-items-center justify-content-start">
			<div class="menu_logo"><a href="index.html">TravelMaker</a></div>
			<div class="menu_close_container ml-auto"><div class="menu_close"><div></div><div></div></div></div>
		</div>
		<div class="menu_content">
			<ul>
				<li><a class="active" href="<c:url value="/"/>">HOME</a></li>
				<li>
					<a href="<c:url value='/TravelMaker/CitySearch.kosmo'/>" >PLANNER</a>
				</li>
				<li>
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">REVIEW<span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li><a href="<c:url value='/TravelMaker/ReviewList.kosmo'/>">리뷰 리스트</a></li>
						<li><a href="<c:url value='/TravelMaker/ReviewView.kosmo'/>">리뷰 보기</a></li>
						<li><a href="#">리뷰 작성</a></li>
					</ul>
				</li>
				<li>
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">MEMBER<span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li><a href="<c:url value='/TravelMaker/MyInfo.kosmo'/>">회원정보</a></li>
						<li><a href="<c:url value='/TravelMaker/MyInfoEdit.kosmo'/>">회원정보수정</a></li>
						<li><a href="<c:url value='/TravelMaker/BookMark.kosmo'/>">즐겨찾기</a></li>
						<li><a href="<c:url value='/TravelMaker/SignIn.kosmo'/>">로그인</a></li>
						<li><a href="<c:url value='/TravelMaker/SignUp.kosmo'/>">회원가입</a></li>
						<li><a href="<c:url value='/TravelMaker/Planner.kosmo'/>">나의플랜</a></li>
						<li><a href="<c:url value='/TravelMaker/ReviewList.kosmo'/>">나의리뷰</a></li>
					</ul>
				</li>
				<li>
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">Customer Service<span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li><a href="<c:url value='/TravelMaker/CustomerService.kosmo'/>">공지사항</a></li>
						<li><a href="#">QnA</a></li>
					</ul>
				</li>
			</ul>
		</div>
		<div class="menu_social">
			<div class="menu_phone ml-auto">Call us: 00-56 445 678 33</div>
			<ul class="d-flex flex-row align-items-start justify-content-start">
				<li><a href="#"><i class="fa fa-pinterest" aria-hidden="true"></i></a></li>
				<li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
				<li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
				<li><a href="#"><i class="fa fa-dribbble" aria-hidden="true"></i></a></li>
				<li><a href="#"><i class="fa fa-behance" aria-hidden="true"></i></a></li>
				<li><a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a></li>
			</ul>
		</div>
	</div>
	
	
	