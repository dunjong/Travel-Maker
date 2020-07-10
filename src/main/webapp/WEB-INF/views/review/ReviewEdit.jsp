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
	text-align: center;
}

#reviewWritePlaceTag {
	height: 50px;
	width: 25%;
	border-radius: 20px;
	background: #F49739;
	color: #FFFFFF;
	font-family: 'Oswald', sans-serif;
	font-size: 16px;
	font-weight: 400;
}

#reviewWritePlace {
	width: 75%;
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
									<select class="form-control input-sm" id="reviewWritePlaceTag">
										<option>리뷰 장소를 선택하세요</option>
										<option value="city">도시</option>
										<option value="food">식당</option>
										<option value="tours">관광명소</option>
										<option value="hotels">숙소</option>
										<option value="myPlanner">내 플래너</option>
									</select> <input type="text" id="reviewWritePlace" class="search_input"
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
									<button id="reviewWriteImageUpButton" type="button">
										사진을 올리시려면 클릭하세요</button>
									<input type="password" id="reviewWritePwd" class="search_input"
										placeholder="수정/삭제시 사용하실 비밀번호를 입력하세요">
									<button type="submit" id="reviewWriteSubmmit">리뷰 수정 완료</button>
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