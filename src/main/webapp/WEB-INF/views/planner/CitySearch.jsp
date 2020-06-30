<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
/*  function allowDrop(ev) {
	  ev.preventDefault();
	}

	function drag(ev) {
	  ev.dataTransfer.setData("text", ev.target.id);
	}

	function drop(ev) {
	  ev.preventDefault();
	  var data = ev.dataTransfer.getData("text");
	  ev.target.appendChild(document.getElementById(data));
	} */
	 function uploadFile(){
        var form = $('#FILE_FORM')[0];
        console.log(form);
        var formData = new FormData(form);
        formData.append('fileObj', $('#FILE_TAG')[0].files[0]);
		console.log(formData.get('fileObj'));
        $.ajax({
            url: '<c:url value="/TravelMaker/Vision.kosmo"/>',
                    processData: false,
                    contentType: false,
                    data: formData,
                    type: 'POST',
                    success: function(result){
                    	//console.log(result);
                    	var k=0;
                    	$.each(result,function(tag,tagper){
                    		console.log("태그 이름:",tag)
                    		console.log("태그 퍼센트:",tagper)
                    		var tagsize = $('.tagmatch ul li').length;
                    		console.log(tagsize)
                    		
                    		for(var i=0;i<tagsize;i++){
                    			if($('.tagmatch ul li:eq('+i+') strong').html()==tag){
                    				$('.tagmatch ul li:eq('+i+') input:checkbox').prop('checked',true);
                    			}
                    		}
                    		$('.count-box:eq('+k+') p').html(tag);
                    		$('.count-box:eq('+k+') span').html(tagper);
                    		k++;
                    	});
                    	
                        
                    },
			        error:function(request,error){
						console.log('상태코드:',request.status);
						console.log('서버로부터 받은 HTML데이타:',request.responseText);
						console.log('에러:',error);
					}
            });
    }


</script>

<!-- ======= Hero Section ======= -->



<section id="hero" class="d-flex flex-column justify-content-center"
	style="position: relative">

	<div class="jb-box" style="position: absolute; left: 0px; top: 0px">

		<video muted autoplay loop>
			<source src="<c:url value='/plugins/assets/mp4/mainpage.mp4'/>"
				type="video/mp4">
			<strong>Your browser does not support the video tag.</strong>
		</video>

		<div class="jb-text">
			<div class="container" data-aos="zoom-in" data-aos-delay="100">
				<h1>ARE YOU READY FOR TRAVEL?</h1>
				<p>
					가고 싶은 곳을 입력해보세요 ex)<span class="typed"
						data-typed-items="세부, 다낭, 괌, 발리, 보라카이"></span>
				</p>
				<div>
					<input type="text" name="searchWord" class="form-control"
						style="opacity: 0.5;" />
					<button type="submit" class="btn btn-mycolor">검색</button>
				</div>
				<div class="social-links">
					<a href="#" class="twitter"><i class="bx bxl-twitter"></i></a> <a
						href="#" class="facebook"><i class="bx bxl-facebook"></i></a> <a
						href="#" class="instagram"><i class="bx bxl-instagram"></i></a> <a
						href="#" class="google-plus"><i class="bx bxl-skype"></i></a> <a
						href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
				</div>
				<div>
					<p style="font-size: 30px; border: bold;">아직 여행할 곳을 못찾으셨다면 아래를
						눌러보세요!</p>
				</div>
				<a href="#searchImages" class="btn-get-started scrollto"> <i
					class="bx bx-chevrons-down"></i>
				</a>
			</div>
		</div>
	</div>
</section>

<!-- End Hero -->

<main id="main">

	<!-- ======= searchImages Section ======= -->
	<section id="searchImages" class="searchImages">
		<div class="container" data-aos="fade-right">

			<div class="section-title">
				<h2>Search Images</h2>
				<p>가보고싶은 곳의 사진을 넣어 자신의 여행계획을 세워보는 것은 어떨까요?</p>
			</div>

			<div class="row">
				<div class="col-lg-6" style="border-right: 1px solid green;">
					<div class="col-xs-12 example">
						<img draggable="true" id="drag1"
							src="<c:url value='/plugins/assets/img/bananajoong.jpg'/>"
							ondragstart="drag(event)" class="img-find" alt=""> <img
							draggable="true" id="drag2"
							src="<c:url value='/plugins/assets/img/exampleI2.jpg'/>"
							ondragstart="drag(event)" class="img-find" alt=""> <img
							draggable="true" id="drag3"
							src="<c:url value='/plugins/assets/img/profile-img123.jpg'/>"
							ondragstart="drag(event)" class="img-find" alt="">
					</div>
					<!-- <div id="div1" class="col-xs-12 picture" ondrop="drop(event)"
						ondragover="allowDrop(event)"
						style="width: 200px; height: 200px; position: relative; top: 10%; left: 15%; border: 1px green solid;"></div> -->
					<form id="FILE_FORM" method="post" enctype="multipart/form-data"
						action="">
						<input type="file" id="FILE_TAG" name="FILE_TAG"> 
						<a class="ui-shadow ui-btn ui-corner-all" 
						href="javascript:uploadFile();"><button type="button" class="btn btn-info btn-lg float-right">전송</button></a>
					</form>
				</div> 
				
				
				<div class="col-lg-6 pt-4 pt-lg-0 tagview">
					<h3>사진 관련 태그들</h3>
					<div class="row tagmatch">
						<div class="col-lg-6">
							<ul>
								<li><i class="icofont-rounded-right"></i><strong>Beach </strong><input
									type="checkbox" value="Beach"/></li>
								<li><i class="icofont-rounded-right"></i><strong>City </strong><input
									type="checkbox" value="City"/></li>
								<li><i class="icofont-rounded-right"></i><strong>Coast </strong><input
									type="checkbox" value="Coast"/></li>
								<li><i class="icofont-rounded-right"></i><strong>Mountain </strong><input
									type="checkbox" value="Mountain"/></li>
								<li><i class="icofont-rounded-right"></i><strong>Ocean </strong><input
									type="checkbox" value="Ocean"/></li>
								<li><i class="icofont-rounded-right"></i><strong>Natural Landscape </strong><input
									type="checkbox" value="Natural Landscape"/></li>
								<li><i class="icofont-rounded-right"></i><strong>Metropolitan Area </strong><input
									type="checkbox" value="Metropolitan Area"/></li>
							</ul>
						</div>
						<div class="col-lg-6">
							<ul>
								<li><i class="icofont-rounded-right"></i><strong>Cave </strong><input
									type="checkbox" value="Cave"/></li>
								<li><i class="icofont-rounded-right"></i><strong>Golf </strong><input
									type="checkbox" value="Golf"/></li>
								<li><i class="icofont-rounded-right"></i><strong>Sea </strong><input
									type="checkbox" value="Sea"/></li>
								<li><i class="icofont-rounded-right"></i><strong>Ocean </strong><input
									type="checkbox" value="Ocean"/></li>
								<li><i class="icofont-rounded-right"></i><strong>Historic Site </strong><input type="checkbox" value="Historic Site"/></li>
								<li><i class="icofont-rounded-right"></i><strong>Nature </strong><input
									type="checkbox" value="Nature"/></li>
								<li><i class="icofont-rounded-right"></i><strong>Caribbean </strong><input
									type="checkbox" value="Caribbean"/></li>

							</ul>
						</div>
						<div class="citysearch-div">
							<button type="submit" class="citysearch" value="관련 도시 검색"></button>
						</div>
					</div>
				</div>
			</div>
			<div class="row search">
				<div class="col-lg-3 col-md-6">
					<div class="count-box">
						<i class="icofont-simple-smile"></i> <span
							data-toggle="counter-up">100</span>%
						<p><strong>사진을</strong></p>
					</div>
				</div>

				<div class="col-lg-3 col-md-6 mt-5 mt-md-0">
					<div class="count-box">
						<i class="icofont-simple-smile"></i> <span
							data-toggle="counter-up">100</span>%
						<p>등록해보세요</p>
					</div>
				</div>

				<div class="col-lg-3 col-md-6 mt-5 mt-lg-0">
					<div class="count-box">
						<i class="icofont-simple-smile"></i> <span
							data-toggle="counter-up">100</span>%
						<p>데이타가</p>
					</div>
				</div>

				<div class="col-lg-3 col-md-6 mt-5 mt-lg-0">
					<div class="count-box">
						<i class="icofont-simple-smile"></i> <span
							data-toggle="counter-up">100</span>%
						<p>바뀝니다</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- End searchImages Section -->

	<!-- ======= Resume Section ======= -->
	<section id="resume" class="resume">
		<div class="container" data-aos="fade-up">

			<div class="section-title">
				<h2>찾은 도시</h2>
				<p>당신이 좋아하는 사진과 비슷한 도시들입니다.</p>
			</div>

			<div class="row cities">
				<div class="col-xs-4">
					<img style="width: 200px; height: 200px;"
						src='<c:url value="/plugins/assets/img/KakaoTalk_20200430_171444453_04.jpg"/>' />
					<p>방콕</p>
				</div>
				<div class="col-xs-4">
					<img style="width: 200px; height: 200px;"
						src='<c:url value="/plugins/assets/img/KakaoTalk_20200430_171444453_04.jpg"/>' />
					<p>방콕</p>
				</div>
				<div class="col-xs-4">
					<img style="width: 200px; height: 200px;"
						src='<c:url value="/plugins/assets/img/KakaoTalk_20200430_171444453_04.jpg"/>' />
					<p>방콕</p>
				</div>
				<div class="col-xs-4">
					<img style="width: 200px; height: 200px;"
						src='<c:url value="/plugins/assets/img/KakaoTalk_20200430_171444453_04.jpg"/>' />
					<p>방콕</p>
				</div>
				<div class="col-xs-4">
					<img style="width: 200px; height: 200px;"
						src='<c:url value="/plugins/assets/img/KakaoTalk_20200430_171444453_04.jpg"/>' />
					<p>방콕</p>
				</div>
				<div class="col-xs-4">
					<img style="width: 200px; height: 200px;"
						src='<c:url value="/plugins/assets/img/KakaoTalk_20200430_171444453_04.jpg"/>' />
					<p>방콕</p>
				</div>
				<div class="col-xs-4">
					<img style="width: 200px; height: 200px;"
						src='<c:url value="/plugins/assets/img/KakaoTalk_20200430_171444453_04.jpg"/>' />
					<p>방콕</p>
				</div>
				<div class="col-xs-4">
					<img style="width: 200px; height: 200px;"
						src='<c:url value="/plugins/assets/img/KakaoTalk_20200430_171444453_04.jpg"/>' />
					<p>방콕</p>
				</div>
				<div class="col-xs-4">
					<img style="width: 200px; height: 200px;"
						src='<c:url value="/plugins/assets/img/KakaoTalk_20200430_171444453_04.jpg"/>' />
					<p>방콕</p>
				</div>
				<div class="col-xs-4">
					<img style="width: 200px; height: 200px;"
						src='<c:url value="/plugins/assets/img/KakaoTalk_20200430_171444453_04.jpg"/>' />
					<p>방콕</p>
				</div>

				<form action="<c:url value='/TravelMaker/Planner.kosmo'/>">
					<div
						class="d-flex flex-lg-row flex-column align-items-start justify-content-lg-between justify-content-start">
						<button class="home_search_button citysearch" style="">도시
							선택</button>
					</div>
				</form>
			</div>
		</div>
	</section>
	<!-- End Resume Section -->

	<!-- ======= Testimonials Section ======= -->
	<section id="testimonials" class="testimonials section-bg">
		<div class="container" data-aos="fade-up">

			<div class="section-title">
				<h2>TravelMaker직원들의 각종 꿀팁!</h2>
			</div>

			<div class="owl-carousel testimonials-carousel" data-aos="zoom-in"
				data-aos-delay="100">

				<div class="testimonial-item">
					<img src="<c:url value='/plugins/assets/img/bananaman.jpg'/>"
						class="testimonial-img" alt="">
					<h3>바나나맨</h3>
					<h4>banana &amp; banana</h4>
					<p>
						<i class="bx bxs-quote-alt-left quote-icon-left"></i> 바나나는 이렇게
						먹는거에요.. <i class="bx bxs-quote-alt-right quote-icon-right"></i>
					</p>
				</div>

				<div class="testimonial-item">
					<img src="<c:url value='/plugins/assets/img/bananaman.jpg'/>"
						class="testimonial-img" alt="">
					<h3>바나나맨 박종현</h3>
					<h4>banana man</h4>
					<p>
						<i class="bx bxs-quote-alt-left quote-icon-left"></i> 바나나란 심오한거에오
						<i class="bx bxs-quote-alt-right quote-icon-right"></i>
					</p>
				</div>

				<div class="testimonial-item">
					<img src="<c:url value='/plugins/assets/img/bananaman.jpg'/>"
						class="testimonial-img" alt="">
					<h3>바나나좋아하는 박조년</h3>
					<h4>banana designer</h4>
					<p>
						<i class="bx bxs-quote-alt-left quote-icon-left"></i> 바나나를 디자인해보아오
						<i class="bx bxs-quote-alt-right quote-icon-right"></i>
					</p>
				</div>

				<div class="testimonial-item">
					<img src="<c:url value='/plugins/assets/img/bananaman.jpg'/>"
						class="testimonial-img" alt="">
					<h3>바나나 많이 먹는 박종현</h3>
					<h4>banana many eat man</h4>
					<p>
						<i class="bx bxs-quote-alt-left quote-icon-left"></i> 바나나 많이 먹게하는중
						<i class="bx bxs-quote-alt-right quote-icon-right"></i>
					</p>
				</div>

				<div class="testimonial-item">
					<img src="<c:url value='/plugins/assets/img/bananaman.jpg'/>"
						class="testimonial-img" alt="">
					<h3>바나나만 먹는 박종현</h3>
					<h4>physical</h4>
					<p>
						<i class="bx bxs-quote-alt-left quote-icon-left"></i> 바나나 먹는 걸
						습관화합시다 <i class="bx bxs-quote-alt-right quote-icon-right"></i>
					</p>
				</div>

			</div>

		</div>
	</section>
	<!-- End Testimonials Section -->



</main>
<!-- End #main -->

