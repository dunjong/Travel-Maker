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
					<div class="row" >
						
						<div class="col-md-12" style="text-align: center;margin-top:50px;">
							<form action="<c:url value='/' />">
								<div class="row">
									<div class="col-md-1">
									
									</div>
									<div class="input-group input-group-lg col-md-7" style="text-align: center;">
										<div class="form-control"  id="planner_name">${planner_name}</div>
										<input hidden="true" type="text" name="planner_no" value="${planner_no}">
									</div>
									<div class="col-md-1">
									
									</div>
									<div class="col-md-3">
										<button class="btn btn-info" style="width:100%" >메인으로</button>
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
											<h4 class="card-title">호텔 확인</h4>
										</div>
										<div class="card-body">	
											<c:forEach items="${city_no_name}" var="name">
														<button id='h_${name.key}' class="btn btn-info" type="button" data-toggle="modal" data-target="#h_modal_${name.key}" style="width:100%;margin-bottom:4px">
															${name.key}에서 예약된 호텔 확인
														</button>
														
														<div class="modal fade" id="h_modal_${name.key}">
															<div class="modal-dialog">
																<div class="modal-content">
																	<div class="modal-header bg-info">
																		<h2>${name.key}호텔</h2>
																		
																	</div>
																	<div class="modal-body">
																	<h4 id="h_modal_hotelName_${name.key}"></h4>
														              	
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
											<h4 class="card-title">도시 세부일정</h4>
										</div>
										<div class="card-body">	
											<c:forEach items="${city_no_name}" var="name">
												
														<button id="plan_btn_${name.key}" class="btn btn-info" type="button" data-toggle="modal" data-target="#d-modal-${name.key}" style="width:100%;margin-bottom:4px">
															${name.key}에 대한 세부 일정 확인
														</button>
														<div class="modal fade" id="d-modal-${name.key}">
															<div class="modal-dialog">
																<div class="modal-content">
																	<div class="modal-header bg-info">
																		<h2>일정 in ${name.key}</h2>
																	</div>
																	<div class="modal-body">
														              	<div>
																			
																            <button class="btn btn-success" onclick="callPlanDetails(${name.value},'${name.key}')" >목록 보기</button>
																            <div class="well" id="planDetail_${name.key}">
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
	<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBMkei418dalW2Ho3I-ovwq0aMKWhUlwUA&libraries=places"></script>
	
	
	
	<script>
		
		
		
		
		var lat,lng;//호텔용
		$(function() {
			<c:forEach items="${city_hotel}" var="check" >
			console.log('${check}')
			if('${check.value}'=='1')
				$('#h_${check.key}').prop('class','btn btn-danger').html( '${check.key} 등록 호텔 확인하기');
				
			</c:forEach>
			
			<c:forEach items="${city_hotel_name}" var="hotelName">
				$('#h_modal_hotelName_${hotelName.key}').html('예약된 호텔:${hotelName.value}');
			</c:forEach>
			<c:forEach items="${city_plan_no}" var="plan_check" >
				if('${plan_check.value ==1}')
				$('#plan_btn_${plan_check.key}').prop('class','btn btn-danger').html('${plan_check.key}에 대한 세부 일정 확인')
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
						editable : false,
						droppable : false // this allows things to be dropped onto the calendar !!!
						//카드에서 드랍시 한번만 1
						
						//카드에서 드랍시 한번만 2
					
						
						
					});
			/* $('.fc-today').appendChild('') */
			calendar.render();
			// $('#calendar').fullCalendar()
			//$('td[data-date=2020-07-05]').prop('style','background-color:red');
			
			
			
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
						
						
						var div=document.createElement('div');
						div.textContent=index+'일차: '+value;
						planDetail.appendChild(div)
						
					});
					
				},
				error:function(request,error){
					console.log('상태코드:',request.status);
					console.log('서버로부터 받은 HTML데이타:',request.responseText);
					console.log('에러:',error);
				}
				
			});
		}
		function back(){
			console.log('back으로 들어옴')
			window.history.go(-5);
		}
	
	</script>
	
</body>
</html>