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
<body class="hold-transition sidebar-mini">
	<div class="wrapper">
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Main content -->
			<section class="content">
				<div class="container-fluid">
					<div class="row">
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
												<c:forEach items="${city_no_name}" var="name">
													<div class="external-event bg-info">${name}</div>
												</c:forEach>
												</c:if>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-12">
									<div class="card card-primary">
										<div class="card-header">
											<h4 class="card-title">호텔 예매</h4>
										</div>
										<div class="card-body">	
											<c:forEach items="${city_no_name}" var="name">
											<button class="btn btn-info" type="button" data-toggle="modal" data-target="#h-modal-${name}" style="width:100%;margin-bottom:4px">
												${name}주변 호텔 찾아보기
											</button>
											<div class="modal fade" id="h-modal-${name}">
												<div class="modal-dialog">
													<div class="modal-content">
														<div class="modal-header bg-info">
															<h2>호텔검색</h2>
														</div>
														<div class="modal-body">
											              	<div>
																<form action="#">
																	<input id="autocomplete-${name}" placeholder="장소" required="required" value="${name}">
																	<input type="number" id="adults-${name}"  placeholder="성인" required="required">
																	<input type="text" id="datepicker-${name}" placeholder="check in" required="required"> 
																	<input type="number" id="children-${name}" placeholder="미성년">
																	<input type="text" id="datepicker1-${name}" placeholder="check out" required="required">
																	<input type="number" id="rooms-${name}" placeholder="방 갯수" required="required">
																</form>
															</div>
														</div>
														<div class="modal-footer justify-content-between bg-info">
											            	<button type="button" class="btn btn-outline-light" data-dismiss="modal">Close</button>
											            	<button type="button" class="btn btn-outline-light">검색</button>
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
											<h4 class="card-title">항공권 예매</h4>
										</div>
										<div class="card-body">	
											<button id='test' class="btn btn-info" type="button" style="width:100%">test</button>
											<button id='test2' class="btn btn-info" type="button" style="width:100%">test2</button>
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
																	<input type="date" value="2020-07-08" name="departureDate" id="departureDate" placeholder="가는날" required="required"> 
																	<label>도착</label>
																	<input type="date" value='2020-07-08' name="returnDate" id="returnDate"  placeholder="오는날" required="required"> 
																	<input type="number" name="adult" id="adult" placeholder="성인" required="required"> 
																	<input type="number" name="children" id="children" placeholder="미성년">
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
											<div class="modal fade" id="a_modal_result">
												<div class="modal-dialog">
													<div class="modal-content">
														<div class="modal-header bg-info ">
															<h2>항공권 검색결과</h2>
														</div>
														<div class="modal-body">
															<div id='places'></div>
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
											<button class="btn btn-info" type="button" data-toggle="modal" data-target="#d-modal-${name}" style="width:100%;margin-bottom:4px">
												${name}에 대한 세부 일정 짜기
											</button>
											<div class="modal fade" id="d-modal-${name}">
												<div class="modal-dialog">
													<div class="modal-content">
														<div class="modal-header bg-info">
															<h2>세부 일정 in ${name}</h2>
														</div>
														<div class="modal-body">
											              	<div>
																<form action="<c:url value="/TravelMaker/Plan.kosmo"/>" style='margin-bottom:4px'>
													                <input hidden="true" name="origin" value="${name}" /> 
																	<input hidden="true" name="destination" value="공항,${name}" />
																	<input hidden="true" name="planner_no" value="${planner_no}" />
													                <button class="btn btn btn-success">세부일정 짜기</button>
													            </form>
													            <button class="btn btn-success">세부목록 보기</button>
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
	
	
	
	
	<script>
		$(function() {
			var date = new Date();
			var a_departure,a_arrival,a_departure_date,a_arrival_date,a_adult,a_children;
			var h_departure,h_arrival,h_departure_date,h_arrival_date,h_adult,h_children;
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
						events: [
							{
								start: '2020-01-01',
								end: '2020-07-07',
				    	        overlap: false,
				    	        color: '#ffffff'
							},
							<c:if test="${returnFromMap}">
							<c:forEach items="${city_no_name}" var="name">
							{
								title:'${name}',
								start:'2020-07-07',
				    	        overlap: false
							},
							</c:forEach>
							</c:if>
						],
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
								$('#datepicker-'+info.event.title).val(dateFiting(info.event.start.toISOString(),'s'));
								$('#datepicker1-'+info.event.title).val(dateFiting(info.event.start.toISOString(),'s'));
							}
							else{
								$('#datepicker-'+info.event.title).val(dateFiting(info.event.start.toISOString(),'s'));
								$('#datepicker1-'+info.event.title).val(dateFiting(info.event.end.toISOString(),'e'));
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
								$('#datepicker-'+info.event.title).val(dateFiting(info.event.start.toISOString(),'s'));
								$('#datepicker1-'+info.event.title).val(dateFiting(info.event.start.toISOString(),'s'));
							}
							else{
								$('#datepicker-'+info.event.title).val(dateFiting(info.event.start.toISOString(),'s'));
								$('#datepicker1-'+info.event.title).val(dateFiting(info.event.end.toISOString(),'e'));
							}
						},
						//크기 변경
						eventResize: function(info) {
						    alert('도시명:'+info.event.title+',시작 날짜:'+dateFiting(info.event.start.toISOString(),'s')+',끝 날짜:'+dateFiting(info.event.end.toISOString(),'e'));
							console.log('eventResize',info);
							if(info.event.end==null){
								$('#datepicker-'+info.event.title).val(dateFiting(info.event.start.toISOString(),'s'));
								$('#datepicker1-'+info.event.title).val(dateFiting(info.event.start.toISOString(),'s'));
							}
							else{
								$('#datepicker-'+info.event.title).val(dateFiting(info.event.start.toISOString(),'s'));
								$('#datepicker1-'+info.event.title).val(dateFiting(info.event.end.toISOString(),'e'));
							}
						    
						  }
					});
			/* $('.fc-today').appendChild('') */
			calendar.render();
			// $('#calendar').fullCalendar()
			//$('td[data-date=2020-07-05]').prop('style','background-color:red');
			$('#test').click(function(){
				//console.log(calendar.getEventSources())
				calendar.render();
			})
			$('#test2').click(function(){
				console.log(calendar)
				calendar.getEventSources()[0].refetch()
			})
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
					for(let child of evt.delegateTarget.children){
			   			child.children[0].style="";
			   		}
			   		evt.toElement.style.backgroundColor='cyan';
			   		evt.toElement.style.color='white';
				},
			  /*close : function(evt) {}  */
	   		 
			})
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
			else{
				var dates=date.split('-')
				var year=dates[0];
				var month=dates[1];
				var day=dates[2];
				day=(parseInt(day)).toString();
				return (year+'-'+month+'-'+day);
			}
		}
		function resultHotelModal(){
			$('#h_modal').modal('hide');
			function hotelC(){
				var adults = $('#adults').prop('value');
				var children = $('#children').prop('value');
				var rooms = $('#rooms').prop('value');
				var checkin = $('#datepicker').prop('value');
				var checkout = $('#datepicker1').prop('value');
				var urlStr = "https://tripadvisor1.p.rapidapi.com/hotels/list-by-latlng?lang=ko_KR&hotel_class=1%252C2%252C3&limit=10&adults="+adults+"&rooms="+rooms+"&currency=KRW&latitude="+lat+"&longitude="+lng;
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
						var placesList = document.getElementById('places');
						var img;
						for (var i = 0; i < response.data.length; i++) {
							console.log
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
			}///////noNameFunction
			$('#h_modal_result').modal('show');
		}////////////////resultModal()
		function resultAirModal(){
			$('#a_modal').modal('hide');
				console.log('ajax시작')
				var settings = {
					url : '<c:url value="/TravelMaker/AirSearch.kosmo"/>',
					type : "GET",
					//dataType: "json",
					data : {"departure" : $('#departure').prop('value'),
							"arrival":$('#arrival').prop('value'),
							"adult":$('#adult').prop('value'),
							"children":$('#children').prop('value'),
							"departureDate":$('#departureDate').prop('value'),
							"returnDate":$('#returnDate').prop('value'),
							"from":"planner"
					},
					error : function(e){
						console.log(e);
					}
				}//settings
				$.ajax(settings).done(function(response) {
					console.log(${list})
					
					/* var placesList = document.getElementById('places');
					var img;
					for (var i = 0; i < response.data.length; i++) {
						console.log
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
	*/
				});//ajax.done()
			$('#a_modal_result').modal('show');
		}
	</script>
</body>
</html>