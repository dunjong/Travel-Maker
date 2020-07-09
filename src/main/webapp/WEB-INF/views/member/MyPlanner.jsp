<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false" contentType="text/html; charset=UTF-8"%>
<script>
var lists_planner=${lists_planner};
	console.log(lists_planner);
var lists_cities=${lists_cities};
	console.log(lists_cities);

</script>

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
								<div class="intro_icon">
									<img src="<c:url value='/images/beach.svg'/>" alt="">
								</div>
								<div class="intro_content">
									<div class="intro_title">인기 여행지</div>
									<div class="intro_subtitle">
										<p>#여행</p>
									</div>
								</div>
							</div>
						</div>

						<!-- Intro Item -->
						<div class="col-lg-4 intro_col">
							<div
								class="intro_item d-flex flex-row align-items-end justify-content-start">
								<div class="intro_icon">
									<img src="<c:url value='/images/wallet.svg'/>" alt="">
								</div>
								<div class="intro_content">
									<div class="intro_title">최고의 가격</div>
									<div class="intro_subtitle">
										<p>Best Price</p>
									</div>
								</div>
							</div>
						</div>

						<!-- Intro Item -->
						<div class="col-lg-4 intro_col">
							<div
								class="intro_item d-flex flex-row align-items-end justify-content-start">
								<div class="intro_icon">
									<img src="<c:url value='/images/suitcase.svg'/>" alt="">
								</div>
								<div class="intro_content">
									<div class="intro_title">놀라운 서비스</div>
									<div class="intro_subtitle">
										<p>Amazing Service</p>
									</div>
								</div>
							</div>
						</div>
					
					</div>
				</div>
			</div>
		</div>
	</div>
</div>



<div class="destinations" id="destinations">
		<div class="container">
			<div class="row">
				<div class="col text-center">
					<div class="section_subtitle">Travel Maker</div>
					<div class="section_title"><h2>선택한 도시</h2></div>
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
								<div class="destination_subtitle"><p>꿈의 섬 발리로 바로 떠나보세요</p></div>
								<div class="destination_price">From $699</div>
							</div>
						</div>

						<!-- Destination -->
						<div class="destination item">
							<div class="destination_image">
								<img src="<c:url value='/images/destination_2.jpg'/>" alt="">
							</div>
							<div class="destination_content">
								<div class="destination_title"><a href="destinations.html">Indonesia</a></div>
								<div class="destination_subtitle"><p>인도는 지금 몇시야?인도네시아로 떠나보세요</p></div>
								<div class="destination_price">From $444</div>
							</div>
						</div>

						<!-- Destination -->
						<div class="destination item">
							<div class="destination_image">
								<img src="<c:url value='/images/destination_3.jpg'/>" alt="">
							</div>
							<div class="destination_content">
								<div class="destination_title"><a href="destinations.html">San Francisco</a></div>
								<div class="destination_subtitle"><p>너 코가 어딨어? 산프란 시스코로 떠나보세요</p></div>
								<div class="destination_price">From $699</div>
							</div>
						</div>

						<!-- Destination -->
						<div class="destination item">
							<div class="destination_image">
								<img src="<c:url value='/images/destination_4.jpg'/>" alt="">
							</div>
							<div class="destination_content">
								<div class="destination_title"><a href="destinations.html">Paris</a></div>
								<div class="destination_subtitle"><p>위이이이잉~~파리로 떠나보세요</p></div>
								<div class="destination_price">From $8282</div>
							</div>
						</div>

						<!-- Destination -->
						<div class="destination item">
							<div class="destination_image">
								<img src="<c:url value='/images/destination_5.jpg'/>" alt="">
							</div>
							<div class="destination_content">
								<div class="destination_title"><a href="destinations.html">Phi Phi Island</a></div>
								<div class="destination_subtitle"><p>어딘지 모르는데 가보세요!</p></div>
								<div class="destination_price">From $9</div>
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
