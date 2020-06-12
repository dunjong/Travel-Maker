<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
   $(function(){
      $( "#departureDate" ).datepicker({
         showAnim: "slideDown",
         dateFormat: "yy년 mm월 dd일",
         minDate: new Date(),
         onSelect:function(dateText){
            $('#display').html(dateText);
         }
      });
      $( "#returnDate" ).datepicker({
         showAnim: "slideDown",
         dateFormat: "yy년 mm월 dd일",
         minDate: new Date(),
         onSelect:function(dateText){
            $('#display').html(dateText);
         }
      });
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
      //토큰 정보 얻어오기
         /*  var settings = {
        "url": "https://test.api.amadeus.com/v1/security/oauth2/token",
        "method": "POST",
        "timeout": 0,
        "data": {
          "client_id": "wmBCJo8VFo4AFp3nqXxlWbHWdZH8VqwP",
          "client_secret": "0Of0WvaAGgzG8pym",
          "grant_type": "client_credentials"
           }
         };
         
         $.ajax(settings).done(function (response) {
           console.log(response);
         });    */
		
         
         /* $(function () {
        	    $('[data-toggle="popover"]').popover()
        	    }) */    	    
         $('#departure').on('keyup',function(){
        	 var deplist=document.getElementById('deplist')
        	 //deplist.remove();
        	 deplist.innerHTML=''
        	 var depstr=[]
        	 var depname=[]
             var value=$(this).val();
             var settings = {
                   "async" : true,
                   "crossDomain" : true,
                   "url" : "https://skyscanner-skyscanner-flight-search-v1.p.rapidapi.com/apiservices/autosuggest/v1.0/KR/KRW/ko-KR/?query="+value,
                   "method" : "GET",
                   "headers" : {
                      "x-rapidapi-host" : "skyscanner-skyscanner-flight-search-v1.p.rapidapi.com",
                      "x-rapidapi-key" : "1284ea87a9msh562cc6747ae1f06p15971bjsnbad10597807a"
                   }
             }

                $.ajax(settings).done(function(response) {
                	console.log(response)
                	
             		 var PlaceId
                     var PlaceName
                   for(var i=0;i<response.Places.length;i++){
                	  
                        PlaceId=response.Places[i].PlaceId
                 		PlaceName=response.Places[i].PlaceName
                 		
                         
                      depstr.push(PlaceId)
                      depname.push(PlaceName)
                   }
               		
                    for(var i=1;i<depstr.length;i++){
                        var div=document.createElement('div')
                        div.className='btn btn-warning'
                        div.setAttribute('name',depstr[i].substring(0,3))
                        div.textContent=depname[i]+':'+depstr[i].substring(0,3)
                        deplist.appendChild(div)
                    }
                    $('.btn-warning').on('click',function(){
                    	console.log('this:',this.innerHTML)
                    	$('#departure').prop('value',this.innerHTML)
                    })	    
                   
                	console.log('depstr',depstr)
                	$('#departure').attr('data-content',depstr.toString());
                	$('#departure').popover('hide')
                	$('#departure').popover('show')
                });/////
          })
          
          $('#arrival').on('keyup',function(){
        	 var arrlist=document.getElementById('arrlist')
        	 //arrlist.clear()
        	 arrlist.innerHTML=''
        	 var arrstr=[]
             var arrname=[]
             var value=$(this).val();
             var settings = {
                   "async" : true,
                   "crossDomain" : true,
                   "url" : "https://skyscanner-skyscanner-flight-search-v1.p.rapidapi.com/apiservices/autosuggest/v1.0/KR/KRW/ko-KR/?query="+value,
                   "method" : "GET",
                   "headers" : {
                      "x-rapidapi-host" : "skyscanner-skyscanner-flight-search-v1.p.rapidapi.com",
                      "x-rapidapi-key" : "1284ea87a9msh562cc6747ae1f06p15971bjsnbad10597807a"
                   }
             }
				
                $.ajax(settings).done(function(response) {
                  
                   var PlaceId
                   var PlaceName
                   
                	for(var i=0;i<response.Places.length;i++){
                		
               		
                        PlaceId=response.Places[i].PlaceId
                		PlaceName=response.Places[i].PlaceName
          
                        arrstr.push(PlaceId)
                        arrname.push(PlaceName)
                   	}
                	
                    for(var i=1;i<arrstr.length;i++){
                        var div=document.createElement('div')
                        div.className='btn btn-danger'
                        div.textContent=arrname[i]+':'+arrstr[i].substring(0,3)
                        div.setAttribute('name',arrstr[i].substring(0,3))
                        arrlist.appendChild(div)
                    }
                    
                    $('.btn-danger').on('click',function(){
                    	$('#arrival').prop('value',this.innerHTML)
                    })	
                   console.log('arrstr',arrstr)
                   $('#arrival').attr('data-content',arrstr.toString());
                   $('#arrival').popover('hide')
               	   $('#arrival').popover('show')
                });/////
                
                
                
                
          })
    
      
      //버튼 이미지 사용시: 버튼의 크기 조정
      //$('.ui-datepicker-trigger').prop('style', 'width:40px;height:40px;');
      //$('.ui-datepicker-trigger > img').prop('style', 'width:40px;height:40px;vertical-align:middle;margin-top:-4px;margin-left:-10px');
      //이미지 온리 사용시      
               
          });
   //Flight List ajax 구문 추가
   $.ajax({
 	  url: 'http://api.aviationstack.com/v1/flights',
 	  data: {
 	    access_key: '90abbc3665222e1b7fa6938924cc7597'
 	  },        	  
 	  dataType: 'json',
 	  success: function(apiResponse) {
 		  console.log('apiResponse.data[2]',apiResponse.data)
	   
	   var list = "<h2> 티켓 목록 </h2>";
	   list+="<div class='container'>";
	   list+="<div class='alert alert-success'>";
	   list+="<div class='row'>";
	   list+="<div class='col-sm-8' style='height: 180px; width: 100px; padding:20px; background-color: white; box-shadow: 1px 1px 1px 1px gray;border-radius: 11px /11px;'>";
   	   list+="<div class='row' style='text-align:center'>";
   	   list+="<div class='col-md-2' style='height: 90px; width: 40px'>";
   	   list+="<img src='<c:url value="/images/travelmaker1.png"/>' style='height:60px;width:130px'></div>";
   	   list+="<div class='col-md-3' style='height: 90px; width: 40px; text-align:right'><Strong>"+apiResponse.data[2].arrival.estimated+"</Strong><br>"+apiResponse.data[2].arrival.airport+"</div>";
   	   list+="<div class='col-md-4' style='height: 90px; width: 40px'><small>4시간30분</small><br><img src='<c:url value="/images/줄비행기.PNG"/>'<br>직항</div>";
   	   list+="<div class='col-md-3' style='height: 90px; width: 40px; text-align:left'><Strong>"+apiResponse.data[2].departure.estimated+"</Strong><br>"+apiResponse.data[2].departure.airport+"</div>";
   	   list+="<div class='col-md-2' style='height: 90px; width: 40px'><img src='<c:url value="/images/travelmaker2.png"/>' style='height:60px;width:130px'></div>";
   	   list+="<div class='col-md-3' style='height: 90px; width: 40px; text-align:right'><Strong>"+apiResponse.data[2].arrival.estimated+"</Strong><br>"+apiResponse.data[2].departure.airport+"</div>";
   	   list+="<div class='col-md-4' style='height: 90px; width: 40px'><small>5시간10분</small><br><img src='<c:url value="/images/줄비행기.PNG"/>'<br>직항</div>"; 	   
   	   list+="<div class='col-md-3' style='height: 90px; width: 40px; text-align:left'><Strong>"+apiResponse.data[2].departure.estimated+"</Strong><br>"+apiResponse.data[2].arrival.airport+"</div>";
   	   list+="</div>";
   	   list+="</div>";
   	   list+="<div class='col-sm-4' style='height: 180px; width: 100px; text-align:center; background-color: white; box-shadow: 1px 1px 1px 1px gray; border-radius: 11px / 11px;'>";
   	   list+="<div class='col-md-12' style='height: 90px; padding:20px; font-size:1.7em;text-align:center;'><Strong>￦435,740</Strong><br><small>총 가격￦892,704</small></div><br>";
   	   list+="<a href='#''><button type='button' class='btn btn-success btn-lg' style='cursor:pointer;'><Strong>선택 →</Strong></button></a>";
   	   list+="</div>";
   	   list+="</div>";
   	   list+="</div>";
   	   list+="</div>";
 		  	   
   	   console.log('list',list);
   	   $('#list').html(list);
 		  
 	  }

   });
   

</script>
   
   <!-- Search -->

   <div class="home_search">
      <div class="container">
         <div class="row">
            <div class="col">
               <div class="home_search_container">
                  <div class="home_search_title"><a href='<c:url value="/TravelMaker/AirList.kosmo"/>'>항공권 검색</a></div>
                  <div class="home_search_title" ><a href='<c:url value="/TravelMaker/HotelList.kosmo"/>'>호텔 검색</a></div>
                  <div class="home_search_content">
                     <form action="#" class="home_search_form" id="home_search_form">
                        <div class="d-flex flex-lg-row flex-column align-items-start justify-content-lg-between justify-content-start">
                           <input type="text" id="departure" class="search_input search_input_1" placeholder="출발지" required="required" data-trigger="focus"  data-placement="bottom" data-toggle="popover"  data-content="dep">
                           <input type="text" id ="arrival" class="search_input search_input_2" placeholder="도착지" required="required" data-trigger="focus"  data-placement="bottom" data-toggle="popover" data-content="arr">
                           <input type="text" id="departureDate" class="search_input search_input_3" placeholder="가는날" required="required">
                           <input type="text" id="returnDate" class="search_input search_input_4" placeholder="오는날" required="required">
                           <input type="number" id="adult" class="search_input search_input_5" placeholder="성인" required="required">
                           <input type="number" id="children" class="search_input search_input_5" placeholder="어린이">
                           
                           
                           <button id="AirSearch" class="home_search_button" style="center;">항공권 검색</button>
                        </div>                     
                     </form>
                     
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
   <div class="container">
   <div class="btn btn-sucess" onclick="list()">show</div>
   <div class="row" style="color:red;font-size:20px">
	   		<div class="col-sm-12" id=deplist>
	   		</div>
	   		<div class="col-sm-12" id=arrlist>
	   		</div>
   </div>
   </div>
   <div id='list'></div>
   
  <%--  <div class="container">
      <div class="alert alert-success">
         <div class="row">
               <div class="col-sm-8" style="height: 180px; width: 100px; padding:20px; background-color: white; box-shadow: 1px 1px 1px 1px gray;border-radius: 11px /11px;">
                  <div class="row" style="text-align:center">
                     <div class="col-md-2" style="height: 90px; width: 40px"><img src="<c:url value='/images/travelmaker1.png'/>" style="height:60px;width:130px"></div>
                     <div class="col-md-3" style="height: 90px; width: 40px; text-align:right"><Strong>오전8:30</Strong><br>ICN</div>
                     <div class="col-md-4" style="height: 90px; width: 40px"><small>4시간30분</small><br><img src="<c:url value='/images/줄비행기.PNG'/>" alt=""><br>직항</div>
                     <div class="col-md-3" style="height: 90px; width: 40px; text-align:left"><Strong>오후12:00</Strong><br>CEB</div>
                     
                     <div class="col-md-2" style="height: 90px; width: 40px"><img src="<c:url value='/images/travelmaker2.png'/>" style="height:60px;width:130px"alt=""></div>
                     <div class="col-md-3" style="height: 90px; width: 40px; text-align:right"><Strong>오후11:40</Strong><br>CEB</div>
                     <div class="col-md-4" style="height: 90px; width: 40px"><small>5시간10분</small><br><img src="<c:url value='/images/줄비행기.PNG'/>" alt=""><br>직항</div>
                     <div class="col-md-3" style="height: 90px; width: 40px; text-align:left"><Strong>오전8:30</Strong><br>ICN</div>
                     
                  </div>
               </div>
               <div class="col-sm-4" style="height: 180px; width: 100px; text-align:center; background-color: white; box-shadow: 1px 1px 1px 1px gray; border-radius: 11px / 11px;">
                  <div class="col-md-12" style="height: 90px; padding:20px; font-size:1.7em;text-align:center;"><Strong>￦435,740</Strong><br><small>총 가격￦892,704</small></div><br>
                  <a href="#"><button type="button" class="btn btn-success btn-lg" style="cursor:pointer;"><Strong>선택 →</Strong></button></a>
                  
               <!-- <div class="col-md-12" style="height: 90px; width: 40px; text-align:center; font-size: 0.2em;">
                -->
               </div>
          </div>
      </div>
   </div> 
 --%>
   <!-- Intro -->
   

<!-- <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBMkei418dalW2Ho3I-ovwq0aMKWhUlwUA&libraries=places&language=En"></script>
<script>
   var input1 = document.getElementById('departure');
   var input2 = document.getElementById('arrival');
   
   var autocomplete = new google.maps.places.Autocomplete(input1);
   autocomplete = new google.maps.places.Autocomplete(input2);
   google.maps.event.addListener(autocomplete, 'place_changed', function() {	
      
      var place = autocomplete.getPlace();
     
      
        console.log('이상한 기진:',place)
        console.log('autocomplete',autocomplete)
        console.log('lat', place.geometry.location.lat())
        console.log('lng', place.geometry.location.lng())
       
      
   });
   
</script> -->



   <!-- Footer -->