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
		data:{planner_no:num.value},
		dataType:'text',
		success:function(data){successAjaxDelete(data,num.value)},
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
			data:{planner_no:num.value},
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

function payFees(num){
	  
	
	
	
	  $.ajax({
			url:'<c:url value="PayFees.kosmo"/>',
			data:{planner_no:num.value},
			dataType:'text',
			success:function(data){
				console.log(data);
				$('#'+num.value+' #payment').prop('class','btn btn-info')
				$('#'+num.value+' #payment').attr('onclick','refund(this)')
				$('#'+num.value+' #pay_label').html('호텔 환불')
			},
			error:function(request,error){
				console.log('상태코드:',request.status);
				console.log('서버로부터 받은 HTML데이타:',request.responseText);
				console.log('에러:',error);
			}
			
		});

      var IMP = window.IMP; 
      IMP.init('imp52792989');
      IMP.request_pay({
         pg : 'inicis', 
         pay_method : 'card',
         merchant_uid : 'merchant_' + new Date().getTime(),
         name : '김포-부산행:제주도닷컴구매',
         amount : 100,
         //가격
         buyer_email : 'wkddustnzz@Naver.com',
         buyer_name : '트러블메이커',
         buyer_tel : '010-9908-7545',
         buyer_addr : '가산디지털단지역',
         buyer_postcode : '123-456',
         m_redirect_url : 'https://www.yourdomain.com/payments/complete'
      }, function(rsp) {
         console.log(rsp);
         if (rsp.success) {
            var msg = rsp.paid_amount+ '원 결제가 완료되었습니다.';
         } else {
            var msg = '결제에 실패하였습니다.';
            msg += '에러내용 : ' + rsp.error_msg;
         }
         alert(msg);
      });
	
}
function refund(num){
	$('#'+num.value+' #payment').prop('class','btn btn-danger')
	$('#'+num.value+' #payment').attr('onclick','payFees(this)')
	$('#'+num.value+' #pay_label').html('호텔 결제')
}

function fnMove(data){
	
	 var offset = $("#div" + seq).offset();
}


function successAjaxDetail(data){
	console.log('data',data);
	 var tableString="";
	 var cities=document.getElementById('cities');
	 
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
	var size=$('#cities > div').length;
	console.log('size',size);
	$('#cities img').css({width:'360px',height:'261.37px'})
	var j=0;
	for(var i=1;i<=size;i++){
		switch(j){
		case 0:
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
		case 1:
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
		default :
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
							<div class="col-lg-4 intro_col" id="${planner.planner_no}" style="margin-bottom:30px">
								<div class="intro_item d-flex flex-row align-items-end justify-content-start">
									<div class="intro_content">
										<div>
											<h3 class="planner_name">${planner.planner_name}</h3>
										</div>
										<div class="intro_title">
											<label>상세 보기</label>
											<input name="detail" class="btn btn-info" onclick="detail(this)" value="${planner.planner_no}" />
											<label>삭제 하기</label>
											<input name="delete" class="btn btn-danger" onclick="deleteFunc(this)" value="${planner.planner_no}" />
											<label id="pay_label">호텔 결제</label>
											<input id="payment" name="payment" class="btn btn-danger" onclick="payFees(this)" value="${planner.planner_no}" />
										</div>
										<div class="intro_subtitle">
											<p <c:if test="${planner.planner_acc gt 0}">style="color:red;font-size:2em;"</c:if> >동행자 수:${planner.planner_acc}명</p>
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
					<div class="section_title"><h2>선택한 도시</h2></div>
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
								<div class="destination_title"><a href="destinations.html">Bali</a></div>
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
								<div class="destination_title"><a href="destinations.html">Indonesia</a></div>
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
								<div class="destination_title"><a href="destinations.html">Mykonos</a></div>
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
