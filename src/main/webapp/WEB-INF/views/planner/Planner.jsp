 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
 <style>
     
     
    </style>
    <div class="intro">
		
		<div class="intro_container">
			<div class="row">
			    <!-- <div id="floating-panel" onclick="drop()">
			      <h3>마커를 클릭하여 세부일정을 짜세요!</h3> 
			    </div>
			     -->
			     <c:forEach items="${city_no_name}" var="name">
			    <div class="col-sm-12">
			    	<form action="<c:url value="/TravelMaker/Plan.kosmo"/>">
			    	<input hidden="true" name="origin" value="방콕,태국" />
					<input hidden="true" name="destination" value="공항,방콕,태국" />
			    	<button class="btn btn-danger">${name}</button>
			    	</form>
			    </div>
			     </c:forEach>
		    </div>
		</div>
	</div>
	<form hidden="true" id="frm">
		
	</form>
    <script>

      
    </script>