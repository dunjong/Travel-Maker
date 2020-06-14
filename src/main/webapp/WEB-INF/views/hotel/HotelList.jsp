<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
var lat,lng;
//중요: 체크인한날짜 기준으로 체크아웃날짜 정하도록 바꿈, 장소명에 
	$(function() {
		//checkin, checkout사이에 차이를 저장할 변수
		var nights;
		// datapicker setter로 옵션추가하기
		//$( "#datepicker" ).datepicker('option','dateFormat','yy년 mm월 dd일');
		$("#datepicker").datepicker({//checkin
			showAnim : "slideDown",
			dateFormat : "yy mm dd ",
			minDate : new Date(),
			onSelect : function(dateText) {
				$('#display').html(dateText);
				$( "#datepicker1" ).datepicker( "destroy" );
				$("#datepicker1").datepicker({//checkout
					showAnim : "slideDown",
					dateFormat : "yy mm dd ",
					minDate : new Date(dateText),
					maxDate : "+1m +1w",
					onSelect : function(dateText1) {
						$('#display').html(dateText1);
						var datepicker_date = new Date(dateText);
						var datepicker_date1 = new Date(dateText1);
						nights = (datepicker_date1.getTime()-datepicker_date.getTime())/ (1000*60*60*24);
						console.log(datepicker_date1.getTime());
						console.log(datepicker_date.getTime());
						console.log(nights);
					}
				});
			}
		});
		//선택한 장소id저장용변수,위도,경도
		var placesList = document.getElementById('places');
		var img;
		$('#hotelSubmit').click(function(){
			//url에 입력할 변수선언
			var adults = $('#adults').prop('value');
			var children = $('#children').prop('value');
			var rooms = $('#rooms').prop('value');
			var checkin = $('#datepicker').prop('value');
			var checkout = $('#datepicker1').prop('value');
			var urlStr = "https://tripadvisor1.p.rapidapi.com/hotels/list-by-latlng?lang=ko_KR&hotel_class=1%252C2%252C3&limit=3&adults="+adults+"&rooms="+rooms+"&currency=KRW&latitude="+lat+"&longitude="+lng;
			var settings = {
					"async" : true,
					"crossDomain" : true,
					"url" : urlStr,
					"method" : "GET",
					"headers" : {
						"x-rapidapi-host" : "tripadvisor1.p.rapidapi.com",
						"x-rapidapi-key" : "9095c68cdcmshe3e836ea4f7917bp1fa2a1jsn44f214b94ffc"
					}
			}//settings
			$.ajax(settings).done(
				function(response) {
					console.log(response)
					for (var i = 0; i < response.data.length; i++) {
						img = document.createElement('img');
						img.alt = 'no image';
						if (response.data[i].photo.images != null) {
							img.src = response.data[i].photo.images.medium.url;
						}
						var div = document.createElement('div');
						div.className = 'col-sm-6';
						var div2 = document.createElement('div');
						div2.className = 'col-sm-6';

						var row = document.createElement('div');
						row.className = 'row';
						var row2 = document.createElement('div');
						row2.className = 'row';

						var div_name = document
								.createElement('div');
						div_name.className = 'col-sm-12';
						var div_rating = document
								.createElement('div');
						div_rating.className = 'col-sm-12';
						var div_location = document
								.createElement('div');
						div_location.className = 'col-sm-12';
						var div_price_level = document
								.createElement('div');
						div_price_level.className = 'col-sm-12';

						div_name.textContent = '호텔이름: '
								+ response.data[i].name;
						div_rating.textContent = '평점:'
								+ response.data[i].rating + '점';
						div_location.textContent = '위치정보(경도,위도): 경도: '
								+ response.data[i].latitude
								+ ',위도: '
								+ response.data[i].longitude;
						div_price_level.textContent = '가격: '
								+ response.data[i].price;

						br = document.createElement('br');

						placesList.appendChild(row);
						row.appendChild(div);
						div.appendChild(img);
						row.appendChild(div2);
						div2.appendChild(row2);
						row2.appendChild(div_name);
						row2.appendChild(div_rating);
						row2.appendChild(div_location);
						row2.appendChild(div_price_level);

					}
					$('#places img').css({
						width : '300px',
						height : '200px'
					});
					$('#places .row').css({
						width : '70%',
						height : '100%',
						margin : '10px',
						padding : '20px',
						backgroundColor : 'white',
						boxShadow : '1px 1px 1px 1px gray',
						borderRadius : '11px /11px'
					})

				});//ajax.done()
		})//#hotelSubmit.click
	//버튼 이미지 사용시: 버튼의 크기 조정
	//$('.ui-datepicker-trigger').prop('style', 'width:40px;height:40px;');
	//$('.ui-datepicker-trigger > img').prop('style', 'width:40px;height:40px;vertical-align:middle;margin-top:-4px;margin-left:-10px');
	//이미지 온리 사용시
	});//$(function(){})
</script>


<!-- Search -->
<div class="home_search">
	<div class="container">
		<div class="row">
			<div class="col">
				<div class="home_search_container">
					<div class="home_search_title">
						<a href='<c:url value="/TravelMaker/AirList.kosmo"/>'>항공권 검색</a>
					</div>
					<div class="home_search_title">
						<a href='<c:url value="/TravelMaker/HotelList.kosmo"/>'>호텔 검색</a>
					</div>
					<div class="home_search_content">
						<form action="#" class="home_search_form" id="home_search_form">
							<div class="d-flex flex-lg-row flex-column align-items-start justify-content-lg-between justify-content-start">
								<input id="autocomplete" class="search_input search_input_1" placeholder="장소" required="required">
								<input type="text" id="datepicker" class="search_input search_input_2" placeholder="check in" required="required"> 
								<input type="text" id="datepicker1" class="search_input search_input_2" placeholder="check out" required="required"> 
								<input type="number" id="adults" class="search_input search_input_3" placeholder="성인" required="required">
								<input type="number" id="children" class="search_input search_input_3" placeholder="미성년">
								<input list="room1" max="100" min="1" type="number" id="rooms" class="search_input search_input_3" placeholder="방 갯수" required="required">
								<button id="hotelSubmit" class="home_search_button" style="">호텔 검색</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="intro">
	<div class="intro_container">
		<div id="places" class="alert alert-success"></div>
	</div>
</div>
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBMkei418dalW2Ho3I-ovwq0aMKWhUlwUA&libraries=places"></script>
<script>
	var input = document.getElementById('autocomplete');
	var autocomplete = new google.maps.places.Autocomplete(input);
	google.maps.event.addListener(autocomplete, 'place_changed', function() {
		var place = autocomplete.getPlace();
		console.log('lat', place.geometry.location.lat())
        console.log('lng', place.geometry.location.lng())
        lat = place.geometry.location.lat()
        lng = place.geometry.location.lng()
	})
</script>


<!-- Footer -->

