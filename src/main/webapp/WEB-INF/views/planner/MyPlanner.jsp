<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	

	<!-- Search -->

	<div class="home_search">
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="home_search_container">
						<div class="home_search_title">나의 플래너</div>
						<div class="home_search_content">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Intro -->

	<div class="intro">
		<div class="intro_background"></div>
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="intro_container">
						<div class="row">

							<!-- Intro Item -->
							<div class="col-lg-4 intro_col">
								<div class="intro_item d-flex flex-row align-items-end justify-content-start">
									<div class="intro_icon"><img src="<c:url value='/images/beach.svg'/>" alt=""></div>
									<div class="intro_content">
										<div class="intro_title">인기 여행지</div>
										<div class="intro_subtitle"><p>#여행</p></div>
									</div>
								</div>
							</div>

							<!-- Intro Item -->
							<div class="col-lg-4 intro_col">
								<div class="intro_item d-flex flex-row align-items-end justify-content-start">
									<div class="intro_icon"><img src="<c:url value='/images/wallet.svg'/>" alt=""></div>
									<div class="intro_content">
										<div class="intro_title">최고의 가격</div>
										<div class="intro_subtitle"><p>Sollicitudin mauris lobortis in.</p></div>
									</div>
								</div>
							</div>

							<!-- Intro Item -->
							<div class="col-lg-4 intro_col">
								<div class="intro_item d-flex flex-row align-items-end justify-content-start">
									<div class="intro_icon"><img src="<c:url value='/images/suitcase.svg'/>" alt=""></div>
									<div class="intro_content">
										<div class="intro_title">놀라운 서비스</div>
										<div class="intro_subtitle"><p>Nulla pretium tincidunt felis, nec.</p></div>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>		
			</div>
		</div>
	</div>

		<!-- Destinations -->

	<div class="destinations" id="destinations">
		<div class="container">
			<div class="row">
				<div class="col text-center">
					<div class="section_subtitle">simply amazing places</div>
					<div class="section_title"><h2>Popular Destinations</h2></div>
				</div>
			</div>
			<div class="row destinations_row">
				<div class="col">
					<div class="destinations_container item_grid">

						<!-- Destination -->
						<div class="destination item">
							<div class="destination_image">
								<img src="<c:url value='/images/destination_1.jpg'/>" alt="">
								<div class="spec_offer text-center"><a href="#">Special Offer</a></div>
							</div>
							<div class="destination_content">
								<div class="destination_title"><a href="destinations.html">Bali</a></div>
								<div class="destination_subtitle"><p>Nulla pretium tincidunt felis, nec.</p></div>
								<div class="destination_price">From $679</div>
							</div>
						</div>

						<!-- Destination -->
						<div class="destination item">
							<div class="destination_image">
								<img src="<c:url value='/images/destination_2.jpg'/>" alt="">
							</div>
							<div class="destination_content">
								<div class="destination_title"><a href="destinations.html">Indonesia</a></div>
								<div class="destination_subtitle"><p>Nulla pretium tincidunt felis, nec.</p></div>
								<div class="destination_price">From $679</div>
							</div>
						</div>

						<!-- Destination -->
						<div class="destination item">
							<div class="destination_image">
								<img src="<c:url value='/images/destination_3.jpg'/>" alt="">
							</div>
							<div class="destination_content">
								<div class="destination_title"><a href="destinations.html">San Francisco</a></div>
								<div class="destination_subtitle"><p>Nulla pretium tincidunt felis, nec.</p></div>
								<div class="destination_price">From $679</div>
							</div>
						</div>

						<!-- Destination -->
						<div class="destination item">
							<div class="destination_image">
								<img src="<c:url value='/images/destination_4.jpg'/>" alt="">
							</div>
							<div class="destination_content">
								<div class="destination_title"><a href="destinations.html">Paris</a></div>
								<div class="destination_subtitle"><p>Nulla pretium tincidunt felis, nec.</p></div>
								<div class="destination_price">From $679</div>
							</div>
						</div>

						<!-- Destination -->
						<div class="destination item">
							<div class="destination_image">
								<img src="<c:url value='/images/destination_5.jpg'/>" alt="">
							</div>
							<div class="destination_content">
								<div class="destination_title"><a href="destinations.html">Phi Phi Island</a></div>
								<div class="destination_subtitle"><p>Nulla pretium tincidunt felis, nec.</p></div>
								<div class="destination_price">From $679</div>
							</div>
						</div>

						<!-- Destination -->
						<div class="destination item">
							<div class="destination_image">
								<img src="<c:url value='/images/destination_6.jpg'/>" alt="">
							</div>
							<div class="destination_content">
								<div class="destination_title"><a href="destinations.html">Mykonos</a></div>
								<div class="destination_subtitle"><p>Nulla pretium tincidunt felis, nec.</p></div>
								<div class="destination_price">From $679</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Testimonials -->

	<div class="testimonials" id="testimonials">
		<div class="parallax_background parallax-window" data-parallax="scroll" data-image-src="<c:url value='/images/testimonials.jpg'/>" data-speed="0.8"></div>
		<div class="container">
			<div class="row">
				<div class="col text-center">
					<div class="section_subtitle">simply amazing places</div>
					<div class="section_title"><h2>Testimonials</h2></div>
				</div>
			</div>
			<div class="row testimonials_row">
				<div class="col">

					<!-- Testimonials Slider -->
					<div class="testimonials_slider_container">
						<div class="owl-carousel owl-theme testimonials_slider">
							
							<!-- Slide -->
							<div class="owl-item text-center">
								<div class="testimonial">Lorem ipsum dolor sit amet, consectetur adipiscing elit. lobortis dolor. Cras placerat lectus a posuere aliquet. Curabitur quis vehicula odio.</div>
								<div class="testimonial_author">
									<div class="testimonial_author_content d-flex flex-row align-items-end justify-content-start">
										<div>john turner,</div>
										<div>client</div>
									</div>
								</div>
							</div>

							<!-- Slide -->
							<div class="owl-item text-center">
								<div class="testimonial">Lorem ipsum dolor sit amet, consectetur adipiscing elit. lobortis dolor. Cras placerat lectus a posuere aliquet. Curabitur quis vehicula odio.</div>
								<div class="testimonial_author">
									<div class="testimonial_author_content d-flex flex-row align-items-end justify-content-start">
										<div>john turner,</div>
										<div>client</div>
									</div>
								</div>
							</div>

							<!-- Slide -->
							<div class="owl-item text-center">
								<div class="testimonial">Lorem ipsum dolor sit amet, consectetur adipiscing elit. lobortis dolor. Cras placerat lectus a posuere aliquet. Curabitur quis vehicula odio.</div>
								<div class="testimonial_author">
									<div class="testimonial_author_content d-flex flex-row align-items-end justify-content-start">
										<div>john turner,</div>
										<div>client</div>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="test_nav">
			<ul class="d-flex flex-column align-items-end justify-content-end">
				<li><a href="#">City Breaks Clients<span>01</span></a></li>
				<li><a href="#">Cruises Clients<span>02</span></a></li>
				<li><a href="#">All Inclusive Clients<span>03</span></a></li>
			</ul>
		</div>
	</div>

	<!-- News -->

	<div class="news" id="news">
		<div class="container">
			<div class="row">
				<div class="col-xl-8">
					<div class="news_container">
						
						<!-- News Post -->
						<div class="news_post d-flex flex-md-row flex-column align-items-start justify-content-start">
							<div class="news_post_image"><img src="<c:url value='/images/news_1.jpg'/>" alt=""></div>
							<div class="news_post_content">
								<div class="news_post_date d-flex flex-row align-items-end justify-content-start">
									<div>02</div>
									<div>june</div>
								</div>
								<div class="news_post_title"><a href="#">Best tips to travel light</a></div>
								<div class="news_post_category">
									<ul>
										<li><a href="#">lifestyle & travel</a></li>
									</ul>
								</div>
								<div class="news_post_text">
									<p>Pellentesque sit amet elementum ccumsan sit amet mattis eget, tristique at leo. Vivamus massa.Tempor massa et laoreet.</p>
								</div>
							</div>
						</div>

						<!-- News Post -->
						<div class="news_post d-flex flex-md-row flex-column align-items-start justify-content-start">
							<div class="news_post_image"><img src="<c:url value='/images/news_2.jpg'/>" alt=""></div>
							<div class="news_post_content">
								<div class="news_post_date d-flex flex-row align-items-end justify-content-start">
									<div>01</div>
									<div>june</div>
								</div>
								<div class="news_post_title"><a href="#">Best tips to travel light</a></div>
								<div class="news_post_category">
									<ul>
										<li><a href="#">lifestyle & travel</a></li>
									</ul>
								</div>
								<div class="news_post_text">
									<p>Tempor massa et laoreet malesuada. Pellentesque sit amet elementum ccumsan sit amet mattis eget, tristique at leo.</p>
								</div>
							</div>
						</div>

						<!-- News Post -->
						<div class="news_post d-flex flex-md-row flex-column align-items-start justify-content-start">
							<div class="news_post_image"><img src="<c:url value='/images/news_3.jpg'/>" alt=""></div>
							<div class="news_post_content">
								<div class="news_post_date d-flex flex-row align-items-end justify-content-start">
									<div>29</div>
									<div>may</div>
								</div>
								<div class="news_post_title"><a href="#">Best tips to travel light</a></div>
								<div class="news_post_category">
									<ul>
										<li><a href="#">lifestyle & travel</a></li>
									</ul>
								</div>
								<div class="news_post_text">
									<p>Vivamus massa.Tempor massa et laoreet malesuada. Aliquam nulla nisl, accumsan sit amet mattis.</p>
								</div>
							</div>
						</div>

					</div>
				</div>

				<!-- News Sidebar -->
				<div class="col-xl-4">
					<div class="travello">
						<div class="background_image" style="background-image:url(<c:url value='/images/travello.jpg'/>)"></div>
						<div class="travello_content">
							<div class="travello_content_inner">
								<div></div>
								<div></div>
							</div>
						</div>
						<div class="travello_container">
							<div class="d-flex flex-column align-items-center justify-content-end">
								<a href="#">
									<span class="travello_title">Get a 20% Discount</span>
									<span class="travello_subtitle">Buy Your Vacation Online Now</span>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Footer -->

