<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	$(function() {
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
		$("#datepicker").datepicker({//체크인
			showAnim : "slideDown",
			dateFormat : "yy년 mm월 dd일",
			minDate : new Date(),
			onSelect : function(dateText) {
				$('#display').html(dateText);
			}
		});
		$("#datepicker1").datepicker({//체크아웃
			showAnim : "slideDown",
			dateFormat : "yy년 mm월 dd일",
			minDate : new Date(),
			onSelect : function(dateText) {
				$('#display').html(dateText);
			}
		});
		$('#location').keyup(function(){
			if($('#location').prop('value').length<3) return;
			var locaName = $('#location').prop('value');//$(this)도 동일
			console.log($.trim(locaName));
			var settings = {
					"async": true,
					"crossDomain": true,
					"url": "https://tripadvisor1.p.rapidapi.com/locations/auto-complete?lang=ko_KR&units=km&query="+$.trim(locaName),
					"method": "GET",
					"headers": {
						"x-rapidapi-host": "tripadvisor1.p.rapidapi.com",
						"x-rapidapi-key": "9095c68cdcmshe3e836ea4f7917bp1fa2a1jsn44f214b94ffc"
					}
				}

				$.ajax(settings).done(function (response) {
					if(response.errors==undefined){
						$('#location1').html("");
						for(var i=0;i<response.data.length;i++){
							var locaStr = response.data[i].result_object.name+" "+response.data[i].result_object.parent_display_name;
							$.trim(locaStr);
							var str1 = locaStr.split(' ');
							var locaStr2 = "";
							for(var k=0;k<str1.length;k++){
								locaStr2 += str1[k];
							}
							console.log($.trim(locaStr2));
							$('#location1').append("<option value="+$.trim(locaStr2)+" >");
						}
						console.log(response);
					}
				});
		});
		$('#btnSearch').click(function(){
			var placesList = document.getElementById('places');
			var img; 
			var settings = {//호텔검색세팅
				"async" : true,
				"crossDomain" : true,
				"url" : "https://tripadvisor1.p.rapidapi.com/hotels/list-by-latlng?lang=ko_KR&hotel_class=1%252C2%252C3&limit=3&adults=1&rooms=1&currency=USD&latitude=-8.672062&longitude=115.231609",
				"method" : "GET",
				"headers" : {
					"x-rapidapi-host" : "tripadvisor1.p.rapidapi.com",
					"x-rapidapi-key" : "9095c68cdcmshe3e836ea4f7917bp1fa2a1jsn44f214b94ffc"
				}
			}
			$.ajax(settings).done(//호텔실제검색코드
				function(response) {//response = ajax실행후 결과값
					for (var i = 0; i < response.data.length; i++) {
						img = document.createElement('img');
						img.alt = 'no image';
						if (response.data[i].photo.images != null) {
							img.src = response.data[i].photo.images.thumbnail.url;
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
					});

				});

		});
		//버튼 이미지 사용시: 버튼의 크기 조정
		//$('.ui-datepicker-trigger').prop('style', 'width:40px;height:40px;');
		//$('.ui-datepicker-trigger > img').prop('style', 'width:40px;height:40px;vertical-align:middle;margin-top:-4px;margin-left:-10px');
	});
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
								<input type="text" id="location" class="search_input search_input_1" placeholder="장소명" required="required" list="location1">
								<datalist id="location1">
								    <option value="">
								</datalist>
								<input type="text" id="datepicker" class="search_input search_input_5" placeholder="check in" required="required"/> 
								<input type="text" id="datepicker1" class="search_input search_input_5" placeholder="check out" required="required"/> 
								<input type="text" class="search_input search_input_2" placeholder="성인" required="required"/>
								<input type="text" id=""class="search_input search_input_2" placeholder="미성년자"/>
								<input type="text" class="search_input search_input_2" placeholder="미성년자 나이" hidden="true"/>
								<button id="btnSearch"class="home_search_button" style="">호텔 검색</button>
								
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
		<h2 style="text-align:center">검색 결과</h2>
		<div id="places" class="alert alert-success"></div>
	</div>
</div>



<!-- Footer -->

