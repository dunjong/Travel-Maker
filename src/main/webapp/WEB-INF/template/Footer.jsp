<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
  df-messenger {
   --df-messenger-bot-message: #878fac;
   --df-messenger-button-titlebar-color: #df9b56;
   --df-messenger-chat-background-color: #fafafa;
   --df-messenger-font-color: white;
   --df-messenger-send-icon: #878fac;
   --df-messenger-user-message: #479b3d;
  }
</style>
<footer class="footer">
	<div class="parallax_background parallax-window" data-parallax="scroll"
		data-image-src="<c:url value='/images/footer_1.jpg'/>"
		data-speed="0.8"></div>
	<div class="container">
		<div class="row">
			<div class="col">
				<div class="newsletter">
					<div class="newsletter_title_container text-center">
						<div class="newsletter_title">
							Never Mind,Just Do It!</div>
					
					</div>
					<div class="newsletter_form_container">
						<form action="#"
							class="newsletter_form d-flex flex-md-row flex-column align-items-start justify-content-between"
							id="newsletter_form"></form>
					</div>
				</div>
			</div>
		</div>
		<div class="row footer_contact_row">
			<div class="col-xl-10 offset-xl-1">
				<div class="row">

					<!-- Footer Contact Item -->
					<div class="col-xl-4 footer_contact_col">
						<div
							class="footer_contact_item d-flex flex-column align-items-center justify-content-start text-center">
							<div class="footer_contact_icon">
								<img src="<c:url value='/images/sign.svg'/>" alt="">
							</div>
							<div class="footer_contact_title">고객 센터</div>
							<div class="footer_contact_list">
								<ul>
									<li>Mobile:010-4488-3820</li>
								</ul>
							</div>
						</div>
					</div>

					<!-- Footer Contact Item -->
					<div class="col-xl-4 footer_contact_col">
						<div
							class="footer_contact_item d-flex flex-column align-items-center justify-content-start text-center">
							<div class="footer_contact_icon">
								<img src="<c:url value='/images/trekking.svg'/>" alt="">
							</div>
							<div class="footer_contact_title">come & drop by</div>
							<div class="footer_contact_list">
								<ul style="max-width: 190px">
									<li>서울특별시 금천구 가산동 426-5 월드 메르디앙 벤처 센터 2 차 410 호</li>
								</ul>
							</div>
						</div>
					</div>

					<!-- Footer Contact Item -->
					<div class="col-xl-4 footer_contact_col">
						<div
							class="footer_contact_item d-flex flex-column align-items-center justify-content-start text-center">
							<div class="footer_contact_icon">
								<img src="<c:url value='/images/around.svg'/>" alt="">
							</div>
							<div class="footer_contact_title">send us a message</div>
							<div class="footer_contact_list">
								<ul>
									<li>travel@naver.com</li>
									<li>jhpark9711@naver.com</li>
								</ul>
							</div>
						</div>
					</div>
					<div style="list-style-position: center"
						class="d-flex flex-md-row flex-column align-items-start justify-content-center">
						<div>상호명ㆍ(주)트래블메이커스|대표ㆍ박종현|개인정보보호책임자ㆍ임동민|주소ㆍ서울특별시 금천구 가산동
							426-5 월드 메르디앙 벤처 센터 2 차 410 호|이메일문의ㆍtravelmaker@naver.com|제휴
							이메일문의ㆍtravelmaker@naver.com 트래블메이커는 통신판매중개자이며 통신판매의 당사자가 아닙니다.
							따라서 상품·거래정보 및 거래에 대하여 책임을 지지 않습니다.</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col text-center">
		<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
		Copyright &copy;
		<script>
			document.write(new Date().getFullYear());
		</script>
		All rights reserved | This template is made with <i
			class="fa fa-heart-o" aria-hidden="true"></i> by <a
			href="https://colorlib.com" target="_blank">Colorlib</a>
		<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
	</div>
	
	<script src="https://www.gstatic.com/dialogflow-console/fast/messenger/bootstrap.js?v=1"></script>
	
<df-messenger
  intent="WELCOME"
  chat-title="TravelMaker"
  agent-id="84eaf284-0b6e-4076-8073-6d2aeec051eb"
  language-code="ko"
  chat-icon="<c:url value='/images/마크레스.jpg'/>"
></df-messenger>
</footer>


