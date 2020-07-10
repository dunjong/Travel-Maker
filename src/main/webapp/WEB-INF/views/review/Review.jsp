<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
					<div class="home_search_title">리뷰</div>
					<div class="home_search_content">
						<div class="review">
							<div class="reviewText">
								<br>
								<h4 class="reviewTextTittle">${record.review_title}</h4>
								<a href="https://www.google.com/maps/search/몽키+포레스트"
									target="_blank">
									<h5 class="reviewPlaceInfomation">관광명소 : 몽키 포레스트</h5>
								</a>
								<p>${record.review_content}</p>
							</div>
							<div class="reviewMapOrImage">
								<img src="<c:url value='/images/reviewImage${tmpImgNo}.PNG'/>"
									alt="리뷰지도/사진">
							</div>
							<fmt:formatDate value="${record.review_date}"
								pattern="yyyy년 MM월 dd일 EEEE a HH:mm:ss" var="postdate" />
							<p>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp작성일시 : ${postdate}</p>
							<div class="reviewFooterUtil">
								<br> <img src="<c:url value='/images/reviewLikes.png'/>"
									alt="좋아요"> <br> <span>${record.review_no}</span> <span>명</span>
							</div>
						</div>
						<div class="reviewFooterUtil">
							<br> <a
								href="<c:url value='/TravelMaker/ReviewEdit.kosmo?review_no=${record.review_no}'/>">
								<img src="<c:url value='/images/reviewEdit.png'/>" alt="수정하기">
							</a><span>&nbsp&nbsp&nbsp&nbsp</span><a href="javascript:isDelete();">
								<img src="<c:url value='/images/reviewDelete.png'/>" alt="삭제하기">
							</a><span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span><a
								href="<c:url value='/TravelMaker/ReviewSearch.kosmo'/>"> <img
								src="<c:url value='/images/reviewBack.png'/>" alt="목록보기">
							</a> <br> <a
								href="<c:url value='/TravelMaker/ReviewEdit.kosmo?review_no=${record.review_no}'/>">
								<span>수정하기</span>
							</a><span> &nbsp&nbsp </span> <a
								href="<c:url value='/TravelMaker/ReviewDelete.kosmo?review_no=${record.review_no}'/>">
								<span>삭제하기</span>
							</a><span> &nbsp&nbsp </span> <a
								href="<c:url value='/TravelMaker/ReviewSearch.kosmo'/>"><span>목록보기</span></a>
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
<script>
	function isDelete() {
		if (confirm("정말로 삭제 하시겠습니까?"))
			location
					.replace("<c:url value='/TravelMaker/ReviewDelete.kosmo?review_no=${record.review_no}'/>");
	}
</script>