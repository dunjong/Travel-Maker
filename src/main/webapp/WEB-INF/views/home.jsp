<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Search -->
<%-- <div class="home_search">
	<div class="container">
		<div class="row">
			<div class="col">
				<div class="home_search_container">
					<div>
						<div class="home_search_title"><a href='<c:url value="/TravelMaker/AirList.kosmo"/>'>항공권 검색</a></div>
					
						<div class="home_search_title" ><a href='<c:url value="/TravelMaker/HotelList.kosmo"/>'>호텔 검색</a></div>
	
					</div>			
				</div>
			</div>
		</div>
	</div>
</div> --%>
<!-- Intro -->
<script>

function CallPlanners(city_no){
	 $.ajax({
			url:'<c:url value="/TravelMaker/CallPlannerList.kosmo"/>',
			data:{
				city_no:city_no.id
			},
			dataType:'json',
			success:function(data){successAjaxPlanner(data)},
			error:function(request,error){
				console.log('상태코드:',request.status);
				console.log('서버로부터 받은 HTML데이타:',request.responseText);
				console.log('에러:',error);
			}
			
		});
	 
}

function CallCity(){
	
	  $.ajax({
			url:'<c:url value="/TravelMaker/CallCityList.kosmo"/>',
			dataType:'json',
			success:function(data){successAjaxCity(data)},
			error:function(request,error){
				console.log('상태코드:',request.status);
				console.log('서버로부터 받은 HTML데이타:',request.responseText);
				console.log('에러:',error);
			}
			
		});
	 
	  
}////CallCity
function successAjaxPlanner(data){
	tableString="";
	$.each(data,function(index,planner){
		console.log('index:',(index+1),',planner:',planner)
		tableString+="<div class='news_post d-flex flex-md-row flex-column align-items-start justify-content-start'><div class='news_post_content'><div class='news_post_date d-flex flex-row align-items-end justify-content-start'>"
		tableString+="<div>0"+(index+1)+"</div><div>"+planner.id+",동행자 수"+planner.acc+"</div>";
		tableString+="</div><div class='news_post_title'><a href='<c:url value='/TravelMaker/PlannerView.kosmo?planner_no="+planner.no+"'/>'>"+planner.name+",플래너 번호:"+planner.no+"</a></div></div></div>";
	
	});
	tableString+="<a href='#' class='btn btn-info'>상단으로 이동</a>";
	$('#planners').html(tableString);
	var offset=$('#news').offset();
	$('html, body').animate({scrollTop : offset.top}, 400);
}


function successAjaxCity(data){
	 var tableString="";
	 var cities=document.getElementById('cities');
	 
	$.each(data,function(index,city){
	 tableString+="<div class='destination item'>";
	 tableString+="<div class='destination_image'>";
	 tableString+="<img src='/travelmaker"+city.img+"' alt=''>";
	 tableString+="</div><div class='destination_content'>";
	 tableString+="<div class='destination_title' ><a href='#' id='"+city.city_no+"' onclick='CallPlanners(this)'>";
	 tableString+=city.name;
	 tableString+="</a></div><div class='destination_subtitle'><p>";
	 tableString+=city.intro;
	 tableString+="</p></div></div></div>"
	 
	})
	$('#cities').html(tableString);
	var size=$('#cities > div').length;
	console.log('size',size);
	$('#cities img').css({width:'360px',height:'261.37px'})
	var j=0;
	for(var i=1;i<=size;i++){
		switch(j){
		case 0:
			switch(i%3){
			case 1:
				$('#cities > div:eq('+(i-1)+')').css({position:'absolute',left:'0px',top:'0px'})
				break;
			case 2:
				$('#cities > div:eq('+(i-1)+')').css({position:'absolute',left:'390px',top:'0px'})
				break;
			default:
				$('#cities > div:eq('+(i-1)+')').css({position:'absolute',left:'780px',top:'0px'});
				j+=1;
			}
			break;
		case 1:
			switch(i%3){
			case 1:
				$('#cities > div:eq('+(i-1)+')').css({position:'absolute',left:'0px',top:'415px'})
				break;
			case 2:
				$('#cities > div:eq('+(i-1)+')').css({position:'absolute',left:'390px',top:'415px'})
				break;
			default:
				$('#cities > div:eq('+(i-1)+')').css({position:'absolute',left:'780px',top:'415px'});
				j+=1;
			}
			break;
		default :
			switch(i%3){
			case 1:
				$('#cities > div:eq('+(i-1)+')').css({position:'absolute',left:'0px',top:'830px'})
				break;
			case 2:
				$('#cities > div:eq('+(i-1)+')').css({position:'absolute',left:'390px',top:'830pxpx'})
				break;
			default:
				$('#cities > div:eq('+(i-1)+')').css({position:'absolute',left:'780px',top:'830pxpx'});
				j+=1;
			}
			break;
		}
	}
	 var offset=$('#destinations').offset();
	 $('html, body').animate({scrollTop : offset.top}, 400);
}

</script>
<div class="intro">
	<div class="intro_background"></div>
	<div class="container">
		<div class="row">
			<div class="col">
				<div class="intro_container">
					<div class="row">

						<!-- Intro Item -->
						
						<div class="col-lg-4 intro_col">
							<div
								class="intro_item d-flex flex-row align-items-end justify-content-start">
								<div class="intro_icon">
									<img src="<c:url value='/images/beach.svg'/>" alt="">
								</div>
								<div class="intro_content">
									<div class="intro_title" onclick="CallCity()">Travel Maker인기 여행지</div>
									<div class="intro_subtitle">
										<p>#여행</p>
									</div>
								</div>
							</div>
						</div>

						<!-- Intro Item -->
						<div class="col-lg-4 intro_col">
							<div
								class="intro_item d-flex flex-row align-items-end justify-content-start">
								<div class="intro_icon">
									<img src="<c:url value='/images/wallet.svg'/>" alt="">
								</div>
								<div class="intro_content">
									<div class="intro_title">해외 인기여행지</div>
									<div class="intro_subtitle">
										<p>Best Price</p>
									</div>
								</div>
							</div>
						</div>

						<!-- Intro Item -->
						<div class="col-lg-4 intro_col">
							<div
								class="intro_item d-flex flex-row align-items-end justify-content-start">
								<div class="intro_icon">
									<img src="<c:url value='/images/suitcase.svg'/>" alt="">
								</div>
								<div class="intro_content">
									<div class="intro_title">놀라운 서비스</div>
									<div class="intro_subtitle">
										<p>Amazing Service</p>
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

<!-- Destinations -->
<div class="destinations" id="destinations">
		<div class="container">
			<div class="row">
				<div class="col text-center">
					<div class="section_subtitle">simply amazing places</div>
					<div class="section_title"><h2>인기 여행지</h2></div>
				</div>
			</div>
			<div class="row destinations_row">
				<div class="col">
					<div class="destinations_container item_grid" id="cities">

						<!-- Destination -->
						<div class="destination item">
							<div class="destination_image">
								<img src="<c:url value='/images/destination_1.jpg'/>" alt="">
								<div class="spec_offer text-center"><a href="#">Special Offer</a></div>
							</div>
							<div class="destination_content">
								<div class="destination_title"><a href="destinations.html">Bali</a></div>
								<div class="destination_subtitle"><p>꿈의 섬 발리로 바로 떠나보세요</p></div>
								<div class="destination_price">From $699</div>
							</div>
						</div>

						
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Testimonials -->

	<div class="testimonials" id="testimonials">
		<div class="parallax_background parallax-window" data-parallax="scroll" data-image-src="<c:url value='/images/testimonials.jpg'/>" data-speed="0.8"></div>
		<div class="container">
			<div class="row">
				<div class="col text-center">
					<div class="section_subtitle">simply amazing places</div>
					<div class="section_title"><h2>Testimonials</h2></div>
				</div>
			</div>
			<div class="row testimonials_row">
				<div class="col">

					<!-- Testimonials Slider -->
					<div class="testimonials_slider_container">
						<div class="owl-carousel owl-theme testimonials_slider">
							
							<!-- Slide -->
							<div class="owl-item text-center">
								<div class="testimonial">Lorem ipsum dolor sit amet, consectetur adipiscing elit. lobortis dolor. Cras placerat lectus a posuere aliquet. Curabitur quis vehicula odio.</div>
								<div class="testimonial_author">
									<div class="testimonial_author_content d-flex flex-row align-items-end justify-content-start">
										<div>john turner,</div>
										<div>client</div>
									</div>
								</div>
							</div>

							<!-- Slide -->
							<div class="owl-item text-center">
								<div class="testimonial">Lorem ipsum dolor sit amet, consectetur adipiscing elit. lobortis dolor. Cras placerat lectus a posuere aliquet. Curabitur quis vehicula odio.</div>
								<div class="testimonial_author">
									<div class="testimonial_author_content d-flex flex-row align-items-end justify-content-start">
										<div>john turner,</div>
										<div>client</div>
									</div>
								</div>
							</div>

							<!-- Slide -->
							<div class="owl-item text-center">
								<div class="testimonial">Lorem ipsum dolor sit amet, consectetur adipiscing elit. lobortis dolor. Cras placerat lectus a posuere aliquet. Curabitur quis vehicula odio.</div>
								<div class="testimonial_author">
									<div class="testimonial_author_content d-flex flex-row align-items-end justify-content-start">
										<div>john turner,</div>
										<div>client</div>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="test_nav">
			<ul class="d-flex flex-column align-items-end justify-content-end">
				<li><a href="#">City Breaks Clients<span>01</span></a></li>
				<li><a href="#">Cruises Clients<span>02</span></a></li>
				<li><a href="#">All Inclusive Clients<span>03</span></a></li>
			</ul>
		</div>
	</div>

	<!-- News -->

	<div class="news" id="news">
		<div class="container">
			<div class="row">
				<div class="col-xl-8">
					<div class="news_container" id="planners" >
						
						<!-- News Post -->
						<div class="news_post d-flex flex-md-row flex-column align-items-start justify-content-start">
							<div class="news_post_content">
								<div class="news_post_date d-flex flex-row align-items-end justify-content-start">
									<div>02</div>
									<div>june</div>
								</div>
								<div class="news_post_title"><a href="#">Best tips to travel light</a></div>
								<div class="news_post_text">
									<p>Pellentesque sit amet elementum ccumsan sit amet mattis eget, tristique at leo. Vivamus massa.Tempor massa et laoreet.</p>
								</div>
							</div>
						</div>
		
						<a href='#' class='btn btn-info'>상단으로 이동</a>
					</div>

				</div>

				<!-- News Sidebar -->
				<div class="col-xl-4">
					<div class="travello">
						<div class="background_image" style="background-image:url(<c:url value='/images/travello.jpg'/>)"></div>
						<div class="travello_content">
							<div class="travello_content_inner">
								<div></div>
								<div></div>
							</div>
						</div>
						<div class="travello_container">
							<div class="d-flex flex-column align-items-center justify-content-end">
								<a href="#">
									<span class="travello_title">Get a 20% Discount</span>
									<span class="travello_subtitle">Buy Your Vacation Online Now</span>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
	</div>


<!-- Footer -->

