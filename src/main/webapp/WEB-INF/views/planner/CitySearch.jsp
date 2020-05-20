<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


	

	<!-- Search -->
	<style>
	.home_search_button{
		width: 80%;
	}
	
	</style>
	<div class="home_search">
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="home_search_container">
						<div class="home_search_title">도시찾기</div>
						<div class="home_search_content">
							<form action="<c:url value='/TravelMaker/Planner.kosmo'/>">
								<div class="d-flex flex-lg-row flex-column align-items-start justify-content-lg-between justify-content-start">
									
									<button class="home_search_button" style="center;">도시 선택</button>
								</div>	
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


