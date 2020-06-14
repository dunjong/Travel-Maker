<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
 function allowDrop(ev) {
	  ev.preventDefault();
	}

	function drag(ev) {
	  ev.dataTransfer.setData("text", ev.target.id);
	}

	function drop(ev) {
	  ev.preventDefault();
	  var data = ev.dataTransfer.getData("text");
	  ev.target.appendChild(document.getElementById(data));
	}
</script>

<!-- ======= Hero Section ======= -->
	
	
		
		<section id="hero" class="d-flex flex-column justify-content-center" style="position:relative" 
			>
			
			<div class="jb-box" style="position:absolute;left:0px;top:0px" >
				
				<video muted autoplay loop >
					<source src="<c:url value='/plugins/assets/mp4/mainpage.mp4'/>" type="video/mp4">
					<strong>Your browser does not support the video tag.</strong>
				</video>
				
				<div class="jb-text">
					<div class="container" data-aos="zoom-in" data-aos-delay="100">
						<h1>ARE YOU READY FOR TRAVEL?</h1>
						<p>
							가고 싶은 곳을 입력해보세요 ex)<span class="typed"
								data-typed-items="콴기진=쌉변태, 다낭, 괌, 발리, 보라카이"></span>
						</p>
						<div>
							<input type="text" name="searchWord" class="form-control"
								style="opacity: 0.5;" />
							<button type="submit" class="btn btn-mycolor">검색</button>
						</div>
						<div class="social-links">
							<a href="#" class="twitter"><i class="bx bxl-twitter"></i></a> <a
								href="#" class="facebook"><i class="bx bxl-facebook"></i></a> <a
								href="#" class="instagram"><i class="bx bxl-instagram"></i></a> <a
								href="#" class="google-plus"><i class="bx bxl-skype"></i></a> <a
								href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
						</div>
						<div>
							<p style="font-size: 30px; border: bold;">아직 여행할 곳을 못찾으셨다면 아래를
								눌러보세요!</p>
						</div>
						<a href="#searchImages" class="btn-get-started scrollto"> <i
							class="bx bx-chevrons-down"></i>
						</a>
					</div>
				</div>
			</div>
		</section>
	
	<!-- End Hero -->

	<main id="main">

		<!-- ======= searchImages Section ======= -->
		<section id="searchImages" class="searchImages">
			<div class="container" data-aos="fade-right" >

				<div class="section-title">
					<h2>Search Images</h2>
					<p>가보고싶은 곳의 사진을 넣어 자신의 여행계획을 세워보는 것은 어떨까요?</p>
				</div>

				<div class="row">
					<div class="col-lg-6" style="border-right:1px solid green;">
						<div class="col-xs-12 example">
							<img draggable="true" id="drag1" src="<c:url value='/plugins/assets/img/exampleImage1.jpg'/>" ondragstart="drag(event)" class="img-find" alt="">
							<img draggable="true" id="drag2" src="<c:url value='/plugins/assets/img/exampleImage2.jpg'/>" ondragstart="drag(event)" class="img-find" alt="">
							<img draggable="true" id="drag3" src="<c:url value='/plugins/assets/img/profile-img.jpg'/>" ondragstart="drag(event)" class="img-find" alt="">
						</div>
						<div id="div1" class="col-xs-12 picture" ondrop="drop(event)" ondragover="allowDrop(event)" style="width:200px;height:200px;position:relative;top:10%;left:15%;border:1px green solid;"></div>
					</div>
					<div class="col-lg-6 pt-4 pt-lg-0 tagview">
						<h3>사진 관련 태그들</h3>

						<div class="row">
							<div class="col-lg-6">
								<ul>
									<li><i class="icofont-rounded-right"></i><strong>피지컬</strong><input type="checkbox"/></li>
									<li><i class="icofont-rounded-right"></i><strong>피지컬</strong><input type="checkbox"/></li>
									<li><i class="icofont-rounded-right"></i><strong>피지컬</strong><input type="checkbox"/></li>
									<li><i class="icofont-rounded-right"></i><strong>피지컬</strong><input type="checkbox"/></li>
									<li><i class="icofont-rounded-right"></i><strong>피지컬</strong><input type="checkbox"/></li>
									<li><i class="icofont-rounded-right"></i><strong>피지컬</strong><input type="checkbox"/></li>
									<li><i class="icofont-rounded-right"></i><strong>피지컬</strong><input type="checkbox"/></li>
								</ul>
							</div>
							<div class="col-lg-6">
								<ul>
									<li><i class="icofont-rounded-right"></i><strong>피지컬</strong><input type="checkbox"/></li>
									<li><i class="icofont-rounded-right"></i><strong>피지컬</strong><input type="checkbox"/></li>
									<li><i class="icofont-rounded-right"></i><strong>피지컬</strong><input type="checkbox"/></li>
									<li><i class="icofont-rounded-right"></i><strong>피지컬</strong><input type="checkbox"/></li>
									<li><i class="icofont-rounded-right"></i><strong>피지컬</strong><input type="checkbox"/></li>
									<li><i class="icofont-rounded-right"></i><strong>피지컬</strong><input type="checkbox"/></li>
									<li><i class="icofont-rounded-right"></i><strong>피지컬</strong><input type="checkbox"/></li>
									
								</ul>
							</div>
							<div class="citysearch-div">
								<button class="citysearch">관련 도시 검색</button>
							</div>
						</div>
					</div>
				</div>
				<div class="row search">

					<div class="col-lg-3 col-md-6">
						<div class="count-box">
							<i class="icofont-simple-smile"></i> <span
								data-toggle="counter-up">90</span>%
							<p>바다</p>
						</div>
					</div>

					<div class="col-lg-3 col-md-6 mt-5 mt-md-0">
						<div class="count-box">
							<i class="icofont-simple-smile"></i> <span
								data-toggle="counter-up">92</span>%
							<p>랜드마크</p>
						</div>
					</div>

					<div class="col-lg-3 col-md-6 mt-5 mt-lg-0">
						<div class="count-box">
							<i class="icofont-simple-smile"></i> <span
								data-toggle="counter-up">97</span>%
							<p>보트</p>
						</div>
					</div>

					<div class="col-lg-3 col-md-6 mt-5 mt-lg-0">
						<div class="count-box">
							<i class="icofont-simple-smile"></i> <span
								data-toggle="counter-up">95</span>%
							<p>물</p>
						</div>
					</div>

				</div>
			</div>
		</section>
		<!-- End searchImages Section -->

		<!-- ======= Resume Section ======= -->
		<section id="resume" class="resume">
			<div class="container" data-aos="fade-up">

				<div class="section-title">
					<h2>찾은 도시</h2>
					<p>당신이 좋아하는 사진과 비슷한 도시들입니다.</p>
				</div>

				<div class="row" style="background-color:yellow;">
					
				</div>

			</div>
		</section>
		<!-- End Resume Section -->

		<!-- ======= Portfolio Section ======= -->
		<section id="portfolio" class="portfolio section-bg">
			<div class="container" data-aos="fade-up">

				<div class="section-title">
					<h2>Portfolio</h2>
					<p>Magnam dolores commodi suscipit. Necessitatibus eius
						consequatur ex aliquid fuga eum quidem. Sit sint consectetur
						velit. Quisquam quos quisquam cupiditate. Et nemo qui impedit
						suscipit alias ea. Quia fugiat sit in iste officiis commodi quidem
						hic quas.</p>
				</div>

				<div class="row">
					<div class="col-lg-12 d-flex justify-content-center"
						data-aos="fade-up" data-aos-delay="100">
						<ul id="portfolio-flters">
							<li data-filter="*" class="filter-active">All</li>
							<li data-filter=".filter-app">App</li>
							<li data-filter=".filter-card">Card</li>
							<li data-filter=".filter-web">Web</li>
						</ul>
					</div>
				</div>

				<div class="row portfolio-container" data-aos="fade-up"
					data-aos-delay="200">

					<div class="col-lg-4 col-md-6 portfolio-item filter-app">
						<div class="portfolio-wrap">
							<img src="<c:url value='/plugins/assets/img/portfolio/portfolio-1.jpg'/>" class="img-fluid"
								alt="">
							<div class="portfolio-info">
								<h4>App 1</h4>
								<p>App</p>
								<div class="portfolio-links">
									<a href="<c:url value='/plugins/img/portfolio/portfolio-1.jpg'/>"
										data-gall="portfolioGallery" class="venobox" title="App 1"><i
										class="bx bx-plus"></i></a> <a href="portfolio-details.html"
										data-gall="portfolioDetailsGallery" data-vbtype="iframe"
										class="venobox" title="Portfolio Details"><i
										class="bx bx-link"></i></a>
								</div>
							</div>
						</div>
					</div>

					<div class="col-lg-4 col-md-6 portfolio-item filter-web">
						<div class="portfolio-wrap">
							<img src="<c:url value='/plugins/assets/img/portfolio/portfolio-2.jpg'/>" class="img-fluid"
								alt="">
							<div class="portfolio-info">
								<h4>Web 3</h4>
								<p>Web</p>
								<div class="portfolio-links">
									<a href="<c:url value='/plugins/assets/img/portfolio/portfolio-2.jpg'/>"
										data-gall="portfolioGallery" class="venobox" title="Web 3"><i
										class="bx bx-plus"></i></a> <a href="portfolio-details.html"
										data-gall="portfolioDetailsGallery" data-vbtype="iframe"
										class="venobox" title="Portfolio Details"><i
										class="bx bx-link"></i></a>
								</div>
							</div>
						</div>
					</div>

					<div class="col-lg-4 col-md-6 portfolio-item filter-app">
						<div class="portfolio-wrap">
							<img src="<c:url value='/plugins/assets/img/portfolio/portfolio-3.jpg'/>" class="img-fluid"
								alt="">
							<div class="portfolio-info">
								<h4>App 2</h4>
								<p>App</p>
								<div class="portfolio-links">
									<a href="<c:url value='/plugins/assets/img/portfolio/portfolio-3.jpg'/>"
										data-gall="portfolioGallery" class="venobox" title="App 2"><i
										class="bx bx-plus"></i></a> <a href="portfolio-details.html"
										data-gall="portfolioDetailsGallery" data-vbtype="iframe"
										class="venobox" title="Portfolio Details"><i
										class="bx bx-link"></i></a>
								</div>
							</div>
						</div>
					</div>

					<div class="col-lg-4 col-md-6 portfolio-item filter-card">
						<div class="portfolio-wrap">
							<img src="<c:url value='/plugins/assets/img/portfolio/portfolio-4.jpg'/>" class="img-fluid"
								alt="">
							<div class="portfolio-info">
								<h4>Card 2</h4>
								<p>Card</p>
								<div class="portfolio-links">
									<a href="<c:url value='/plugins/assets/img/portfolio/portfolio-4.jpg'/>"
										data-gall="portfolioGallery" class="venobox" title="Card 2"><i
										class="bx bx-plus"></i></a> <a href="portfolio-details.html"
										data-gall="portfolioDetailsGallery" data-vbtype="iframe"
										class="venobox" title="Portfolio Details"><i
										class="bx bx-link"></i></a>
								</div>
							</div>
						</div>
					</div>

					<div class="col-lg-4 col-md-6 portfolio-item filter-web">
						<div class="portfolio-wrap">
							<img src="<c:url value='/plugins/assets/img/portfolio/portfolio-5.jpg'/>" class="img-fluid"
								alt="">
							<div class="portfolio-info">
								<h4>Web 2</h4>
								<p>Web</p>
								<div class="portfolio-links">
									<a href="<c:url value='/plugins/assets/img/portfolio/portfolio-5.jpg'/>"
										data-gall="portfolioGallery" class="venobox" title="Web 2"><i
										class="bx bx-plus"></i></a> <a href="portfolio-details.html"
										data-gall="portfolioDetailsGallery" data-vbtype="iframe"
										class="venobox" title="Portfolio Details"><i
										class="bx bx-link"></i></a>
								</div>
							</div>
						</div>
					</div>

					<div class="col-lg-4 col-md-6 portfolio-item filter-app">
						<div class="portfolio-wrap">
							<img src="<c:url value='/plugins/assets/img/portfolio/portfolio-6.jpg'/>" class="img-fluid"
								alt="">
							<div class="portfolio-info">
								<h4>App 3</h4>
								<p>App</p>
								<div class="portfolio-links">
									<a href="<c:url value='/plugins/assets/img/portfolio/portfolio-6.jpg'/>"
										data-gall="portfolioGallery" class="venobox" title="App 3"><i
										class="bx bx-plus"></i></a> <a href="portfolio-details.html"
										data-gall="portfolioDetailsGallery" data-vbtype="iframe"
										class="venobox" title="Portfolio Details"><i
										class="bx bx-link"></i></a>
								</div>
							</div>
						</div>
					</div>

					<div class="col-lg-4 col-md-6 portfolio-item filter-card">
						<div class="portfolio-wrap">
							<img src="<c:url value='/plugins/assets/img/portfolio/portfolio-7.jpg'/>" class="img-fluid"
								alt="">
							<div class="portfolio-info">
								<h4>Card 1</h4>
								<p>Card</p>
								<div class="portfolio-links">
									<a href="<c:url value='/plugins/assets/img/portfolio/portfolio-7.jpg'/>"
										data-gall="portfolioGallery" class="venobox" title="Card 1"><i
										class="bx bx-plus"></i></a> <a href="portfolio-details.html"
										data-gall="portfolioDetailsGallery" data-vbtype="iframe"
										class="venobox" title="Portfolio Details"><i
										class="bx bx-link"></i></a>
								</div>
							</div>
						</div>
					</div>

					<div class="col-lg-4 col-md-6 portfolio-item filter-card">
						<div class="portfolio-wrap">
							<img src="<c:url value='/plugins/assets/img/portfolio/portfolio-8.jpg'/>" class="img-fluid"
								alt="">
							<div class="portfolio-info">
								<h4>Card 3</h4>
								<p>Card</p>
								<div class="portfolio-links">
									<a href="<c:url value='/plugins/assets/img/portfolio/portfolio-8.jpg'/>"
										data-gall="portfolioGallery" class="venobox" title="Card 3"><i
										class="bx bx-plus"></i></a> <a href="portfolio-details.html"
										data-gall="portfolioDetailsGallery" data-vbtype="iframe"
										class="venobox" title="Portfolio Details"><i
										class="bx bx-link"></i></a>
								</div>
							</div>
						</div>
					</div>

					<div class="col-lg-4 col-md-6 portfolio-item filter-web">
						<div class="portfolio-wrap">
							<img src="assets/img/portfolio/portfolio-9.jpg'/>" class="img-fluid"
								alt="">
							<div class="portfolio-info">
								<h4>Web 3</h4>
								<p>Web</p>
								<div class="portfolio-links">
									<a href="<c:url value='/plugins/assets/img/portfolio/portfolio-9.jpg'/>"
										data-gall="portfolioGallery" class="venobox" title="Web 3"><i
										class="bx bx-plus"></i></a> <a href="portfolio-details.html"
										data-gall="portfolioDetailsGallery" data-vbtype="iframe"
										class="venobox" title="Portfolio Details"><i
										class="bx bx-link"></i></a>
								</div>
							</div>
						</div>
					</div>

				</div>

			</div>
		</section>
		<!-- End Portfolio Section -->

		<!-- ======= Testimonials Section ======= -->
		<section id="testimonials" class="testimonials section-bg">
			<div class="container" data-aos="fade-up">

				<div class="section-title">
					<h2>TravelMaker직원들의 각종 꿀팁!</h2>
				</div>

				<div class="owl-carousel testimonials-carousel" data-aos="zoom-in"
					data-aos-delay="100">

					<div class="testimonial-item">
						<img src="<c:url value='/plugins/assets/img/bananaman.jpg'/>"
							class="testimonial-img" alt="">
						<h3>바나나맨</h3>
						<h4>banana &amp; banana</h4>
						<p>
							<i class="bx bxs-quote-alt-left quote-icon-left"></i> 바나나는 이렇게 먹는거에요.. <i
								class="bx bxs-quote-alt-right quote-icon-right"></i>
						</p>
					</div>

					<div class="testimonial-item">
						<img src="<c:url value='/plugins/assets/img/bananaman.jpg'/>"
							class="testimonial-img" alt="">
						<h3>바나나맨 박종현</h3>
						<h4>banana man</h4>
						<p>
							<i class="bx bxs-quote-alt-left quote-icon-left"></i> 바나나란 심오한거에오 <i
								class="bx bxs-quote-alt-right quote-icon-right"></i>
						</p>
					</div>

					<div class="testimonial-item">
						<img src="<c:url value='/plugins/assets/img/bananaman.jpg'/>"
							class="testimonial-img" alt="">
						<h3>바나나좋아하는 박조년</h3>
						<h4>banana designer</h4>
						<p>
							<i class="bx bxs-quote-alt-left quote-icon-left"></i> 바나나를 디자인해보아오
							<i
								class="bx bxs-quote-alt-right quote-icon-right"></i>
						</p>
					</div>

					<div class="testimonial-item">
						<img src="<c:url value='/plugins/assets/img/bananaman.jpg'/>"
							class="testimonial-img" alt="">
						<h3>바나나 많이 먹는 박종현</h3>
						<h4>banana many eat man</h4>
						<p>
							<i class="bx bxs-quote-alt-left quote-icon-left"></i> 바나나 많이 먹게하는중 <i
								class="bx bxs-quote-alt-right quote-icon-right"></i>
						</p>
					</div>

					<div class="testimonial-item">
						<img src="<c:url value='/plugins/assets/img/bananaman.jpg'/>"
							class="testimonial-img" alt="">
						<h3>바나나만 먹는 박종현</h3>
						<h4>physical</h4>
						<p>
							<i class="bx bxs-quote-alt-left quote-icon-left"></i> 바나나 먹는 걸 습관화합시다 <i
								class="bx bxs-quote-alt-right quote-icon-right"></i>
						</p>
					</div>

				</div>

			</div>
		</section>
		<!-- End Testimonials Section -->

		<!-- ======= Contact Section ======= -->
		<section id="contact" class="contact">
			<div class="container" data-aos="fade-up">

				<div class="section-title">
					<h2>Contact</h2>
				</div>

				<div class="row mt-1">

					<div class="col-lg-4">
						<div class="info">
							<div class="address">
								<i class="icofont-google-map"></i>
								<h4>Location:</h4>
								<p>A108 Adam Street, New York, NY 535022</p>
							</div>

							<div class="email">
								<i class="icofont-envelope"></i>
								<h4>Email:</h4>
								<p>info@example.com</p>
							</div>

							<div class="phone">
								<i class="icofont-phone"></i>
								<h4>Call:</h4>
								<p>+1 5589 55488 55s</p>
							</div>

						</div>

					</div>

					<div class="col-lg-8 mt-5 mt-lg-0">

						<form action="forms/contact.php" method="post" role="form"
							class="php-email-form">
							<div class="form-row">
								<div class="col-md-6 form-group">
									<input type="text" name="name" class="form-control" id="name"
										placeholder="Your Name" data-rule="minlen:4"
										data-msg="Please enter at least 4 chars" />
									<div class="validate"></div>
								</div>
								<div class="col-md-6 form-group">
									<input type="email" class="form-control" name="email"
										id="email" placeholder="Your Email" data-rule="email"
										data-msg="Please enter a valid email" />
									<div class="validate"></div>
								</div>
							</div>
							<div class="form-group">
								<input type="text" class="form-control" name="subject"
									id="subject" placeholder="Subject" data-rule="minlen:4"
									data-msg="Please enter at least 8 chars of subject" />
								<div class="validate"></div>
							</div>
							<div class="form-group">
								<textarea class="form-control" name="message" rows="5"
									data-rule="required" data-msg="Please write something for us"
									placeholder="Message"></textarea>
								<div class="validate"></div>
							</div>
							<div class="mb-3">
								<div class="loading">Loading</div>
								<div class="error-message"></div>
								<div class="sent-message">Your message has been sent.
									Thank you!</div>
							</div>
							<div class="text-center">
								<button type="submit">Send Message</button>
							</div>
						</form>

					</div>

				</div>

			</div>
		</section>
		<!-- End Contact Section -->

	<form action="<c:url value='/TravelMaker/Planner.kosmo'/>">
		<div
			class="d-flex flex-lg-row flex-column align-items-start justify-content-lg-between justify-content-start">

			<button class="home_search_button" style="">도시 선택</button>
		</div>
	</form>
</main>
	<!-- End #main -->






