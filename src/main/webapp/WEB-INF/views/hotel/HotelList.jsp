<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		$(function(){
			var placesList = document.getElementById('places');
			var img;
  			var settings = {
  		    		"async": true,
  		    		"crossDomain": true,
  		    		"url": "https://tripadvisor1.p.rapidapi.com/hotels/list-by-latlng?lang=ko_KR&hotel_class=1%252C2%252C3&limit=3&adults=1&rooms=1&currency=USD&latitude=-8.672062&longitude=115.231609",
  		    		"method": "GET",
  		    		"headers": {
  		    			"x-rapidapi-host": "tripadvisor1.p.rapidapi.com",
  		    			"x-rapidapi-key": "9095c68cdcmshe3e836ea4f7917bp1fa2a1jsn44f214b94ffc"
  		    		}
  		    	}
  		    	$.ajax(settings).done(function (response) {
  		    		for(var i=0;i<response.data.length;i++){
  		              	img = document.createElement('img');
  		            	img.alt='no image';
  		            if(response.data[i].photo.images!=null){
  		            	img.src=response.data[i].photo.images.thumbnail.url;
  		            }
  		            var div=document.createElement('div');
  		            div.className='col-sm-6';
  		            var div2=document.createElement('div');
  		            div2.className='col-sm-6';
  		            var div3=document.createElement('div');
  		            div3.className='col-sm-12';
  		            div3.textContent='=========================================================================================================================';
  		            var row=document.createElement('div');
  		            row.className='row';
  		            
  		            var div_name = document.createElement('div');
  		            div_name.className='col-sm-12';
  		            var div_rating = document.createElement('div');
  		            div_rating.className='col-sm-12';
  		            var div_location = document.createElement('div');
  		            div_location.className='col-sm-12';
  		            var div_id = document.createElement('div');
  		            div_id.className='col-sm-12';
  		            var div_price_level =document.createElement('div');
  		            div_price_level.className='col-sm-12';
  		            
  		            div_name.textContent = '호텔이름: '+response.data[i].name;
  		            div_rating.textContent='평점:'+response.data[i].rating+'점';
  		            div_location.textContent='위치정보(경도, 위도): '+response.data[i].latitude+response.data[i].longitude;
  		            div_price_level.textContent='가격: '+response.data[i].price;
  		            
  		            br=document.createElement('br');
  		           
  		            
  		            
  		            placesList.appendChild(div);
  		           	div.appendChild(img);
  		           	placesList.appendChild(div2);
  		           	div2.appendChild(row);
  		           	row.appendChild(div_name);
  		           	row.appendChild(div_rating);
  		           	row.appendChild(div_location);
  		           	row.appendChild(div_id);
  		           	row.appendChild(div_price_level);
  		           	placesList.appendChild(div3);
  		           	
  		          }
  		          $('#places img').css({width:'250px',height:'200px'});
  		          $('#places .row').css({textAlign:'left',marginTop:'40px',color:'black',weight:'border'});
  		    	
  		    		
  		    		
  		    	});
  	      })
		
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
							<div
								class="d-flex flex-lg-row flex-column align-items-start justify-content-lg-between justify-content-start">
								<input type="text" class="search_input search_input_1"
									placeholder="위치" required="required"> <input
									type="text" id="datepicker" class="search_input search_input_3"
									placeholder="check in" required="required"> <input
									type="text" id="datepicker1"
									class="search_input search_input_4" placeholder="check out"
									required="required"> <input type="text"
									class="search_input search_input_5" placeholder="인원"
									required="required">
								<button class="home_search_button" style="">호텔 검색</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="">
	<div class="container">
				<div class="row" id="places"></div>
	</div>
</div>
<!-- Footer -->

