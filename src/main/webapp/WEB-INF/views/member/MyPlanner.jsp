<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false" contentType="text/html; charset=UTF-8"%>

<style>
.destination_image{
	height: 261.37px;
	width: 360px;
}
.planner_name{
	color:black;
}

</style>
<script type="text/javascript"
   src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>

function deleteFunc(num){
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

function successAjaxDelete(data,num){
	console.log('data:',data,',num:',num)
	if(data=="삭제 성공"){
		alert(num+'번 planner가 삭제되었습니다')
		$('#'+num).html('');
		$('#cities').html('');
	}
	
}

function detail(num){
	
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
	  var offset=$('#destinations').offset();
	  $('html, body').animate({scrollTop : offset.top}, 400);
	  
}////detail


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
	 tableString+="<div class='destination item'>";
	 tableString+="<div class='destination_image'>";
	 tableString+="<img src='/travelmaker"+city.img+"' alt=''>";
	 tableString+="</div><div class='destination_content'>";
	 tableString+="<div class='destination_title'><a href='<c:url value='/TravelMaker/Plan.kosmo?cities_no="+city.cities_no+"&origin="+city.name+"&planner_no="+city.planner_no+"'/>'>";
	 tableString+=city.name;
	 tableString+="</a></div><div class='destination_subtitle'><p>";
	 tableString+=city.intro;
	 tableString+="</p></div><div class='destination_price'>일정:"+city.cities_date+"</div></div></div>"
	 
	})
	$('#cities').html(tableString);
	fitting()
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
							<div class="col-lg-4 intro_col" id="${planner.planner_no}" style="margin-bottom:10px;background-color:#e6f4fa;border-radius:25px;">
								<div class="intro_item d-flex flex-row align-items-end justify-content-start">
									<div class="intro_content">
										<div>
											<h3 style="text-align:center;color:#190b05" class="planner_name">제목:${planner.planner_name}</h3>
										</div>
										<div class="intro_title">
											<div style="background-color:#eee6c4" class="btn" onclick="detail(${planner.planner_no})">상세 보기</div>
											<div class="btn btn-danger" onclick="deleteFunc(${planner.planner_no})">삭제 하기</div>
											<div style="background-color:#ece6cc" id="payment" class="btn" onclick="payFees(${planner.planner_no})" >결제 하기</div>
											<div style="background-color:#f5f5dc" id="acc_allow" class="btn" onclick="acc_allow(${planner.planner_no})">동행 수락</div>
											<div style="color:#0080ff;font-size:1.5em;text-align:center;" >전체 동행자:<span id="planner_acc">${planner.planner_acc}</span>명</div>
											<div style="color:#8977ad;font-size:1.5em;text-align:center;" >수락 동행자:<span id="planner_allow">${planner.planner_allow}</span>명</div>
										</div>
										
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
					<div class="section_title"><h2 id="dt_title">선택한 도시</h2></div>
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
