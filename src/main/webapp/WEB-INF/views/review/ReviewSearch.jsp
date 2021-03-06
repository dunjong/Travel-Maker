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
	height: 50px;
	border-radius: 20px;
}

#reviewSearchButton {
	text-align: center;
	width: 100%;
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
	padding-top:67px;
	padding-left:41px;
	font-size: 1.5em;
	font-weight: bold;
	text-align: left;
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

.reviewPagingBack {
text-align:center;
}

.reviewPaging {
	width: 100%;
	height: 70px;
	background-color: white;
	margin-top: 20px;
	border-radius: 30px;
	display: inline-block;
	text-align:center;

}

.reviewPaging a {
	color: #3EB489;
	font-size: 2.5em;
	font-weight: bold;
}

.reviewPaging span {
	color: #2a7a5d;
	font-size: 1.6em;
	font-weight: bold;
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
.home_search_content{
	background-color:#e0e0e0;
	border-radius:20px;
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
		
					<div id='bgc'class="home_search_content">
						<form action="<c:url value='/TravelMaker/ReviewSearch.kosmo'/>"
							class="home_search_form" id="home_search_form">
					
							<div
								class="d-flex flex-lg-row flex-column align-items-start justify-content-lg-between justify-content-start">
					
								<select class="col-lg-3" style="width:100%" id="reviewSearchTag"
									name="searchColumn" required="required">
									
									<option>검색 범위를 선택하세요</option>
									<option value="review_title">제목</option>
									<option value="review_content">내용</option>
									<option value="city_no" >도시</option>
								</select>
						
								<input type="text" id="reviewSearch" class="search_input col-lg-6" style="width:100%"
									placeholder="검색어를 입력하세요" required="required" name="searchWord">
								<button class="col-lg-3" type="submit" id="reviewSearchButton">리뷰 검색</button>
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
									<h3 style="color:gray; text-align: center;">&nbsp;등록된 게시물이 없습니다.</h3>
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
											<i style="color:red;" class="fas fa-heart"></i> &nbsp;
											<i style="color:black;" class="fas fa-heart-broken"></i>
									
											<br> <span style="padding-right: 20px;">${item.like}</span>
											&nbsp;<span>${item.hate}</span>
										
										</div>
										<div class="reviewTextInformation">
											<br />
											<h4>${item.review_title}</h4>
											<p>${fn:length(item.review_content)<11? item.review_content: fn:substring(item.review_content,0,11)}
												${fn:length(item.review_content)<11? "" : "..." }</p>
											
											<fmt:formatDate value="${item.review_date}"
												pattern="MM월 dd일 EEEE HH시mm분" var="postdate" />
											<span>작성일시 : ${postdate}</span><br>
											<span>작성자 : ${item.user_id}</span><br>
											<span>도시이름 : ${item.city_no}</span>
										</div>
										<div class="reviewMapOrImage">
											<img
												src="<c:url value='/resources/ReviewUpload/${item.review_file}'/>"
												alt="리뷰지도/사진">
										</div>
									</div>
								</a>
							</c:forEach>
						</c:if>
						<div class="reviewPagingBack">
							<div class="reviewPaging">${pagingString}</div>
						</div>
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