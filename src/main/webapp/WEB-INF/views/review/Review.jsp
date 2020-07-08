<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

.review {
	max-height: 100%;
	max-width: 100%;
	background-color: white;
	border-radius: 20px;
}

.reviewText {
	width: 96%;
	color: black;
	margin-left: 20px;
}

.reviewTextTittle {
	text-align: center;
}

.reviewPlaceInfomation {
	font-weight: bold;
	color: #389dff;
}

.reviewText p {
	color: #777777;
	font-size: 1.4em;
}

.reviewMapOrImage {
	padding: 15px;
	text-align: center;
}

.reviewMapOrImage img {
	max-height: 80%;
	max-width: 100%;
	border-radius: 20px;
}

.reviewFooterBack {
	text-align: center;
}

.reviewFooter {
	
}

.likesAndBack {
	color: #3EB489;
	font-size: 1.5em;
	font-weight: bold;
}

.likesAndBack img {
	border-radius: 20px;
}

.likes {
	
}

.back {
	
}
</style>
</head>
<!-- Search -->
<div class="home_search">
	<div class="container">
		<div class="row">
			<div class="col">
				<div class="home_search_container">
					<div class="home_search_title">리뷰</div>
					<div class="home_search_content">
						<div class="review">
							<div class="reviewText">
								<br>
								<h4 class="reviewTextTittle">가족끼리 구경하기 좋아요</h4>
								<a href="https://www.google.com/maps/search/몽키+포레스트+거리"
									target="_blank">
									<h5 class="reviewPlaceInfomation">관광명소 : 몽키 포레스트 거리</h5>
								</a>
								<p>숲이 생각보다 꽤 크고 원숭이가 엄청 많아요 ㅋㅋㅋㅋ 나무들도 넘 멋있고 원숭이도 가까이서보고 중간에
									미술관도 한번 구경하고~ 다만 겁나 더워요.... 커피가 비쌈..</p>
							</div>
							<div class="reviewMapOrImage">
								<img src="<c:url value='/images/reviewImage1.PNG'/>"
									alt="리뷰지도/사진">
							</div>
							<div class="reviewFooterBack">
								<div class="reviewFooter">
									<div class="likesAndBack">
										<div class="likes">
											<br> <img src="<c:url value='/images/likes.png'/>"
												alt="좋아요"> <br> <span>126</span> <span>명</span>
										</div>
										<div class="back">
											<br> <a
												href="<c:url value='/TravelMaker/ReviewSearch.kosmo'/>"> <img
												src="<c:url value='/images/back.png'/>" alt="돌아가기">
											</a><br> <span>목록으로 돌아가기</span>
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
</div>
<div id=reviewBack>
	<div id="reviewBackImage"></div>
</div>