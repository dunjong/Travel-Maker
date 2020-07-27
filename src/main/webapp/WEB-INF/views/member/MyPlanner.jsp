<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false" contentType="text/html; charset=UTF-8"%>

<style>
.destination_image{
	height: 261.37px;
	width: 360px;
}

</style>
<script type="text/javascript"
   src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<link rel="stylesheet"
	href="<c:url value='/plugins/cal_plugins/fontawesome-free/css/all.min.css'/>">
<script>

function deleteFunc(num){
	if(confirm('정말로'+num+'번 일정을 삭제하시겠습니까?')){
	
		$.ajax({
			url:'<c:url value="MyPlannerDelete.kosmo"/>',
			data:{planner_no:num},
			dataType:'text',
			success:function(data){successAjaxDelete(data,num)},
			error:function(request,error){
				console.log('상태코드:',request.status);
				console.log('서버로부터 받은 HTML데이타:',request.responseText);
				console.log('에러:',error);
			}
			
		});
	
	}
}

function successAjaxDelete(data,num){
	console.log('data:',data,',num:',num)
	if(data=="삭제 성공"){
		alert(num+'번 planner가 삭제되었습니다')
		$('#'+num).attr('style','background-color:white').html('');
		$('#cities').html('');
	}
	
}

function detail(num){
	/*
	  $.ajax({
			url:'<c:url value="MyPlannerDetails.kosmo"/>',
			data:{planner_no:num},
			dataType:'json',
			success:function(data){successAjaxDetail(data)},
			error:function(request,error){
				console.log('상태코드:',request.status);
				console.log('서버로부터 받은 HTML데이타:',request.responseText);
				console.log('에러:',error);
			}
			
		});
	*/
	window.location.replace('<c:url value="Planner.kosmo?planner_no='+num+'" />')
	  var offset=$('#destinations').offset();
	  $('html, body').animate({scrollTop : offset.top}, 400);
	  
}////detail

var planner_no;
function acc_allow(num){
	
	 $.ajax({
			url:'<c:url value="MyPlannerAccUpdate.kosmo"/>',
			data:{planner_no:num},
			dataType:'json',
			success:function(data){successAjaxAccUpdate(data)},
			error:function(request,error){
				console.log('상태코드:',request.status);
				console.log('서버로부터 받은 HTML데이타:',request.responseText);
				console.log('에러:',error);
			}
			
		});
}
function successAjaxAccUpdate(data){
	console.log(data)
	 $('#dt_title').html('동행자 정보')
	var tableString="";
	$.each(data,function(index,city){
		 tableString+="<div class='destination item' style='background-color:#e6f4fa;border-radius:25px;'>";
		 tableString+="<div class='destination_content'>";
		 if(city.allow==0){
			 tableString+="<div class='btn btn-danger' id='Y"+city.acc_no+"' onclick='allow_acc(this)'>동행 수락하기</div>";
		 }
		 else{
			 tableString+="<div class='btn btn-info' id='N"+city.acc_no+"' onclick='deny_acc(this)'>동행 취소하기</div>";
		 }
		 tableString+="<div class='destination_title'><h3 style='color:black'><small style='color:#003458'>아이디: </small>"+city.user_id+"</h3><h3 style='color:black'><small style='color:#003458'>나이:</small> "+city.user_rrn+" 대</h3></div><div class='destination_subtitle'><h4 style='color:black'><small style='color:#003458'>이름: </small>";
		 tableString+=city.user_name;
		 tableString+="</h4></div><div class='destination_price'><small style='color:#003458'>성별:</small>"+city.user_gender+"</div></div></div>"
		 
		})
	$('#cities').html(tableString);
	fitting()
 	var offset=$('#destinations').offset();
	$('html, body').animate({scrollTop : offset.top}, 400);
}
function allow_acc(data){
	var acc_no=data.id;
	console.log('allow_acc_data:',acc_no);
	 $.ajax({
			url:'<c:url value="UpdateAcc.kosmo"/>',
			data:{'acc_no':acc_no.substring(1)},
			dataType:'text',
			success:function(data){alert(data);
			$('#'+acc_no).attr('class','btn btn-info').attr('onclick','deny_acc(this)').html('동행 취소하기');
			$('#planner_allow').html(parseInt($('#planner_allow').html())+1);
			
			},
			error:function(request,error){
				console.log('상태코드:',request.status);
				console.log('서버로부터 받은 HTML데이타:',request.responseText);
				console.log('에러:',error);
			}
			
		});
	
}
function deny_acc(data){
	var acc_no=data.id;
	console.log('deny_acc_data:',acc_no.substring(1));
	 $.ajax({
			url:'<c:url value="UpdateAcc.kosmo"/>',
			data:{'acc_no':acc_no.substring(1)},
			dataType:'text',
			success:function(data){alert(data);
			$('#'+acc_no).attr('class','btn btn-danger').attr('onclick','allow_acc(this)').html('동행 수락하기');
			if(parseInt($('#planner_allow').html())!=0){
				$('#planner_allow').html(parseInt($('#planner_allow').html())-1);
			}
			},
			error:function(request,error){
				console.log('상태코드:',request.status);
				console.log('서버로부터 받은 HTML데이타:',request.responseText);
				console.log('에러:',error);
			}
			
		});
}

function payFees(num){
	  
	  $.ajax({
			url:'<c:url value="PayFees.kosmo"/>',
			data:{planner_no:num},
			dataType:'json',
			success:function(data){
				console.log(data);
				
				
				successAjaxPayFee(data);
				
				
			},
			error:function(request,error){
				console.log('상태코드:',request.status);
				console.log('서버로부터 받은 HTML데이타:',request.responseText);
				console.log('에러:',error);
			}
			
		});

}

function successAjaxPayFee(data){
	 $('#dt_title').html('결제 사항')
	 var tableString="";
	 var cities=document.getElementById('cities');
	 $.each(data,function(index,city){
		 if(city.hotel_no!=undefined){
			 tableString+="<div class='destination item'>";
			 tableString+="<div class='destination_image'><img src='"+city.hotel_img+"' alt='no Image'></div>";
			 if(city.paid!='yes'){
			 	 tableString+="<div class='btn btn-info' id='h_"+city.hotel_no+"' onclick='preImport(this)'>호텔 결제하기</div>";
			 }
			 else{
				 tableString+="<div class='btn btn-danger' id='h_"+city.hotel_no+"' onclick='alertFunc(this)'>결제 완료</div>";
			 }
			 tableString+="<div class='destination_content'>";
			 tableString+="<div class='destination_title'><h4 style='color:black'>"+city.hotel_name+"</h4></div><div class='destination_subtitle'><h4>";
			 tableString+=city.hotel_price.split('-')[1].substring(2)+'원';
			 tableString+="</h4></div><div class='destination_price'>일정:"+city.hotel_in+"~"+city.hotel_out+"</div></div></div>";
		 }
		 else{
			 tableString+="<div class='destination item'>";
			 tableString+="<div class='destination_image'><img src='<c:url value='/images/travelmaker1.png'/>' alt='no Image'></div>";
			 if(city.paid!='yes'){
			 	tableString+="<div class='btn btn-warning' id='a_"+city.air_no+"' onclick='preImport(this)'>항공 결제하기</div>";
			 }
			 else{
				 tableString+="<div class='btn btn-danger' id='a_"+city.air_no+"' onclick='alertFunc(this)'>결제 완료</div>";
			 }
			 tableString+="<div class='destination_content'>";
			 tableString+="<div class='destination_title'><h4 style='color:black'>"+city.air_ddate+"</h4></div><div class='destination_subtitle'><h4>";
			 tableString+=city.air_price+'원';
			 tableString+="</h4></div><div class='destination_price'>공항:"+city.air_dep+"~"+city.air_arr+"</div></div></div>";
		 }
		})
		$('#cities').html(tableString);
	 	fitting()
	 	var offset=$('#destinations').offset();
		$('html, body').animate({scrollTop : offset.top}, 400);
}

function preImport(data){
	console.log('preImport data.id:',data.id);
	alert('id:'+data.id);
	 $.ajax({
			url:'<c:url value="getAirOrHotel.kosmo"/>',
			data:{'h_a_no':data.id},
			dataType:'json',
			success:function(data){
				console.log(data);
				Import(data);
				
			},
			error:function(request,error){
				console.log('상태코드:',request.status);
				console.log('서버로부터 받은 HTML데이타:',request.responseText);
				console.log('에러:',error);
			}
			
		});
}


function Import(data){
	 console.log('Import data:',data);
	 var IMP = window.IMP; 
     IMP.init('imp52792989');
     IMP.request_pay({
        pg : 'inicis', 
        pay_method : 'card',
        merchant_uid : 'merchant_' + new Date().getTime(),
        name : data[0].name,
        amount : 100,
        //가격
        buyer_email : 'wkddustnzz@Naver.com',
        buyer_name : data[0].user_id,
        buyer_tel : '010-9908-7545',
        buyer_addr : '가산디지털단지역',
        buyer_postcode : '123-456',
        m_redirect_url : 'https://www.yourdomain.com/payments/complete'
     }, function(rsp) {
        console.log(rsp);
        if (rsp.success) {
           PostImport(data);
           var msg = data[0].h_a_no+'의 '+rsp.paid_amount+ '원 결제가 완료되었습니다.';
        } else {
           var msg = '결제에 실패하였습니다.';
           msg += '에러내용 : ' + rsp.error_msg;
        }
        alert(msg);
     });
}

function PostImport(data){
	console.log('PostImport.data:',data[0].h_a_no)
	 $.ajax({
			url:'<c:url value="updateResOk.kosmo"/>',
			data:{'h_a_no':data[0].h_a_no},
			dataType:'text',
			success:function(data){
				console.log(data)
				
			},
			error:function(request,error){
				console.log('상태코드:',request.status);
				console.log('서버로부터 받은 HTML데이타:',request.responseText);
				console.log('에러:',error);
			}
			
		});
	$('#'+data[0].h_a_no).attr('class','btn btn-danger').attr('onclick','alertFunc(this)').html('결제 완료');
}

function alertFunc(data){
	alert('완료된 결제입니다.')
}

function fnMove(data){
	
	 var offset = $("#div" + seq).offset();
}

function fitting(){
	var size=$('#cities > div').length;
	if(size==0){
		var tableString="<h2 style='text-align:center;'>확인하실 정보가 없습니다.</h2>";
		$('#cities').html(tableString);
	}
	console.log('size',size);
	$('#cities img').css({width:'360px',height:'261.37px'})
	var j=0;
	for(var i=1;i<=size;i++){
		switch(j){
		case 0:$('#destinations').css({height:'846.39px'});
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
		case 1:$('#destinations').css({height:'1261.39px'});
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
		default :$('#destinations').css({height:'1676.39px'});
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
}

function successAjaxDetail(data){
	console.log('data',data);
	 var tableString="";
	 var cities=document.getElementById('cities');
	 $('#dt_title').html('선택한 도시')
	 $.each(data,function(index,city){
	 tableString+="<div class='destination item' style='background:#e6f4fa;height:500px;'>";
	 tableString+="<div class='destination_image' >";
	 tableString+="<img style='border-radius:24px;' src='/travelmaker"+city.img+"' alt=''>";
	 tableString+="</div><div class='destination_content'>";
	 tableString+="<div class='destination_title' style='text-align:center;'><a class='btn btn-warning' style='border-radius:12px;' href='<c:url value='/TravelMaker/Plan.kosmo?cities_no="+city.cities_no+"&origin="+city.name+"&planner_no="+city.planner_no+"'/>'>";
	 tableString+=city.name;
	 tableString+="</a></div><div class='destination_subtitle'>";
	 tableString+="<p style='color:black;font-size:1.2em;'>"+city.intro;+"</p>"
	 tableString+="</div><div class='destination_price'>일정:"+city.cities_date+"</div></div></div>"
	 
	})
	$('#cities').html(tableString);
	fitting()
}

function ToPlannerView(data){
	window.location.href='<c:url value="/TravelMaker/PlannerView.kosmo?planner_no='+data+'"/>'
	
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
						<c:forEach items="${list}" var="planner">
							<div class="col-lg-3" id="${planner.planner_no}" style="margin:20px;margin-bottom:100px; background: #f5f5f5; padding: 20px; border: #e0e0e0 solid 1px;">
								<div class="row">
									<div class="col-lg-12">
										<button class="btn" type="button" style="width:100%; background:#80deea; color:white; font-weight: bold; margin-bottom: -6px;">
										
										<span class="badge" style="margin-right:5px; font-size: 1.2em;">${planner.planner_no}</span>
										  ${planner.planner_name}
										</button>	
										<button class="btn" type="button" style="width:100%; background:#80deea; color:white; font-weight: bold;">예산: ${planner.total_count} 원</button>
									</div>
									<div class="col-lg-6" style="text-align:center;">
										  <button type="button" style="color:gray; font-size:0.9em; font-weight:bold; padding-left:31px; margin-right:-13px; margin-bottom:-8px;" class="btn" onclick="detail(${planner.planner_no})">수정하기</button>
										  <button type="button" style="color:gray; font-size:0.9em; font-weight:bold; padding-left:31px; margin-right:-13px;" class="btn" onclick='ToPlannerView(${planner.planner_no})'>간단보기</button>
									
									</div>	
									<div class="col-lg-6" style="text-align:center;">	
										  <button type="button" style="font-weight:bold; border-right:12px; font-size:0.9em; padding-right:29px; margin-left:-12px; margin-bottom:-8px; color:gray; " class="btn" onclick="payFees(${planner.planner_no})" id="payment" >결제하기</button>
										  <button type="button" style="font-weight:bold; margin-left:-12px; font-size:0.9em; padding-right:29px; color:gray; " class="btn" onclick="acc_allow(${planner.planner_no})"id="acc_allow" >동행수락</button>
										
									</div>	
									<div class="col-lg-12" style="text-align:center;">	
										
										<button type="button" class="btn btn-danger"  style="width:100%; background:#80deea; color:white; font-weight: bold;"  onclick="deleteFunc(${planner.planner_no})">삭제 하기</button>
									</div>	
									<div class="col-lg-12" >		  
									      <button type="button" class="btn dropdown-toggle" data-toggle="dropdown" aria-expanded="false" style="width:100%; background:#80deea; color:white;">
									        	동행자 보기
									        <span class="caret"></span>
									      </button>
									      <ul class="dropdown-menu" style="margin-left:45px;"role="menu">
									        <li><div style="color:#0080ff;font-size:1.5em;text-align:center;" >전체 동행자:<span id="planner_acc">${planner.planner_acc}</span>명</div></li>
									        <li><div style="color:#8977ad;font-size:1.5em;text-align:center;" >수락 동행자:<span id="planner_allow">${planner.planner_allow}</span>명</div></li>
									        <li><div class="btn btn-info"   onclick="chatRoom(${planner.planner_no})" >동행자 채팅방</div></li>
									        <li><div class="btn btn-danger" onclick="deleteChat(${planner.planner_no})">채팅창 비우기</div></li>
									      </ul>
									</div>  
								</div>
							</div>
						</c:forEach>
						<c:forEach items="${acc_planner}" var="acc_planner">
							<div class="col-lg-3" id="${acc_planner.planner_no}" style="margin:20px;margin-bottom:100px;background-color:#e0f7fa;">
								<div class="row">
									<div class="col-lg-12">
										<button class="btn" type="button" style="width:100%; background:#80deea; color:white; font-weight: bold;">
										<span class="badge" style="margin-right:5px; font-size: 1.2em;">${acc_planner.planner_no}</span>
										  ${acc_planner.planner_name}
										</button>	
										<button class="btn" type="button" style="width:100%; background:#80deea; color:white; font-weight: bold;">예산: ${acc_planner.total_count} 원</button>
									</div>
									<div class="col-lg-12" style="text-align:center;">
										  <button class="btn" type="button" style="background:#2196f3; color:white;" onclick='ToPlannerView(${acc_planner.planner_no})'>간단 보기</button>
									</div>		
									<div class="col-lg-12" >		  
									      <button type="button" class="btn dropdown-toggle" data-toggle="dropdown" aria-expanded="false" style="width:100%; background:#80deea; color:white;">
									        	동행자 보기
									        <span class="caret"></span>
									      </button>
									      <ul class="dropdown-menu" style="margin-left:45px;"role="menu">
									        <li><div style="color:#0080ff;font-size:1.5em;text-align:center;" >전체 동행자:<span id="planner_acc">${acc_planner.planner_acc}</span>명</div></li>
									        <li><div style="color:#8977ad;font-size:1.5em;text-align:center;" >수락 동행자:<span id="planner_allow">${acc_planner.planner_allow}</span>명</div></li>
									        <li><div class="btn btn-info"  onclick="chatRoom(${acc_planner.planner_no})" >동행자 채팅방</div></li>
									      </ul>
									</div>  
								</div>
							</div>
						</c:forEach>
					</div><!-- row -->
					
					
				</div>
			</div>
		</div>
	</div>
	
	
	
	
</div>



<div class="destinations" id="destinations">
		<div class="container">
			<div class="row">
				<div class="col text-center">
					<div class="section_subtitle">Travel Maker</div>
					<div class="section_title"><h2 id="dt_title">정보 보기 창</h2></div>
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
								<div class="destination_title"><a href="#">Bali</a></div>
								<div class="destination_subtitle"><p>꿈의 섬 발리로 바로 떠나보세요</p></div>
								<div class="destination_price">From $699</div>
							</div>
						</div>

						<!-- Destination -->
						<div class="destination item">
							<div class="destination_image">
								<img src="<c:url value='/images/destination_2.jpg'/>" alt="">
							</div>
							<div class="destination_content">
								<div class="destination_title"><a href="#">Indonesia</a></div>
								<div class="destination_subtitle"><p>인도는 지금 몇시야?인도네시아로 떠나보세요</p></div>
								<div class="destination_price">From $444</div>
							</div>
						</div>

						<!-- Destination -->
						<div class="destination item">
							<div class="destination_image">
								<img src="<c:url value='/images/destination_6.jpg'/>" alt="">
							</div>
							<div class="destination_content">
								<div class="destination_title"><a href="#">Mykonos</a></div>
								<div class="destination_subtitle"><p>Nulla pretium tincidunt felis, nec.</p></div>
								<div class="destination_price">From $679</div>
							</div>
						</div>
						<!-- Destination -->
						

					</div>
				</div>
			</div>
		</div>
	</div>
<script>

function deleteChat(num){
	if(confirm('정말 채팅창을 비우시겠습니까?')){
		$.ajax({
			url:'<c:url value="DeleteChat.kosmo"/>',
			data:{'planner_no':num},
			success:function(data){
				
				console.log('삭제 성공');
			},
			error:function(request,error){
				console.log('상태코드:',request.status);
				console.log('서버로부터 받은 HTML데이타:',request.responseText);
				console.log('에러:',error);
			}
			
		});
	}
	
}

function chatRoom(num){
	//window.location.replace('<c:url value="ChatRoom.kosmo?planner_no='+num+'" />')
	$('#chat-modal').modal('show');
	planner_no=num;
	resetChat()
	CallChat(num);
	
	setTimeout(function(){
		$("#chat-modal ul").scrollTop($("#chat-modal ul").height());
		console.log('\$("#chat-modal ul").height():',$("#chat-modal ul").height());
	},1000);
	
	timerId = setInterval(setIntervalForChat, 4000);

	
}

function setIntervalForChat(){
	resetChat()
	CallChat(planner_no);
	
}

function chatRoomInterval(num){
	insertChat("me","여기까지 읽으셨습니다",0,"")
}
	        
function CallChat(num){
	$.ajax({
		url:'<c:url value="CallChat.kosmo"/>',
		data:{'planner_no':num},
		dataType:'json',
		success:function(data){
			
			successChatCall(data);
		},
		error:function(request,error){
			console.log('상태코드:',request.status);
			console.log('서버로부터 받은 HTML데이타:',request.responseText);
			console.log('에러:',error);
		}
		
	});
}
function PutChat(text){
	$.ajax({
		url:'<c:url value="PutChat.kosmo"/>',
		data:{
			'planner_no':planner_no,
			'chat_text':text,
			'user_id':'${user_id}'
		},
		dataType:'text',
		success:function(data){
			successChatPut(data);
		},
		error:function(request,error){
			console.log('상태코드:',request.status);
			console.log('서버로부터 받은 HTML데이타:',request.responseText);
			console.log('에러:',error);
		}
		
	});
}
function successChatCall(data){
	$.each(data,function(key,value){
		if(value.user_id=='${user_id}'){
			insertChat("me",value.chat_text,value.user_id,value.chat_time);     
		}
		else{
			insertChat("you",value.chat_text,value.user_id,value.chat_time);     
		}
	})
	$("#chat-modal ul").scrollTop($("#chat-modal ul").height());
	console.log('\$("#chat-modal ul").height():',$("#chat-modal ul").height())
}
function successChatPut(data){
	console.log(data);
	if(data.includes('성공')){
		resetChat()
		CallChat(planner_no);
		
	}
}
	

$(function(){
	$(".mytext").on("keyup", function(e){
	    if (e.which == 13){
	    	if (text !== ""){
	    		var text = $(this).val(); 
		        PutChat(text);   
	            $(this).val('');
	        }
	    }
	});

	$('body > div > div > div:nth-child(2) > span').click(function(){
	    $(".mytext").trigger({type: 'keydown', which: 13, keyCode: 13});
	})

	//-- Clear Chat
	resetChat();

	//-- Print Messages
	//insertChat("me", "Hello Tom...", 0);  
	//insertChat("you", "Hi, Pablo", 1500);
	/*
	insertChat("me", "What would you like to talk about today?", 3500);
	insertChat("you", "Tell me a joke",7000);
	insertChat("me", "Spaceman: Computer! Computer! Do we bring battery?!", 9500);
	insertChat("you", "LOL", 12000);
	*/
})
	//-- No use time. It is a javaScript effect.
function insertChat(who, text,id,chat_time){
	var me = {};
	me.avatar = "<c:url value='/images/foodIcon.png'/>";

	var you = {};
	you.avatar = "<c:url value='/images/spotIcon.png'/>";
    
    var control = "";
    var date = formatAMPM(new Date());
    
    if (who == "me"){
        control = '<li style="width:100%;margin:5px;">' +
                        '<div class="msj macro">' +
                        '<br><p>'+id+'</p><div class="avatar"><img class="img-circle" style="width:100%;" src="'+ me.avatar +'" /></div>' +
                            '<div class="text text-l">' +
                                '<p>'+ text +'</p>' +
                                '<p><small>'+chat_time+'</small></p>' +
                            '</div>' +
                        '</div>' +
                    '</li>';                    
    }else{
        control = '<li style="width:100%;margin:5px;">' +
                        '<div class="msj-rta macro">' +
                            '<div class="text text-r">' +
                                '<p>'+text+'</p>' +
                                '<p><small>'+chat_time+'</small></p>' +
                            '</div>' +
                        '<div class="avatar" style="padding:0px 0px 0px 10px !important"><img class="img-circle" style="width:100%;" src="'+you.avatar+'" /></div><br><p>'+id+'</p>' +                                
                  '</li>';
    }
    setTimeout(
        function(){                        
            $("#chat-modal ul").append(control).scrollTop($("#chat-modal ul").prop('scrollHeight'));
        }, 0);
    
}

function enter(){
   var text = $('.mytext').val();
   if (text !== ""){
	   PutChat(text);  
       $('.mytext').val('');
    }
}
function resetChat(){
    $("#chat-modal ul").empty();
}
function formatAMPM(date) {
    var hours = date.getHours();
    var minutes = date.getMinutes();
    var ampm = hours >= 12 ? 'PM' : 'AM';
    hours = hours % 12;
    hours = hours ? hours : 12; // the hour '0' should be '12'
    minutes = minutes < 10 ? '0'+minutes : minutes;
    var strTime = hours + ':' + minutes + ' ' + ampm;
    return strTime;
}    
function StopClock(){
	 if(timerId != null) {
	        clearInterval(timerId);
	    }
}

</script>
<style type="text/css">
.mytext{
    border:0;padding:10px;background:whitesmoke;
}
.text{
    width:75%;display:flex;flex-direction:column;
}
.text > p:first-of-type{
    width:100%;margin-top:0;margin-bottom:auto;line-height: 13px;font-size: 12px;
}
.text > p:last-of-type{
    width:100%;text-align:right;color:silver;margin-bottom:-7px;margin-top:auto;
}
.text-l{
    float:left;padding-right:10px;
}        
.text-r{
    float:right;padding-left:10px;
}
.avatar{
    display:flex;
    justify-content:center;
    align-items:center;
    width:25%;
    float:left;
    padding-right:10px;
}
.macro{
    margin-top:5px;width:85%;border-radius:5px;padding:5px;display:flex;
}
.msj-rta{
    float:right;background:whitesmoke;
}
.msj{
    float:left;background:white;
}
.frame{
    background:#e0e0de;
    height:450px;
    overflow:hidden;
    padding:0;
}
.frame > div:last-of-type{
    position:absolute;bottom:0;width:100%;display:flex;
}
#chat-modal span{
    background: whitesmoke;padding: 10px;font-size: 21px;border-radius: 50%;
}
#chat-modal div.msj-rta.macro{
    margin:auto;margin-left:1%;
}
#chat-modal ul {
    width:100%;
    list-style-type: none;
    padding:18px;
    position:absolute;
    bottom:47px;
    display:flex;
    flex-direction: column;
    top:0;
    overflow-y:scroll;
}
.msj:before{
    width: 0;
    height: 0;
    content:"";
    top:-5px;
    left:-14px;
    position:relative;
    border-style: solid;
    border-width: 0 13px 13px 0;
    border-color: transparent #ffffff transparent transparent;            
}
.msj-rta:after{
    width: 0;
    height: 0;
    content:"";
    top:-5px;
    left:14px;
    position:relative;
    border-style: solid;
    border-width: 13px 13px 0 0;
    border-color: whitesmoke transparent transparent transparent;           
}  
.mytext:focus{
    outline: none;
}        
::-webkit-input-placeholder { /* Chrome/Opera/Safari */
    color: #d4d4d4;
}
::-moz-placeholder { /* Firefox 19+ */
    color: #d4d4d4;
}
:-ms-input-placeholder { /* IE 10+ */
    color: #d4d4d4;
}
:-moz-placeholder { /* Firefox 18- */
    color: #d4d4d4;
}  

</style>	
	
<div class="modal fade" id="chat-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static">
	  <div class="modal-dialog modal-notify modal-info" role="document">
	    <div class="modal-content">
	    	<div class="modal-header">
	         <p class="heading lead">채팅</p>	         		
	         <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	           <span aria-hidden="true" class="white-text" onclick="StopClock()" style="background:blue">&times;</span>
	         </button>
	       </div>
	    	<div class="modal-body" >	   		
	    		<div class="col-sm-12 frame">
		            <ul></ul>
		            <div>
		                <div class="msj-rta macro">                        
		                    <div class="text text-r" style="background:whitesmoke !important">
		                        <input class="mytext" placeholder="Type a message"/>
		                    </div> 
		
		                </div>
		                <div style="padding:10px;">
		                   <span><i class="fa fa-upload" aria-hidden="true" onclick="enter()"></i></span>
		                </div>                
		            </div>
		        </div>    
	    	</div>
	    </div>
	  </div>
	</div>