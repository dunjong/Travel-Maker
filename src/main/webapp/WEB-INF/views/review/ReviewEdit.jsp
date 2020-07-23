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

.reviewWrite {
	max-height: 100%;
	max-width: 100%;
	background-color: white;
	border-radius: 20px;
	padding: 10px;
}

#reviewWriteTittle {
	width: 100%;
	border-radius: 20px;
	margin-bottom: 10px;
}
#reviewWriteCityTag {
	height: 50px;
	width: 18%;
	border-radius: 20px;
	background: #F49739;
	color: #FFFFFF;
	font-family: 'Oswald', sans-serif;
	font-size: 16px;
	font-weight: 400;
}
#reviewWritePlaceTag {
	height: 50px;
	width: 22%;
	border-radius: 20px;
	background: #F49739;
	color: #FFFFFF;
	font-family: 'Oswald', sans-serif;
	font-size: 16px;
	font-weight: 400;
}
#reviewWritePlace {
	width: 60%;
	border-radius: 20px;
}

#reviewWriteText {
	width: 100%;
	height: 500px;
	border-radius: 20px;
	margin-top: 10px;
	text-align: justify;
	background: #f2f5f6;
	border: none;
	outline: none;
	padding-left: 17px;
	font-family: 'Oswald', sans-serif;
	font-size: 14px !important;
	font-weight: 500 !important;
	color: #72728c !important;
	padding-top: 10px;
	resize: none;
}

#reviewWriteImageUpButtonInput {
	display: none;
}

#reviewWriteImageUpButton {
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
	width: 30%;
}

#reviewWritePwd {
	width: 50%;
	border-radius: 20px;
	margin-bottom: 10px;
}

#reviewWriteSubmmit {
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
	width: 20%;
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
	background-color:white;
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
					<div class="home_search_title">리뷰 수정하기</div>
					<div class="home_search_content">
						<div class="reviewWrite">
							<form action="<c:url value='/TravelMaker/ReviewEditOK.kosmo'/>"
								class="home_search_form" id="home_search_form" method="post">
								<input type="hidden" name="review_no"
									value="${record.review_no}" /> <input type="text"
									id="reviewWriteTittle" class="search_input" name="review_title"
									placeholder="제목을 입력하세요" value="${record.review_title}"
									required="required" onfocus="this.placeholder = ''"
									onblur="this.placeholder = '제목을 입력하세요'">
								<div
									class="d-flex flex-lg-row flex-column align-items-start justify-content-lg-between justify-content-start">
									<select style="width:100%" class="col-lg-4" id="reviewWriteCityTag" name="city_no" required="required">
										<option value="2" <c:if test="${record.city_no == '2'}">selected</c:if>>세부</option>
										<option value="3" <c:if test="${record.city_no == '3'}">selected</c:if>>보라카이</option>
										<option value="4" <c:if test="${record.city_no == '4'}">selected</c:if>>마닐라</option>
										<option value="5" <c:if test="${record.city_no == '5'}">selected</c:if>>하노이</option>
										<option value="6" <c:if test="${record.city_no == '6'}">selected</c:if>>나트랑</option>
										<option value="7" <c:if test="${record.city_no == '7'}">selected</c:if>>다낭</option>
										<option value="8" <c:if test="${record.city_no == '8'}">selected</c:if>>푸켓</option>
										<option value="9" <c:if test="${record.city_no == '9'}">selected</c:if>>방콕</option>
										<option value="10" <c:if test="${record.city_no == '10'}">selected</c:if>>발리</option>
										<option value="11" <c:if test="${record.city_no == '11'}">selected</c:if>>롬복</option>
										<option value="12" <c:if test="${record.city_no == '12'}">selected</c:if>>쿠알라룸푸르</option>
										<option value="13" <c:if test="${record.city_no == '13'}">selected</c:if>>코타키나발루</option>
										<option value="14" <c:if test="${record.city_no == '14'}">selected</c:if>>싱가포르</option>
										<option value="15" <c:if test="${record.city_no == '15'}">selected</c:if>>라오스</option>
									</select> <select style="width:100%" class="col-lg-5" id="reviewWritePlaceTag">
										<option>리뷰 장소를 선택하세요</option>
										<option value="food">식당</option>
										<option value="tours">관광명소</option>
										<option value="hotels">숙소</option>
										<option value="myPlanner">내 플랜</option>
									</select> <input style="width:100%" type="text" id="reviewWritePlace" class="search_input"
										placeholder="장소 이름을 입력하세요">
								</div>
								<textarea rows="" cols="" id="reviewWriteText"
									name="review_content" placeholder="리뷰 내용을 입력하세요"
									required="required">${record.review_content}</textarea>
								<div
									class="d-flex flex-lg-row flex-column align-items-start justify-content-lg-between justify-content-start">
									<input type="file" id="reviewWriteImageUpButtonInput"
										onchange="fileCheck(this)"
										accept="image/gif,image/jpeg,image/png">
									<button style="width:100%" id="reviewWriteImageUpButton" type="button">
										사진을 올리시려면 클릭하세요</button>
									
									<button style="width:100%" type="submit" id="reviewWriteSubmmit">리뷰 수정 완료</button>
								
								</div>
							</form>
						</div>
						<div class="reviewFooterUtil">
							<br> <a
								href="<c:url value='/TravelMaker/Review.kosmo?review_no=${record.review_no}'/>"> <img
								src="<c:url value='/images/reviewList.png'/>" alt="리뷰로 돌아가기">
							</a><br> <span>리뷰로 돌아가기</span>
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
	$(function() {
		$('#reviewWriteImageUpButton').click(function(e) {
			e.preventDefault();
			$('#reviewWriteImageUpButtonInput').click();
		});
	});
	function fileCheck(obj) {
		pathpoint = obj.value.lastIndexOf('.');
		filepoint = obj.value.substring(pathpoint + 1, obj.length);
		filetype = filepoint.toLowerCase();
		if (filetype == 'jpg' || filetype == 'gif' || filetype == 'png'
				|| filetype == 'jpeg' || filetype == 'bmp') {
		} else {
			alert('사진(이미지 파일)만 올려주세요!');
			parentObj = obj.parentNode
			node = parentObj.replaceChild(obj.cloneNode(true), obj);
			return false;
		}
	}
</script>