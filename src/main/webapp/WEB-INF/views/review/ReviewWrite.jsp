<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 리뷰 작성하기 여동준 -->
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

.reviewWrite {
	max-height: 100%;
	max-width: 100%;
	background-color: white;
	border-radius: 20px;
	padding: 10px;
}
#reviewPlaceTag {
	height: 50px;
	width: 25%;
	border-radius: 20px;
	background: #F49739;
	color: #FFFFFF;
	font-family: 'Oswald', sans-serif;
	font-size: 16px;
	font-weight: 400;
}

#reviewPlace {
	width: 75%;
	border-radius: 20px;
}
.back {
	text-align: center;
}
</style>
</head>
<!-- Search -->
<div class="home_search">
	<div class="container">
		<div class="row">
			<div class="col">
				<div class="home_search_container">
					<div class="home_search_title">리뷰 작성하기</div>
					<div class="home_search_content">
						<div class="reviewWrite">
						<form action="#" class="home_search_form" id="home_search_form">
							<div
								class="d-flex flex-lg-row flex-column align-items-start justify-content-lg-between justify-content-start">
								<select class="form-control input-sm" name="age"
									id="reviewPlaceTag">
									<option>리뷰 장소를 선택하세요</option>
									<option value="city">도시</option>
									<option value="food">식당</option>
									<option value="tours">관광명소</option>
									<option value="hotels">숙소</option>
									<option value="myPlanner">내 플래너</option>
								</select> <input type="text" id="reviewPlace" class="search_input"
									placeholder="장소 이름을 입력하세요" required="required">
							</div>
						</form>
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
	<div id=reviewBack>
		<div id="reviewBackImage"></div>
	</div>