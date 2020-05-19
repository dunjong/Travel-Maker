<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
	$(function(){
		//option을 {}객체(json)로 줄때는 함수의 인자로 처음부터 주거나
		/* $( "#datepicker" ).datepicker({
			showAnim: "bounce",
			dateFormat: "yy년 mm월 dd일"
		}); */
		//{}이 아닌 인자로 option을 줄때(setter로)는 datepicker()로 생성후에
		//$( "#datepicker" ).datepicker();
		//setter
		//$( "#datepicker" ).datepicker('option','showAnim','fold');
		//$( "#datepicker" ).datepicker('option','dateFormat','yy년 mm월 dd일');
		$( "#datepicker" ).datepicker({
			showAnim: "slideDown",
			dateFormat: "yy년 mm월 dd일",
			minDate: new Date(),
			onSelect:function(dateText){
				$('#display').html(dateText);
			}
		});
		$( "#datepicker1" ).datepicker({
			showAnim: "slideDown",
			dateFormat: "yy년 mm월 dd일",
			minDate: new Date(),
			onSelect:function(dateText){
				$('#display').html(dateText);
			}
		});
		
		//버튼 이미지 사용시: 버튼의 크기 조정
		//$('.ui-datepicker-trigger').prop('style', 'width:40px;height:40px;');
		//$('.ui-datepicker-trigger > img').prop('style', 'width:40px;height:40px;vertical-align:middle;margin-top:-4px;margin-left:-10px');
		//이미지 온리 사용시
	});
</script>


	<!-- Search -->
	<div class="home_search">
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="home_search_container">
						<div class="home_search_title">호텔 검색</div>
						<div class="home_search_content">
							<form action="#" class="home_search_form" id="home_search_form">
								<div class="d-flex flex-lg-row flex-column align-items-start justify-content-lg-between justify-content-start">
									<input type="text" class="search_input search_input_1" placeholder="위치" required="required">
									<input type="text" id="datepicker" class="search_input search_input_3" placeholder="check in" required="required">
									<input type="text" id="datepicker1" class="search_input search_input_4" placeholder="check out" required="required">
									<input type="text" class="search_input search_input_5" placeholder="인원" required="required">
									<button class="home_search_button" style="center;">호텔 검색</button>
								</div>							
							</form>
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


	<!-- Footer -->

