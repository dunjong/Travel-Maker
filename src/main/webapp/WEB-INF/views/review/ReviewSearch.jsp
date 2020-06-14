<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 리뷰 검색 여동준 -->
<head>
<style>
#reviewBack {
	text-align: center;
}

#reviewBackImage {
	background-image: url("<c:url value='/images/reviewBackLarge.jpg'/>");
	height: 1041px;
	background-repeat: no-repeat;
	background-position: center center;
}

#reviewSearchTag {
	height: 50px;
	width: 25%;
	border-radius: 20px;
	background: #F49739;
	color: #FFFFFF;
	font-family: 'Oswald', sans-serif;
	font-size: 16px;
	font-weight: 400;
}

#reviewSearch {
	width: 60%;
	border-radius: 20px;
}

#reviewSearchButton {
	text-align: center;
	width: 161px;
	height: 52px;
	background: #F49739;
	color: #FFFFFF;
	font-family: 'Oswald', sans-serif;
	font-size: 16px;
	font-weight: 400;
	text-transform: uppercase;
	border-radius: 20px;
	border: none;
	outline: none;
	cursor: pointer;
	width: 15%;
}

.reviewInformation {
	width: 100%;
	height: 200px;
	background-color: white;
	margin-top: 20px;
	border-radius: 20px;
}

.bestReviewAndLikes {
	width: 15%;
	height: 100%;
	float: left;
	color: #3EB489;
	font-size: 1.5em;
	font-weight: bold;
	text-align: center;
}

.bestReviewAndLikes img {
	border-radius: 20px;
}

.reviewTextInformation {
	width: 55%;
	height: 100%;
	float: left;
	color: black;
}

.reviewPlaceInfomation {
	font-weight: bold;
	color: #3EB489;
}

.reviewMapOrImage {
	width: 30%;
	height: 100%;
	float: left;
	padding: 15px;
	text-align: center;
	display: flex;
	justify-content: center;
	align-items: center;
}

.reviewMapOrImage img {
	max-height: 100%;
	max-width: 100%;
	border-radius: 20px;
}
</style>
</head>
<!-- Search -->
<div class="home_search">
	<div class="container">
		<div class="row">
			<div class="col">
				<div class="home_search_container">
					<div class="home_search_title">리뷰 검색</div>
					<div class="home_search_content">
						<form action="#" class="home_search_form" id="home_search_form">
							<div
								class="d-flex flex-lg-row flex-column align-items-start justify-content-lg-between justify-content-start">
								<select class="form-control input-sm" name="age"
									id="reviewSearchTag">
									<option>검색 범위를 선택하세요</option>
									<option value="city">도시</option>
									<option value="food">식당</option>
									<option value="tours">관광명소</option>
									<option value="hotels">숙소</option>
									<option value="all">전체 검색</option>
								</select> <input type="text" id="reviewSearch" class="search_input"
									placeholder="검색어를 입력하세요" required="required">
								<button id="reviewSearchButton">리뷰 검색</button>
							</div>
						</form>
							<!-- 여기부터 반복처리해야할 부분 -->
							<a href="<c:url value='/TravelMaker/Review.kosmo'/>">
								<div class="reviewInformation">
									<div class="bestReviewAndLikes">
										<img src="<c:url value='/images/goldCrown.png'/>" alt="1등">
										<br> <img src="<c:url value='/images/likes.png'/>"
											alt="좋아요"> <br> <span>126</span> <span>명</span>
									</div>
									<div class="reviewTextInformation">
										<br>
										<h4>가족끼리 구경하기 좋아요</h4>
										<p>숲이 생각보다 꽤 크고 원숭이가 엄청 많아요 ㅋㅋㅋㅋ 나무들도 넘 멋있고 원숭이도 가까이서보고
											중간에 미술관도 한번 구경하고~ 다만 겁나 더워요.... 커피가 비쌈..</p>
										<h5 class="reviewPlaceInfomation">관광명소 : 몽키 포레스트 거리</h5>
									</div>
									<div class="reviewMapOrImage">
										<img src="<c:url value='/images/reviewImage1.PNG'/>"
											alt="리뷰지도/사진">
									</div>
								</div>
							</a>
							<!-- 여기까지 반복처리해야할 부분 -->
							<!-- 임시 레이아웃을 위해 반복해놓은 다이브 시작 -->
							<a href="<c:url value='/TravelMaker/Review.kosmo'/>">
								<div class="reviewInformation">
									<div class="bestReviewAndLikes">
										<img src="<c:url value='/images/silverCrown.png'/>" alt="2등">
										<br> <img src="<c:url value='/images/likes.png'/>"
											alt="좋아요"> <br> <span>95</span> <span>명</span>
									</div>
									<div class="reviewTextInformation">
										<br>
										<h4>즐거웠습니다.</h4>
										<p>우리들이 보기 편하게 꾸미지 않았지만 원숭이들이 스스로와 터를 잡은 만큼 우리는 그들에게 피해주지
											않고 잘 관람하는게 예절이라 생각하고 즐기고 왔습니다.</p>
										<h5 class="reviewPlaceInfomation">관광명소 : 몽키 포레스트 거리</h5>
									</div>
									<div class="reviewMapOrImage">
										<img src="<c:url value='/images/reviewImage2.PNG'/>"
											alt="리뷰지도/사진">
									</div>
								</div>
							</a> <a href="<c:url value='/TravelMaker/Review.kosmo'/>">
								<div class="reviewInformation">
									<div class="bestReviewAndLikes">
										<br> <img src="<c:url value='/images/likes.png'/>"
											alt="좋아요"> <br> <span>36</span> <span>명</span>
									</div>
									<div class="reviewTextInformation">
										<br>
										<h4>매우 많은 원숭이와 함께 할 수 있음</h4>
										<p>정말 엄청나게 많은 원숭이들을 볼 수 있고 귀엽다. 정말 많은 원숭이들이 있으며 귀여움. 원숭이들이
											장난기가 많다. 덥긴 덥다. 나시 입고 가면 팔이 타는 고통을 느낄 수 있으나 원숭이가 귀여우니 참을 수
											있다. 우붓가면 돌아보는데 얼마 안걸리니 꼭 가보길 추천한다.</p>
										<h5 class="reviewPlaceInfomation">관광명소 : 몽키 포레스트 거리</h5>
									</div>
									<div class="reviewMapOrImage">
										<img src="<c:url value='/images/reviewImage3.PNG'/>"
											alt="리뷰지도/사진">
									</div>
								</div>
							</a> <a href="<c:url value='/TravelMaker/Review.kosmo'/>">
								<div class="reviewInformation">
									<div class="bestReviewAndLikes">
										<br> <img src="<c:url value='/images/likes.png'/>"
											alt="좋아요"> <br> <span>27</span> <span>명</span>
									</div>
									<div class="reviewTextInformation">
										<br>
										<h4>여전히 좋아요</h4>
										<p>두 번째 방문이네요. 일행이 첫 방문이라 같이 갔는데 여전히 멋진 곳입니다.예전보다 원숭이와 람께
											사진을 찍을 수 읶는 포인트도 늘어난 것 같습니다. 한번 쯤은 꼭 방문해야 하는 곳인듯 합니다. 물론
											원숭이들중에는 관광객들의 가방을 털려고 하거나 시비를 걸 수도 있으니 조심해야 합니다^^</p>
										<h5 class="reviewPlaceInfomation">관광명소 : 몽키 포레스트 거리</h5>
									</div>
									<div class="reviewMapOrImage">
										<img src="<c:url value='/images/reviewImage4.PNG'/>"
											alt="리뷰지도/사진">
									</div>
								</div>
							</a>
							<!-- 임시 레이아웃을 위해 반복해놓은 다이브 끝 -->
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div id=reviewBack>
	<div id="reviewBackImage"></div>
</div>