
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
 #loadingImg{
      	position: absolute;
      	top:30%;
      	left:40%;
      	display:none;
      }
</style>
<script>
	$(function(){
		
		function resultAirModal(){			
			$('#AirList').html(""); 
			console.log('ajax시작')
			var settings = {
				url : '<c:url value="/TravelMaker/AirSearch.kosmo"/>',
				type : "GET",
				dataType: "json",

				data : {"departure" : $('#departure').prop('value'),
						"arrival":$('#arrival').prop('value'),
						"adult":$('#adult').prop('value'),
						"children":$('#children').prop('value'),
						"departureDate":$('#departureDate').prop('value'),
						"returnDate":$('#returnDate').prop('value')
				},				
				error : function(e){
					console.log(e);
				}
			}//settings
			$('#loadingImg').attr('style','display:block')
		 	$.ajax(settings).done(function(res) {		 		
				var list="<h2 style='text-align:center;color:#58DE4D'>Ticket List</h2>";
				for(var i=0;i<res.length-1;i++){
					if(res[i].segmentsList0[2]==0) var code = res[i].segmentsList0[3].code1
					else if(res[i].segmentsList0[2]==1) var code = res[i].segmentsList0[3].code2;
					else if(res[i].segmentsList0[2]==2) var code = res[i].segmentsList0[3].code3;
					else if(res[i].segmentsList0[2]==3) var code = res[i].segmentsList0[3].code4;
					else if(true) var code = "";
					if(res[i].segmentsList1[2]==0) var code2 = res[i].segmentsList1[3].code1;
					else if(res[i].segmentsList1[2]==1) var code2 = res[i].segmentsList1[3].code2;
					else if(res[i].segmentsList1[2]==2) var code2 = res[i].segmentsList1[3].code3;
					else if(res[i].segmentsList1[2]==3) var code2 = res[i].segmentsList1[3].code4;
					else if(true) var code2 = "";
					list+="<div class='container'>";
					list+="<div class='alert alert-success'>";
					list+="<div class='row'>";
					list+="<div class='col-sm-8' style='height: 180px; width: 100px; padding:20px; background-color: white; box-shadow: 1px 1px 1px 1px gray;border-radius: 11px /11px;'>";
					list+="<div id='AirList' class='row' style='text-align:center'>";
					list+="<div class='col-md-2' style='height: 90px; width: 40px'>";
					list+="<img src='<c:url value="/images/travelmaker1.png"/>' style='height:60px;width:130px'></div>";	
					list+="<div class='col-md-3' style='color:black; height: 90px; width: 40px; text-align:right'><Strong>"+res[i].segmentsList0[0].substr(11,5)+"</Strong><br>"+res[i].segmentsList0[3].code0+"</div>";
					list+="<div class='col-md-4' style='color:black; height: 90px; width: 40px'><small>"+res[i].originToDestTime.substring(2,res[i].originToDestTime.length).replace('H','시').replace('M','분')+"</small><br><img src='<c:url value="/images/줄비행기.PNG"/>'<br><div style='color:sandybrown'><Strong>"+res[i].segmentsList0[2]+"회 경유</Strong></div></div>";
					list+="<div class='col-md-3' style='color:black; height: 90px; width: 40px; text-align:left'><Strong>"+res[i].segmentsList0[1].substr(11,5)+"</Strong><br>"+code+"</div>";
					list+="<div class='col-md-2' style='color:black; height: 90px; width: 40px'><img src='<c:url value="/images/travelmaker2.png"/>' style='height:60px;width:130px'></div>";
					list+="<div class='col-md-3' style='color:black; height: 90px; width: 40px; text-align:right'><Strong>"+res[i].segmentsList1[0].substr(11,5)+"</Strong><br>"+res[i].segmentsList1[3].code0+"</div>";
					list+="<div class='col-md-4' style='color:black; height: 90px; width: 40px'><small>"+res[i].DestToOriginTime.substring(2,res[i].DestToOriginTime.length).replace('H','시').replace('M','분')+"</small><br><img src='<c:url value="/images/줄비행기.PNG"/>'<br><div style='color:green'><Strong>"+res[i].segmentsList1[2]+"회 경유</Strong></div></div>";       
					list+="<div class='col-md-3' style='color:black; height: 90px; width: 40px; text-align:left'><Strong>"+res[i].segmentsList1[1].substr(11,5)+"</Strong><br>"+code2+"</div>";
					list+="</div>";
					list+="</div>";
					list+="<div class='col-sm-4' style='color:black; height: 180px; width: 100px; text-align:center; background-color: white; box-shadow: 1px 1px 1px 1px gray; border-radius: 11px / 11px;'>";
					list+="<div class='col-md-12' style='color:black; height: 90px; padding:20px; font-size:1.7em;text-align:center;'><Strong>￦"+res[i].basePrice.split('.')[0]+"원</Strong><br><small>총 가격 "+res[i].totalPrice.split('.')[0]+"원</small></div><br>";
					list+="<button id='a_select_"+i+"' type='button' class='btn btn-success btn-lg' style='cursor:pointer; border-radius:6px;'><Strong>선택 →</Strong></button>";
					list+="</div>";
					list+="</div>";
					list+="</div>";
					list+="</div>";
				}
				$('#AirList').html(list); 
				$('#loadingImg').attr('style','display:none')
			});//ajax.done()
			
	}
	$( "#departureDate" ).datepicker({
		showAnim: "slideDown",
		dateFormat: "yy-mm-dd",
		minDate: new Date(),
		onSelect:function(dateText){
			$('#display').html(dateText);
		}
	});
    $( "#returnDate" ).datepicker({
		showAnim: "slideDown",
		dateFormat: "yy-mm-dd",
		minDate: new Date(),
		onSelect:function(dateText){
		$('#display').html(dateText);
	}
});
    $('#arrival').autocomplete({
		source : function(request, response) {
			console.log($('#ui-id-1').prop('style'))
			$('#ui-id-1').prop('style').zIndex=1051;
			$('#ui-id-1').prop('style').backgroundColor='white';
			$('#ui-id-1').prop('style').maxWidth='400px';
			$('#ui-id-1').prop('style').listStyle='none';
			$('#ui-id-1').prop('style').paddingLeft='10px';
			$.ajax({
				async : false,
				crossDomain : true,
	            url : "https://skyscanner-skyscanner-flight-search-v1.p.rapidapi.com/apiservices/autosuggest/v1.0/KR/KRW/ko-KR/",
	            method : "GET",
	            headers : {
					"x-rapidapi-host" : "skyscanner-skyscanner-flight-search-v1.p.rapidapi.com",
					"x-rapidapi-key" : "${AutoCompleteApiKey}"
				},
	            data : {"query" : request.term},
	            success : function(data){
	            	response($.map(data.Places, function(item){
						return {
							label: item.PlaceName+'('+item.PlaceId.split('-')[0]+')',
	                        value: item.PlaceId.split('-')[0]
						}
					}));
				},
				error : function(){ //실패
						alert("통신에 실패했습니다.");
				}
			});
		},
		minLength : 1,
        autoFocus : false,
		focus : function(evt, ui) {
			for(let child of evt.delegateTarget.children){
	   			child.children[0].style="";
	   		}
	   		evt.toElement.style.backgroundColor='sandybrown';
	   		evt.toElement.style.color='white';
		},
	  /*close : function(evt) {}  */
		 
	})
          
          $('#departure').autocomplete({
				source : function(request, response) {
					console.log($('#ui-id-2').prop('style'))
					$('#ui-id-2').prop('style').zIndex=1051;
					$('#ui-id-2').prop('style').backgroundColor='white';
					$('#ui-id-2').prop('style').maxWidth='400px';
					$('#ui-id-2').prop('style').listStyle='none';
					$('#ui-id-2').prop('style').paddingLeft='10px';
					$.ajax({
						async : false,
						crossDomain : true,
			            url : "https://skyscanner-skyscanner-flight-search-v1.p.rapidapi.com/apiservices/autosuggest/v1.0/KR/KRW/ko-KR/",
			            method : "GET",
			            headers : {
							"x-rapidapi-host" : "skyscanner-skyscanner-flight-search-v1.p.rapidapi.com",
							"x-rapidapi-key" : "${AutoCompleteApiKey}"
						},
			            data : {"query" : request.term},
			            success : function(data){
			            	response($.map(data.Places, function(item){
								return {
									label: item.PlaceName+'('+item.PlaceId.split('-')[0]+')',
			                        value: item.PlaceId.split('-')[0]
								}
							}));
						},
						error : function(){ //실패
								alert("통신에 실패했습니다.");
						}
					});
				},
				minLength : 1,
		        autoFocus : false,
		        //엔터키로 넣는 코드 사용하려면 수정필요
				/* select : function(evt, ui) {
					evt.preventDefault();
					console.log("전체 data: " + JSON.stringify(ui));
						console.log(ui.item.label);
						$('#departure').val(ui.item.label);
		                var e = $.Event( "keypress", { which: 13 } );
		                $('#departure').trigger(e);
		                $('#departure').val("");
		                $('#departure').focus();
				}, */
				focus : function(evt, ui) {
					for(let child of evt.delegateTarget.children){
			   			child.children[0].style="";
			   		}
			   		evt.toElement.style.backgroundColor='sandybrown';
			   		evt.toElement.style.color='white';
				},
			  /*close : function(evt) {}  */
          })
      //버튼 이미지 사용시: 버튼의 크기 조정
      //$('.ui-datepicker-trigger').prop('style', 'width:40px;height:40px;');
      //$('.ui-datepicker-trigger > img').prop('style', 'width:40px;height:40px;vertical-align:middle;margin-top:-4px;margin-left:-10px');
      //이미지 온리 사용시      
      $('#home_search_form').submit(function(e){
    	  resultAirModal();
    	  return false;
      });  
	});
       
      
   
            

</script>
<div class="home_search">
	<div class="container">
		<div class="row">
			<div class="col">
				<div class="home_search_container">
					<h2 style='text-align: center; color: #E8E822'>Where do you
						Want to go?</h2>
					<div class="home_search_title">
						<a href='<c:url value="/TravelMaker/AirList.kosmo"/>'>항공권 검색</a>
					</div>
					<div class="home_search_title">
						<a href='<c:url value="/TravelMaker/HotelList.kosmo"/>'>호텔 검색</a>
					</div>
					<div class="home_search_content">
						<form action="#" class="home_search_form" id="home_search_form">
							<div
								class="d-flex flex-lg-row flex-column align-items-start justify-content-lg-between justify-content-start">
								<input type="text" name="departure" id="departure"
									class="search_input search_input_1" placeholder="출발지"
									required="required" data-placement="bottom"> <input
									type="text" name="arrival" id="arrival"
									class="search_input search_input_2" placeholder="도착지"
									required="required" data-placement="bottom"> <input
									type="text" name="departureDate" id="departureDate"
									class="search_input search_input_3" placeholder="가는날"
									required="required"> <input type="text"
									name="returnDate" id="returnDate"
									class="search_input search_input_4" placeholder="오는날"
									required="required"> <input type="text" name="adult"
									id="adult" class="search_input search_input_5" placeholder="성인"
									required="required" value="1"> <input type="text"
									name="children" id="children"
									class="search_input search_input_5" placeholder="어린이">
								<button class="home_search_button" style="">항공권 검색</button>
								<img id="loadingImg" src="<c:url value="/images/loading.gif"/>"></img>
							</div>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="container">
	<div class="row" style="color: red; font-size: 20px">
		<div class="btn-group-vertical" id=deplist></div>
		<div class="btn-group-vertical" id=arrlist></div>
	</div>
</div>
<div id='AirList'></div>
<!-- Footer -->