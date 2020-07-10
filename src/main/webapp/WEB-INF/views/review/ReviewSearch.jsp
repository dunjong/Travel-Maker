<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

.reviewFooterUtil {
	text-align: center;
	color: #3EB489;
	font-size: 1.5em;
	font-weight: bold;
}

.reviewFooterUtil img {
	border-radius: 20px;
}

.reviewFooterUtil span {
	color: #3EB489;
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
								<select class="form-control input-sm" id="reviewSearchTag">
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
						<c:if test="${empty list}" var="isEmpty">
							<div class="reviewInformation">
								<div class="bestReviewAndLikes">
									<img src=""> <br> <img src=""> <br> <span></span>
									<span></span>
								</div>
								<div class="reviewTextInformation">
									<br>
									<h4></h4>
									<p>등록된 게시물이 없습니다.</p>
									<h5 class="reviewPlaceInfomation"></h5>
								</div>
								<div class="reviewMapOrImage">
									<img src="" alt="">
								</div>
							</div>
						</c:if>
						<c:if test="${not isEmpty}">
							<c:forEach items="${list}" var="item" varStatus="loop">
								<a
									href="<c:url value='/TravelMaker/Review.kosmo?review_no=${item.review_no}'/>">
									<div class="reviewInformation">
										<div class="bestReviewAndLikes">
											<br> <img src="<c:url value='/images/reviewLikes.png'/>"
												alt="좋아요"> <br> <span>${item.review_no}</span> <span>명</span>
										</div>
										<div class="reviewTextInformation">
											<br />
											<h4>${item.review_title}</h4>
											<p>${fn:length(item.review_content)<79? item.review_content: fn:substring(item.review_content,0,79)}
											${fn:length(item.review_content)<79? "" : "..." }</p>
											<h5 class="reviewPlaceInfomation">관광명소 : 몽키 포레스트</h5>
											<fmt:formatDate value="${item.review_date}" pattern="yyyy년 MM월 dd일 EEEE a HH:mm:ss" var="postdate"/>
											<p>작성일시 : ${postdate}</p>
										</div>
										<div class="reviewMapOrImage">
											<img
												src="<c:url value='/images/reviewImage${item.review_no%4+1}.PNG'/>"
												alt="리뷰지도/사진">
										</div>
									</div>
								</a>
							</c:forEach>
						</c:if>
						<div class="reviewFooterUtil">
							<br /> <a href="<c:url value='/TravelMaker/ReviewWrite.kosmo'/>">
								<img src="<c:url value='/images/reviewEdit.png'/>" alt="리뷰 작성하기">
								<br /> <span>리뷰 작성하기</span>
							</a>
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