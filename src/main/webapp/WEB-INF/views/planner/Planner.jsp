<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>layout.jsp</title>

<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="<c:url value='/plugins/cal_plugins/fontawesome-free/css/all.min.css'/>">
<!-- fullCalendar -->
<link rel="stylesheet"
	href="<c:url value='/plugins/cal_plugins/fullcalendar/main.min.css'/>">
<link rel="stylesheet"
	href="<c:url value='/plugins/cal_plugins/fullcalendar-daygrid/main.min.css'/>">
<link rel="stylesheet"
	href="<c:url value='/plugins/cal_plugins/fullcalendar-timegrid/main.min.css'/>">
<link rel="stylesheet"
	href="<c:url value='/plugins/cal_plugins/fullcalendar-bootstrap/main.min.css'/>">
<!-- Theme style -->
<link rel="stylesheet"
	href="<c:url value='/plugins/cal_dist/css/adminlte.css'/>">
</head>
<style>
#map {
       height: 493px;
       width: 100%;
     }


</style>	
<body class="hold-transition sidebar-mini">
	
	<div class="wrapper">
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Main content -->
			<section class="content">
				
				<div class="container-fluid">
					<div class="row" >
						
						<div class="col-md-12" style="text-align: center;margin-top:50px;">
							<form action="<c:url value="/TravelMaker/PlannerSave.kosmo"/>">
								<div class="row">
									<div class="col-md-1">
									
									</div>
									<div class="input-group input-group-lg col-md-7" style="text-align: center;">
										<input class="form-control" type="text" value="${planner_name}" id="planner_name" name="planner_name" placeholder="이름을 작명해 주세요" >
										<input hidden="true" type="text" name="planner_no" value="${planner_no}">
									</div>
									<div class="col-md-1">
									
									</div>
									<div class="col-md-3">
										<button class="btn btn-danger"  style="width:100%" >전체 저장</button>
									</div>
								</div>
							</form>
						</div>
						<div class="col-md-12" style="text-align: center;">
							<br>
						</div>
						<div class="col-md-9">
							<div class="card card-primary">
								<div class="card-body p-0">
									<!-- THE CALENDAR -->
									<div id="calendar">
									<!-- 이 안에 생긴다 -->
									</div>
								</div>
								<!-- /.card-body -->
							</div>
							<!-- /.card -->
						</div>
						<div class="col-md-3">
							<div class="row">
								<div class="col-md-12">
									<div class="card card-primary">
										<div class="card-header">
											<h4 class="card-title">일정 카드</h4>
										</div>
										<div class="card-body">
											<!-- the events -->
											<div id="external-events">
												<c:if test="${!returnFromMap}">
														<c:if test="${empty city_name_date}" var="dateTest">
															<c:forEach items="${city_no_name}" var="name">
																	<div class="external-event bg-info">${name.key}</div>
															</c:forEach>
														</c:if>
														<c:if test="${!dateTest}">
															<c:forEach items="${city_name_date}" var="name">
																<c:if test="${empty name.value}" >
																	<div class="external-event bg-info">${name.key}</div>
																</c:if>
															</c:forEach>
														</c:if>
												</c:if>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-12">
									<div class="card card-primary">
										<div class="card-header">
											<h4 class="card-title">호텔 등록</h4>
										</div>
										<div class="card-body">	
											<c:forEach items="${city_no_name}" var="name">
														<button id='h_${name.key}' class="btn btn-info" type="button" data-toggle="modal" data-target="#h_modal_${name.key}" style="width:100%;margin-bottom:4px">
															${name.key}주변 호텔 찾아보기
														</button>
														
														<div class="modal fade" id="h_modal_${name.key}">
															<div class="modal-dialog">
																<div class="modal-content">
																	<div class="modal-header bg-info">
																		<h2>${name.key}호텔검색</h2>
																		
																	</div>
																	<div class="modal-body">
																	<h4 id="h_modal_hotelName_${name.key}"></h4>
														              	<div>
																			<form action="#">
																				<input id="autocomplete_${name.key}" value="${name.key}" class="search_input search_input_1" placeholder="장소" required="required">
																				<input type="number" id="adult_${name.key}"  placeholder="성인" required="required">
																				<input type="date" id="datepicker_${name.key}" value="" placeholder="check in" required="required"> 
																				<input type="number" id="children_${name.key}" placeholder="미성년(선택사항)">
																				<input type="date" id="datepicker1_${name.key}" value="" placeholder="check out" required="required">
																				<input type="number" id="rooms_${name.key}"  placeholder="방 갯수" required="required">
																			</form>
																		</div>
																	</div>
																	<div class="modal-footer justify-content-between bg-info">
														            	<button type="button" class="btn btn-outline-light" data-dismiss="modal">Close</button>
														            	<button type="button" class="btn btn-outline-light" onclick="resultHotelModal('${name.key}','${name.value}')">검색</button>
														            </div>
																</div>
															</div>
														</div>
											</c:forEach>
											
											<div class="modal fade" id="h_modal_result" >
												<div class="modal-dialog modal-lg">
													<div class="modal-content"style='height:800px;'>
														<div class="modal-header bg-info">
															<h2>호텔 검색결과</h2><h4 id="hotel_date"></h4><h4 id="city_name"></h4>
														</div>
														<div class="modal-body" style='overflow-y:scroll;'>
															<div id='h_places'></div>
														</div>
														<div class="modal-footer justify-content-between bg-info">
												            <button type="button" class="btn btn-outline-light" data-dismiss="modal">Close</button>
												            <input type="text"  value="" id="h_cities_no">
											            </div>
													</div>
												</div>
											</div>
											
										</div>	
									</div>
								</div>
								<div class="col-md-12">
									<div class="card card-primary">
										<div class="card-header">
											<h4 class="card-title">항공권 예매</h4>
										</div>
										<div class="card-body">	
											
											<button class="btn btn-info" type="button" data-toggle="modal" data-target="#a_modal" style="width:100%">항공권 검색</button>
											<div class="modal fade" id="a_modal">
												<div class="modal-dialog">
													<div class="modal-content">
														<div class="modal-header bg-info ">
															<h2>항공권 검색</h2>
														</div>
														<div class="modal-body">
															<div>
																<form action="#">
																	<input type="text" name="departure" id="departure" placeholder="출발지" required="required" data-placement="bottom"> 
																	<input type="text" name="arrival" id="arrival" placeholder="도착지" required="required" data-placement="bottom">
																	<br>
																	<label>출발</label>
																	<input type="date" value="2020-07-12" name="departureDate" id="departureDate" placeholder="가는날" required="required"> 
																	<label>도착</label>
																	<input type="date" value='' name="returnDate" id="returnDate"  placeholder="오는날" required="required"> 
																	<input type="number" name="adult" id="adult" placeholder="성인" required="required"> 
																	<input type="number" name="children" id="children" placeholder="미성년(선택사항)">
																</form>
															</div>
														</div>
														<div class="modal-footer justify-content-between bg-info">
												            <button type="button" class="btn btn-outline-light" data-dismiss="modal">Close</button>
												            <button type="button" class="btn btn-outline-light" onclick='resultAirModal()'>검색</button>
											            </div>
													</div>
												</div>
											</div>
											<div class="modal fade" id="a_modal_result" >
												<div class="modal-dialog modal-lg">
													<div class="modal-content">
														<div class="modal-header bg-info">
															<h2>항공권 검색결과</h2>
														</div>
														<div class="modal-body">
															<div id='a_places'></div>
														</div>
														<div class="modal-footer justify-content-between bg-info">
												            <button type="button" class="btn btn-outline-light" data-dismiss="modal">Close</button>
											            </div>
													</div>
												</div>
											</div>
										</div>	
									</div>
								</div>
								<div class="col-md-12">
									<div class="card card-primary">
										<div class="card-header">
											<h4 class="card-title">도시 세부일정</h4>
										</div>
										<div class="card-body">	
											<c:forEach items="${city_no_name}" var="name">
												
														<button id="plan_btn_${name.key}" class="btn btn-info" type="button" data-toggle="modal" data-target="#d-modal-${name.key}" style="width:100%;margin-bottom:4px">
															${name.key}에 대한 세부 일정 짜기
														</button>
														<div class="modal fade" id="d-modal-${name.key}">
															<div class="modal-dialog">
																<div class="modal-content">
																	<div class="modal-header bg-info">
																		<h2>세부 일정 in ${name.key}</h2>
																	</div>
																	<div class="modal-body">
														              	<div>
																			<form action="<c:url value="/TravelMaker/Plan.kosmo"/>" method="post" style='margin-bottom:4px'>
																                <input hidden="true" name="origin" value="${name.key}" /> 
																				<input hidden="true" name="destination" value="공항,${name.key}" />
																				<input hidden="true" name="planner_no" value="${planner_no}" />
																				<input hidden="true" name="cities_no" value="${name.value}"/>
																                <button class="btn btn btn-success">일정 짜기</button>
																            </form>
																	         <div>
																	            <button class="btn btn-success" onclick="callPlanDetails('${name.value}','${name.key}')" >목록 보기</button>
																	            <div class="well" id="planDetail_${name.key}">
																				</div>
																			</div>
																		</div>
														            </div>
																	<div class="modal-footer justify-content-between bg-info">
														            	<button type="button" class="btn btn-outline-light" data-dismiss="modal">Close</button>
														            </div>
																</div>
															</div>
														</div>
														
											</c:forEach>
										</div>	
									</div>
								</div>
								<div class="col-md-12">
									<div class="card card-primary">
										<div class="card-header">
											<h4 class="card-title" id="map_title">지도</h4>
										</div>
										<div class="card-body" id="map">	
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- /.col -->
						
					</div>
					<!-- /.row -->
				</div>
				<!-- /.container-fluid -->
			</section>
			<!-- /.content -->
		</div>
	</div>
	<!-- ./wrapper -->

	<!-- jQuery -->
	<script
		src='<c:url value="/plugins/cal_plugins/jquery/jquery.min.js"/>'></script>
	<!-- Bootstrap -->
	<script
		src='<c:url value="/plugins/cal_plugins/bootstrap/js/bootstrap.bundle.min.js"/>'></script>
	<!-- jQuery UI -->
	<script
		src="<c:url value='/plugins/cal_plugins/jquery-ui/jquery-ui.min.js'/>"></script>
	<!-- AdminLTE App -->
	<script src="<c:url value='/plugins/cal_dist/js/adminlte.min.js'/>"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="<c:url value='/plugins/cal_dist/js/demo.js'/>"></script>
	<!-- fullCalendar 2.2.5 -->
	<script
		src="<c:url value='/plugins/cal_plugins/moment/moment.min.js'/>"></script>
	<script
		src="<c:url value='/plugins/cal_plugins/fullcalendar/main.min.js'/>"></script>
	<script
		src="<c:url value='/plugins/cal_plugins/fullcalendar-daygrid/main.min.js'/>"></script>
	<script
		src="<c:url value='/plugins/cal_plugins/fullcalendar-timegrid/main.min.js'/>"></script>
	<script
		src="<c:url value='/plugins/cal_plugins/fullcalendar-interaction/main.min.js'/>"></script>
	<script
		src="<c:url value='/plugins/cal_plugins/fullcalendar-bootstrap/main.min.js'/>"></script>
	<!-- Page specific script -->
	
	<script async defer
    src="https://maps.googleapis.com/maps/api/js?key=${GoogleMapApiKey}&libraries=places&callback=initMap">
    </script>
	
	
	<script>
		
		
		
		
		var lat,lng;//호텔용
		$(function() {
			

			$('#planner_name').change(function(){
				$.ajax({
					url:'<c:url value="SavePlannerName.kosmo"/>',
					data:{
						'planner_no':'${planner_no}',
						'planner_name':$('#planner_name').val()
					},
					success:function(){console.log('아이디가 ',$('#planner_name').val()+'로 변경됨')},
					error:function(request,error){
						console.log('상태코드:',request.status);
						console.log('서버로부터 받은 HTML데이타:',request.responseText);
						console.log('에러:',error);
					}
					
				});
			});
			
			
			
			<c:forEach items="${city_hotel}" var="check" >
			console.log('${check}')
			if('${check.value}'=='1')
				$('#h_${check.key}').prop('class','btn btn-danger').html( '${check.key} 등록 호텔 수정하기');
				
			</c:forEach>
			
			<c:forEach items="${city_hotel_name}" var="hotelName">
				$('#h_modal_hotelName_${hotelName.key}').html('예약된 호텔:${hotelName.value}');
			</c:forEach>
			<c:forEach items="${city_plan_no}" var="plan_check" >
				if('${plan_check.value ==1}')
				$('#plan_btn_${plan_check.key}').prop('class','btn btn-danger').html('${plan_check.key}에 대한 세부 일정 수정')
			</c:forEach>
			
			console.log('today: ${today}');
			console.log('city_name_date','${city_name_date}');
			var events=[
				{
				start: '2020-01-01',
				end: '${today}',
		        overlap: false,
		        color: '#ffffff'
				}
			]
			if('${city_name_date}'!=''){
				
				<c:forEach items="${city_name_date}" var="date" >
					if('${date.value}'!=''){
					$('#datepicker_${date.key}').attr('value','${date.value}'.split(',')[0]);
					$('#datepicker1_${date.key}').attr('value','${date.value}'.split(',')[1]);
					var cityBar={
						start: '${date.value}'.split(',')[0],
						end: dateFiting('${date.value}'.split(',')[1],'c'),
				        overlap: false,
				        color: '#17A2B8',
				        title:'${date.key}'
					}
					events.push(cityBar);
					}
				</c:forEach>
				console.log('events',events);
			}
			var date = new Date();
			/* initialize the external events
			 -----------------------------------------------------------------*/
			function ini_events(ele) {
				ele.each(function() {
					// create an Event Object (https://fullcalendar.io/docs/event-object)
					// it doesn't need to have a start or end
					var eventObject = {
						title : $.trim($(this).text()),
						overlab : false
					// use the element's text as the event title
					}

					// store the Event Object in the DOM element so we can get to it later
					$(this).data('eventObject', eventObject)

					// make the event draggable using jQuery UI
					$(this).draggable({
						zIndex : 1070,
						revert : true, // will cause the event to go back to its
						revertDuration : 0
					//  original position after the drag
					})

				})
			}

			ini_events($('#external-events div.external-event'))

			/* initialize the calendar
			 -----------------------------------------------------------------*/
			//Date for the calendar events (dummy data)
			var d = date.getDate(), m = date.getMonth(), y = date.getFullYear()

			var Calendar = FullCalendar.Calendar;
			var Draggable = FullCalendarInteraction.Draggable;

			var containerEl = document.getElementById('external-events');
			var calendarEl = document.getElementById('calendar');

			// initialize the external events
			// -----------------------------------------------------------------

			new Draggable(containerEl, {
				itemSelector : '.external-event',
				eventData : function(eventEl) {
					return {
						title : eventEl.innerText,
						backgroundColor : window
								.getComputedStyle(eventEl, null)
								.getPropertyValue('background-color'),
						borderColor : window.getComputedStyle(eventEl, null)
								.getPropertyValue('background-color'),
						textColor : window.getComputedStyle(eventEl, null)
								.getPropertyValue('color'),
					};
				}
			});

			var calendar = new Calendar(calendarEl,
					{
						plugins : [ 'bootstrap', 'interaction', 'dayGrid'],
						header : {
							left : 'prev,next today',
							center : 'title',
							right : 'dayGridMonth'
						},
						'themeSystem' : 'bootstrap',
						events:events,
						editable : true,
						droppable : true, // this allows things to be dropped onto the calendar !!!
						//카드에서 드랍시 한번만 1
						drop : function(info) {
							info.draggedEl.parentNode.removeChild(info.draggedEl);
							console.log('drop',info);
						},
						//카드에서 드랍시 한번만 2
						eventReceive:function(info){
							
							alert('도시명:'+info.event.title+',시작 날짜:'+dateFiting(info.event.start.toISOString(),'s'));
							console.log('eventReceive',info);
							if(info.event.end==null){
								$('#datepicker_'+info.event.title).attr('value',dateFiting(info.event.start.toISOString(),'s'));
								$('#datepicker1_'+info.event.title).attr('value',dateFiting(info.event.start.toISOString(),'s'));
								
								$.ajax({
									url:'<c:url value="SaveDates.kosmo"/>',
									data:{
										'city_name':info.event.title,
										'cities_date':dateFiting(info.event.start.toISOString(),'s')+','+dateFiting(info.event.start.toISOString(),'s'),
										'planner_no':'${planner_no}'
										
									},
									dataType:'text',
									success:function(data){console.log(data)},
									error:function(request,error){
										console.log('상태코드:',request.status);
										console.log('서버로부터 받은 HTML데이타:',request.responseText);
										console.log('에러:',error);
									}
									
								});
								
							}
							else{
								$('#datepicker_'+info.event.title).attr('value',dateFiting(info.event.start.toISOString(),'s'));
								$('#datepicker1_'+info.event.title).attr('value',dateFiting(info.event.end.toISOString(),'e'));
								
								$.ajax({
									url:'<c:url value="SaveDates.kosmo"/>',
									data:{
										'city_name':info.event.title,
										'cities_date':dateFiting(info.event.start.toISOString(),'s')+','+dateFiting(info.event.end.toISOString(),'e'),
										'planner_no':'${planner_no}'
										
									},
									dataType:'text',
									success:function(data){console.log(data)},
									error:function(request,error){
										console.log('상태코드:',request.status);
										console.log('서버로부터 받은 HTML데이타:',request.responseText);
										console.log('에러:',error);
									}
									
								});
							}
							
						},
						//옮기는 드롭
						eventDrop: function(info) {
							if(info.event.end==null){
								alert('도시명:'+info.event.title+',시작 날짜:'+dateFiting(info.event.start.toISOString(),'s')+',끝날짜:'+dateFiting(info.event.start.toISOString(),'s'));
							}
							else{
								alert('도시명:'+info.event.title+',시작 날짜:'+dateFiting(info.event.start.toISOString(),'s')+',끝날짜:'+dateFiting(info.event.end.toISOString(),'e'));
							}
							console.log('eventDrop',info);
							if(date>=info.event.start){
								info.revert();
							}
							if(info.event.end==null){
								console.log('eventDrop',info)
								$('#datepicker_'+info.event.title).attr('value',dateFiting(info.event.start.toISOString(),'s'));
								$('#datepicker1_'+info.event.title).attr('value',dateFiting(info.event.start.toISOString(),'s'));
								
								$.ajax({
									url:'<c:url value="SaveDates.kosmo"/>',
									data:{
										'city_name':info.event.title,
										'cities_date':dateFiting(info.event.start.toISOString(),'s')+','+dateFiting(info.event.start.toISOString(),'s'),
										'planner_no':'${planner_no}'
										
									},
									dataType:'text',
									success:function(data){console.log(data)},
									error:function(request,error){
										console.log('상태코드:',request.status);
										console.log('서버로부터 받은 HTML데이타:',request.responseText);
										console.log('에러:',error);
									}
									
								});
							}
							else{
								$('#datepicker_'+info.event.title).attr('value',dateFiting(info.event.start.toISOString(),'s'));
								$('#datepicker1_'+info.event.title).attr('value',dateFiting(info.event.end.toISOString(),'e'));
								
								$.ajax({
									url:'<c:url value="SaveDates.kosmo"/>',
									data:{
										'city_name':info.event.title,
										'cities_date':dateFiting(info.event.start.toISOString(),'s')+','+dateFiting(info.event.end.toISOString(),'e'),
										'planner_no':'${planner_no}'
										
									},
									dataType:'text',
									success:function(data){console.log(data)},
									error:function(request,error){
										console.log('상태코드:',request.status);
										console.log('서버로부터 받은 HTML데이타:',request.responseText);
										console.log('에러:',error);
									}
									
								});
							}
						},
						//크기 변경
						eventResize: function(info) {
						    alert('도시명:'+info.event.title+',시작 날짜:'+dateFiting(info.event.start.toISOString(),'s')+',끝 날짜:'+dateFiting(info.event.end.toISOString(),'e'));
							console.log('eventResize',info);
							if(info.event.end==null){
								$('#datepicker_'+info.event.title).attr('value',dateFiting(info.event.start.toISOString(),'s'));
								$('#datepicker1_'+info.event.title).attr('value',dateFiting(info.event.start.toISOString(),'s'));
								
								$.ajax({
									url:'<c:url value="SaveDates.kosmo"/>',
									data:{
										'city_name':info.event.title,
										'cities_date':dateFiting(info.event.start.toISOString(),'s')+','+dateFiting(info.event.start.toISOString(),'s'),
										'planner_no':'${planner_no}'
										
									},
									dataType:'text',
									success:function(data){console.log(data)},
									error:function(request,error){
										console.log('상태코드:',request.status);
										console.log('서버로부터 받은 HTML데이타:',request.responseText);
										console.log('에러:',error);
									}
									
								});
							}
							else{
								$('#datepicker_'+info.event.title).attr('value',dateFiting(info.event.start.toISOString(),'s'));
								$('#datepicker1_'+info.event.title).attr('value',dateFiting(info.event.end.toISOString(),'e'));
								
								$.ajax({
									url:'<c:url value="SaveDates.kosmo"/>',
									data:{
										'city_name':info.event.title,
										'cities_date':dateFiting(info.event.start.toISOString(),'s')+','+dateFiting(info.event.end.toISOString(),'e'),
										'planner_no':'${planner_no}'
										
										
									},
									dataType:'text',
									success:function(data){console.log(data)},
									error:function(request,error){
										console.log('상태코드:',request.status);
										console.log('서버로부터 받은 HTML데이타:',request.responseText);
										console.log('에러:',error);
									}
									
								});
							}
						    
						  }
					});
			/* $('.fc-today').appendChild('') */
			calendar.render();
			// $('#calendar').fullCalendar()
			//$('td[data-date=2020-07-05]').prop('style','background-color:red');
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
					$.each(evt.delegateTarget.children,(index,value)=>{
						value.children[0].style=""
					})
			   		evt.toElement.style.backgroundColor='cyan';
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
					$.each(evt.delegateTarget.children,(index,value)=>{
						value.children[0].style=""
					})
			   		evt.toElement.style.backgroundColor='cyan';
			   		evt.toElement.style.color='white';
				},
			  /*close : function(evt) {}  */
	   		 
			})
			var input;
			var autocomplete;
			<c:forEach items="${city_no_name}" var="name" varStatus='h_i'>
			console.log('${name}')
			input = document.getElementById('autocomplete_${name.key}');
			autocomplete = new google.maps.places.Autocomplete(input);
			google.maps.event.addListener(autocomplete, 'place_changed', function () {
				var place = autocomplete.getPlace();
				console.log('lat', place.geometry.location.lat())
		        console.log('lng', place.geometry.location.lng())
		        lat = place.geometry.location.lat()
		        lng = place.geometry.location.lng()
			})
			$('#h_${name.key}').click(()=>{
				console.log($('div.pac-container'))
				$('div.pac-container')['${h_i.index}'].style.zIndex=2000;
			})
			</c:forEach>
			
			
			
		})
		function dateFiting(date,se){
			var date=date.split('T')[0]
			if(se=='s'){
				var dates=date.split('-')
				var year=dates[0];
				var month=dates[1];
				var day=dates[2];
				day=(parseInt(day)+1).toString();
				return (year+'-'+month+'-'+day);
			}
			else if(se=='e'){
				var dates=date.split('-')
				var year=dates[0];
				var month=dates[1];
				var day=dates[2];
				day=(parseInt(day)).toString();
				return (year+'-'+month+'-'+day);
			}
			else{
				var dates=date.split('-')
				var year=dates[0];
				var month=dates[1];
				var day=dates[2];
				day=(parseInt(day)+1).toString();
				return (year+'-'+month+'-'+day);
			}
		}
		function resultHotelModal(name,cities_no){
			$('#h_modal_'+name).modal('hide');
			$('#h_places').html('')
			$('#city_name').html(name);
			$('#h_cities_no').prop('value',cities_no);
			var adult = $('#adult_'+name).prop('value');
			var children = $('#children_'+name).prop('value');
			var rooms = $('#rooms_'+name).prop('value');
			var checkin = $('#datepicker_'+name).prop('value');
			var checkout = $('#datepicker1_'+name).prop('value');
			var urlStr = "https://tripadvisor1.p.rapidapi.com/hotels/list-by-latlng?lang=ko_KR&hotel_class=1%252C2%252C3&limit=10&adult="+adult+"&rooms="+rooms+"&currency=KRW&latitude="+lat+"&longitude="+lng;
			
			$('#hotel_date').html(checkin+'부터 '+checkout+' 까지' );
			
			var settings = {
					"async" : true,
					"crossDomain" : true,
					"url" : urlStr,
					"method" : "GET",
					"headers" : {
						"x-rapidapi-host" : "tripadvisor1.p.rapidapi.com",
						"x-rapidapi-key" : '${TripAdviserHotelApiKey}'
					}
			}//settings
			$.ajax(settings).done(
				function(response) {
					console.log(response)
					var placesList = document.getElementById('h_places');
					console.log(placesList)
					placesList.removeAttribute('value')
					var img;
					for (var i = 0; i < response.data.length; i++) {
						img = document.createElement('img');
						img.style.height='167px';
						img.style.width='250px';
						img.alt = 'no image';
						if (response.data[i].photo.images.medium.url != null) 
							img.src = response.data[i].photo.images.medium.url;
						else if (response.data[i].photo.images.large.url != null) 
							img.src = response.data[i].photo.images.large.url;
						else if (response.data[i].photo.images.original.url != null) 
							img.src = response.data[i].photo.images.original.url;
						else if (response.data[i].photo.images.small.url != null) 
							img.src = response.data[i].photo.images.small.url;
						else if (response.data[i].photo.images.medium.url != null) 
							img.src = response.data[i].photo.images.medium.url;
						else{
							img.src = "<c:url value='images/hotel_icon'/>"
						}
						var div = document.createElement('div');
						div.className = 'col-sm-5';
						var div2 = document.createElement('div');
						div2.className = 'col-sm-5';
						var div3 = document.createElement('div');
						div3.className = 'col-sm-2';
						var btn = document.createElement('div');
						btn.className = 'btn btn-danger';
						btn.textContent='예약하기';
						btn.setAttribute('name',i);
						btn.setAttribute('onclick','getHotelDetails(this)')
						var row = document.createElement('div');
						row.className = 'row';
						var row2 = document.createElement('div');
						row2.className = 'row';
						row2.id='hotel_'+i;
						var div_name = document.createElement('div');
						div_name.className = 'col-sm-12';
						var div_rating = document.createElement('div');
						div_rating.className = 'col-sm-12';
						var div_location = document.createElement('div');
						div_location.className = 'col-sm-12';
						var div_price_level = document.createElement('div');
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
						row.appendChild(div3);
						div3.appendChild(btn);
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
			$('#h_modal_result').modal('show');
		}////////////////resultHotelModal()
		
		function getHotelDetails(data){
			console.log('getHotelDetails.data',data.getAttribute('name'));
			
			console.log($('#hotel_'+data.getAttribute('name')+' > div:eq(0)').html());
			console.log($('#hotel_'+data.getAttribute('name')+' > div:eq(1)').html());
			console.log($('#hotel_'+data.getAttribute('name')+' > div:eq(2)').html());
			console.log($('#hotel_'+data.getAttribute('name')+' > div:eq(3)').html());
			console.log($('#datepicker_'+$('#city_name').html()).prop('value'));
			console.log($('#h_cities_no').prop('value'))
			var latlng=$('#hotel_'+data.getAttribute('name')+' > div:eq(2)').html().substring(13);
			$.ajax({
				url:'<c:url value="/TravelMaker/HotelTest.kosmo"/>',
				data:
				{
				"hotel_name":$('#hotel_'+data.getAttribute('name')+' > div:eq(0)').html().split(":")[1],
				"hotel_city":$('#city_name').html(),
				"hotel_in":$('#datepicker_'+$('#city_name').html()).prop('value'),
				"hotel_out":$('#datepicker1_'+$('#city_name').html()).prop('value'),
				"hotel_customer":$('#adult_'+$('#city_name').html()).prop('value'),
				"hotel_room":$('#rooms_'+$('#city_name').html()).prop('value'),
				"hotel_price":$('#hotel_'+data.getAttribute('name')+' > div:eq(3)').html().split(":")[1],
				"hotel_latlng":latlng.split(",")[0].split(":")[1].trim()+","+latlng.split(",")[1].split(":")[1].trim(),
				"hotel_score":$('#hotel_'+data.getAttribute('name')+' > div:eq(1)').html().split(":")[1],
				"cities_no":$('#h_cities_no').prop('value') ,
				"city_name":$('#city_name').html()
				},
				dataType:'text',
				success:function(data){successAjax(data)},
				error:function(request,error){
					console.log('상태코드:',request.status);
					console.log('서버로부터 받은 HTML데이타:',request.responseText);
					console.log('에러:',error);
				}
				
			})
			
		}
		function successAjax(data){
			$('#h_'+data.split(':')[0]).prop('class','btn btn-danger').html(data.split(':')[0]+' 등록 호텔 수정하기');
			$('#h_modal_hotelName_'+data.split(':')[0]).html('예약된 호텔:'+data.split(':')[2]);
			alert(data.split(':')[0]+data.split(':')[1])
		}
		
		function CallPlanDetilsByMap(data){
			$.ajax({
				url:'<c:url value="CallPlanDetilsByMap.kosmo"/>',
				data:{
					'planner_no':'${planner_no}',
					'cities_no':data.id,
					'day':data.innerHTML.substring(4)
				},
				dataType:'json',
				success:function(data){ChangeMap(data)},
				error:function(request,error){
					console.log('상태코드:',request.status);
					console.log('서버로부터 받은 HTML데이타:',request.responseText);
					console.log('에러:',error);
				}
				
			});
			
		}///CallPlanDetilsByMap
		
		
		function callPlanDetails(cities_no,city_name){
			var planDetail=document.getElementById('planDetail_'+city_name)
			planDetail.innerHTML=''
			
			$.ajax({
				url:'<c:url value="SelectPlanDetails.kosmo"/>',
				data:{
					'cities_no':cities_no
					
				},
				dataType:'json',
				success:function(data){
					
					console.log('detailData:',data)
					$.each(data[0],function(index,value){
						
						console.log(index,':',value)
						
						var row=document.createElement('div');
						row.setAttribute('class','row')
						planDetail.appendChild(row);
						
						var div=document.createElement('div');
						div=document.createElement('div');
						div.textContent='day '+index;
						div.setAttribute('class','btn btn-info col-sm-3')
						div.setAttribute('style','margin:5px;')
						div.setAttribute('id',cities_no)
						div.setAttribute('onclick','CallPlanDetilsByMap(this)')
						row.appendChild(div);
						div=document.createElement('div');
						div.textContent=value;
						div.setAttribute('class','col-sm-8')
						div.setAttribute('style','margin-top:5px;font-weight:bolder')
						row.appendChild(div);
							
					});
					
				},
				error:function(request,error){
					console.log('상태코드:',request.status);
					console.log('서버로부터 받은 HTML데이타:',request.responseText);
					console.log('에러:',error);
				}
				
			});
			
		}
		
		function resultAirModal(){
			$('#a_modal').modal('hide');
			$('#a_places').html(""); 
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
				$.ajax(settings).done(function(res) {
					console.log(res)
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
					$('#a_places').html(list); 
					console.log($('#a_select_'+0));
					$('#a_modal_result').modal('show');
				});//ajax.done()
				
		}
	</script>
	<script>
		var origin;
		var map;
		var directionsService;
		//총 거리 계산  서비스 선언
		var directionsRenderer;
		var dayplans={};
		function initMap() {
			var styledMapType = new google.maps.StyledMapType(
		            [
		              {elementType: 'geometry', stylers: [{color: '#ebe3cd'}]},
		              {elementType: 'labels.text.fill', stylers: [{color: '#523735'}]},
		              {elementType: 'labels.text.stroke', stylers: [{color: '#f5f1e6'}]},
		              {
		                featureType: 'administrative',
		                elementType: 'geometry.stroke',
		                stylers: [{color: '#c9b2a6'}]
		              },
		              {
		                featureType: 'administrative.land_parcel',
		                elementType: 'geometry.stroke',
		                stylers: [{color: '#dcd2be'}]
		              },
		              {
		                featureType: 'administrative.land_parcel',
		                elementType: 'labels.text.fill',
		                stylers: [{color: '#ae9e90'}]
		              },
		              {
		                featureType: 'landscape.natural',
		                elementType: 'geometry',
		                stylers: [{color: '#dfd2ae'}]
		              },
		              {
		                featureType: 'poi',
		                elementType: 'geometry',
		                stylers: [{color: '#dfd2ae'}]
		              },
		              {
		                featureType: 'poi',
		                elementType: 'labels.text.fill',
		                stylers: [{color: '#93817c'}]
		              },
		              {
		                featureType: 'poi.park',
		                elementType: 'geometry.fill',
		                stylers: [{color: '#a5b076'}]
		              },
		              {
		                featureType: 'poi.park',
		                elementType: 'labels.text.fill',
		                stylers: [{color: '#447530'}]
		              },
		              {
		                featureType: 'road',
		                elementType: 'geometry',
		                stylers: [{color: '#f5f1e6'}]
		              },
		              {
		                featureType: 'road.arterial',
		                elementType: 'geometry',
		                stylers: [{color: '#fdfcf8'}]
		              },
		              {
		                featureType: 'road.highway',
		                elementType: 'geometry',
		                stylers: [{color: '#f8c967'}]
		              },
		              {
		                featureType: 'road.highway',
		                elementType: 'geometry.stroke',
		                stylers: [{color: '#e9bc62'}]
		              },
		              {
		                featureType: 'road.highway.controlled_access',
		                elementType: 'geometry',
		                stylers: [{color: '#e98d58'}]
		              },
		              {
		                featureType: 'road.highway.controlled_access',
		                elementType: 'geometry.stroke',
		                stylers: [{color: '#db8555'}]
		              },
		              {
		                featureType: 'road.local',
		                elementType: 'labels.text.fill',
		                stylers: [{color: '#806b63'}]
		              },
		              {
		                featureType: 'transit.line',
		                elementType: 'geometry',
		                stylers: [{color: '#dfd2ae'}]
		              },
		              {
		                featureType: 'transit.line',
		                elementType: 'labels.text.fill',
		                stylers: [{color: '#8f7d77'}]
		              },
		              {
		                featureType: 'transit.line',
		                elementType: 'labels.text.stroke',
		                stylers: [{color: '#ebe3cd'}]
		              },
		              {
		                featureType: 'transit.station',
		                elementType: 'geometry',
		                stylers: [{color: '#dfd2ae'}]
		              },
		              {
		                featureType: 'water',
		                elementType: 'geometry.fill',
		                stylers: [{color: '#b9d3c2'}]
		              },
		              {
		                featureType: 'water',
		                elementType: 'labels.text.fill',
		                stylers: [{color: '#92998d'}]
		              }
		            ],
		            {name: 'Main Map'});
		 
		 
		//맵 생성
	  map = new google.maps.Map(document.getElementById('map'), {
	  		zoom: 4,
	  		center: {lat: -8.672062, lng: 115.231609},  // 처음 지도 센터 위치: 발리 덴파사르.
	  		mapTypeControlOptions: {
	       	mapTypeIds: ['roadmap', 'satellite', 'hybrid', 'terrain',
	               'styled_map']
	      }
	  });////map 생성
	  map.mapTypes.set('styled_map', styledMapType);
	  map.setMapTypeId('styled_map');
	  directionsService = new google.maps.DirectionsService;
	  directionsRenderer = new google.maps.DirectionsRenderer({
	   	draggable:false,//드래그 가능 여부
	    map: map
	  });	
		}
	function ChangeMap(data){
		console.log('data1:',data)
		var spots=[]
		$('#d-modal-'+data[0].city_name).modal('hide');
		$.each(data,function(index,value){
			console.log('latlng:',value.latlng);
			var latlng={location:value.latlng};
			spots.push(latlng);
		})
		console.log('[0]:',data[0].city_name);
		origin=data[0].origin;
		$('#map_title').html('지도 in '+data[0].city_name+'의 '+'<span style="color:red;font-size:1.5em;">'+data[0].day+'</span>일차');
		displayRoute(origin, directionsService,directionsRenderer,spots);
		 var offset=$('#map_title').offset();
		 $('html, body').animate({scrollTop : offset.top}, 400);
		
	}
	 function displayRoute(origin, service, display,spots) {
	     service.route({
	     origin: origin,//출발지
	     destination:origin,//도착지
	     waypoints:spots,/*,{location: 'ubud, 발리'},{location: '공항, 발리'}*///여기에 경유지 추가
	     travelMode: 'DRIVING',
	     /*탈것 추가
	     DRIVING (Default)
		 BICYCLING
		 WALKING
		 ※TRANSIT
		 { 트렌짓은 이런 옵션들도 가지고 있다
		  arrivalTime: Date,
		  departureTime: Date,
		  modes[]: TransitMode,
			  BUS 
			  RAIL 
			  SUBWAY 
			  TRAIN
			  TRAM
		  
		  routingPreference: TransitRoutePreference
	  		  FEWER_TRANSFERS
	 		  LESS_WALKING
			}
		 
	     */
	     avoidTolls: false,//톨게이트 피해서?
	     optimizeWaypoints: true
	   }, function(response, status) {
	     if (status === 'OK') {
	       display.setDirections(response);
	     } else {
	       alert('Could not display directions due to: ' + status);
	     }
	   });
	 }////displayRoute
		
	
	</script>
</body>
</html>