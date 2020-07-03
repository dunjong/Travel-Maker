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
										<div class="card">
											<div class="card-header">
												<h4 class="card-title">일정 카드</h4>
											</div>
											<div class="card-body">
												<!-- the events -->
												<div id="external-events">
													<c:forEach items="${city_no_name}" var="name">
														<div class="external-event bg-info">${name}</div>
													</c:forEach>
												</div>
											</div>
											
											<!-- /.card-body -->
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
											<button class="btn-info" type="button" data-toggle="modal" data-target="#h-modal-${name}" style="width:100%">
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
															<div class="row">
																<div class="col-md-10">
																	<input id="autocomplete-${name}" placeholder="장소" required="required" value="${name}">
																	<input type="number" id="adults-${name}"  placeholder="성인" required="required">
																	<input type="text" id="datepicker-${name}" placeholder="check in" required="required"> 
																	<input type="number" id="children-${name}" placeholder="미성년">
																	<input type="text" id="datepicker1-${name}" placeholder="check out" required="required">
																	<input type="number" id="rooms-${name}" placeholder="방 갯수" required="required">
																</div>
																<div class="col-md-2">
																<button class="btn-info" id="hotelSubmit-${name}" >검색</button>
																</div>
															</div>
														</form>
													</div>
										            </div>
													<div class="modal-footer justify-content-between bg-info">
										              <button type="button" class="btn btn-outline-light" data-dismiss="modal">Close</button>
										              <button type="button" class="btn btn-outline-light">Save changes</button>
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
											<button class="btn-info" type="button" data-toggle="modal" data-target="#a-modal" style="width:100%">항공권 검색</button>
											<div class="modal fade" id="a-modal">
											<div class="modal-dialog">
												<div class="modal-content">
												<div class="modal-header bg-info">
												<h2>항공권 검색</h2>
												</div>
												<div class="modal-body">
									              <div>
													<form action="#">
														<div class="row">
															<div class="col-md-10">
																<input type="text" name="departure" id="departure" placeholder="출발지" required="required" data-placement="bottom"> 
																<input type="text" name="arrival" id="arrival" placeholder="도착지" required="required" data-placement="bottom"> 
																<input type="text" name="departureDate" id="departureDate" placeholder="가는날" required="required"> 
																<input type="text" name="returnDate" id="returnDate"  placeholder="오는날" required="required"> 
																<input type="number" name="adult" id="adult" placeholder="성인" required="required"> 
																<input type="number" name="children" id="children" placeholder="어린이">
															</div>
															<div class="col-md-2">
															<button class="btn-info" id="airSubmit" >검색</button>
															</div>
														</div>
													</form>
												 </div>
										        </div>
												<div class="modal-footer justify-content-between bg-info">
									              <button type="button" class="btn btn-outline-light" data-dismiss="modal">Close</button>
									              <button type="button" class="btn btn-outline-light">Save changes</button>
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
											
											<c:forEach items="${city_no_name}" var="name">
											<div class="card-body">	
												<button class="btn-info" type="button" data-toggle="modal" data-target="#d-modal-${name}" style="width:100%">
												${name}에 대한 세부 일정 짜기
											</button>
											
											<div class="modal fade" id="d-modal-${name}">
												<div class="modal-dialog">
													<div class="modal-content">
													<div class="modal-header bg-info">
													<h2>세부 일정</h2>
													</div>
													<div class="modal-body">
									              	<div>
														<form action="<c:url value="/TravelMaker/Plan.kosmo"/>">
											                <input hidden="true" name="origin" value="${name}" /> 
															<input hidden="true" name="destination" value="공항,${name}" />
											                <button class="btn-success">세부일정 짜기</button>
											            </form>
											            <button class="btn-success">세부목록 보기</button>
													</div>
										            </div>
													<div class="modal-footer justify-content-between bg-info">
										              <button type="button" class="btn btn-outline-light" data-dismiss="modal">Close</button>
										            </div>
													</div>
												</div>
											</div>
												 
											</div>	
											</c:forEach>
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
	var date = new Date();
		$(function() {

			/* initialize the external events
			 -----------------------------------------------------------------*/
			function ini_events(ele) {
				ele.each(function() {
					// create an Event Object (https://fullcalendar.io/docs/event-object)
					// it doesn't need to have a start or end
					var eventObject = {
						title : $.trim($(this).text())
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
			var checkbox = document.getElementById('drop-remove');
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
						plugins : [ 'bootstrap', 'interaction', 'dayGrid',
								'timeGrid' ],
						header : {
							left : 'prev,next today',
							center : 'title',
							right : 'dayGridMonth,timeGridWeek,timeGridDay'
						},
						'themeSystem' : 'bootstrap',

						editable : true,
						droppable : true, // this allows things to be dropped onto the calendar !!!
						//최초 받는 드롭
						drop : function(info) {
							//아이템 드랍시 무조건 삭제
							// is the "remove after drop" checkbox checked?
							//if (checkbox.checked) {
							// if so, remove the element from the "Draggable Events" list
							info.draggedEl.parentNode.removeChild(info.draggedEl);
							console.log('drop',info);
							
							
							//}
						},
						//최초 받는 드롭
						eventReceive:function(info){
							alert('도시명:'+info.event.title+',시작 날짜:'+dateFiting(info.event.start.toISOString(),'s'));
							console.log('eventReceive',info);
							//console.log($('.fc-event-container')) 확인용
							if(date>=info.event.start){
								if (!confirm("과거에 예약하는 병신이세요?")) {
									//info.revert(); V5에만 있음
									//그래서 에러를 발생시켜서 함수 실행 안되게 해야할듯..
								    }
							}
							if(info.event.end==null){
								$('#datepicker-'+info.event.title).val(dateFiting(info.event.start.toISOString(),'s'));
							}
							else{
								$('#datepicker-'+info.event.title).val(dateFiting(info.event.start.toISOString(),'s'));
								$('#datepicker1-'+info.event.title).val(dateFiting(info.event.end.toISOString(),'e'));
							}
							
						},
						//옮기는 드롭
						eventDrop: function(info) {
							if(info.event.end==null){
								alert('도시명:'+info.event.title+',시작 날짜:'+dateFiting(info.event.start.toISOString(),'s'));
							}
							else{
								alert('도시명:'+info.event.title+',시작 날짜:'+dateFiting(info.event.start.toISOString(),'s')+',끝날짜:'+dateFiting(info.event.end.toISOString(),'e'));
							}
							console.log('eventDrop',info);
							if(date>=info.event.start){
								if (!confirm("과거에 예약하는 병신이세요?")) {
								      info.revert();
								    }
								else{
									alert('병신이어도 이건 아니에요..')
									info.revert();
								}
							}
							if(info.event.end==null){
								$('#datepicker-'+info.event.title).val(dateFiting(info.event.start.toISOString(),'s'));
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
	</script>
</body>
</html>