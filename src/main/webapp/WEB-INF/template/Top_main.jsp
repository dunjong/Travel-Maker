<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
<!-- Google Fonts -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap">
<!-- Bootstrap core CSS -->

<!-- Material Design Bootstrap -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/css/mdb.min.css"
	rel="stylesheet">
<!-- JQuery -->

<!-- Bootstrap tooltips -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
<!-- Bootstrap core JavaScript -->

<!-- MDB core JavaScript -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/js/mdb.min.js"></script>
<style>

#chatbtn img{
 		width:56px;
        height:56px;
}
.modal-header{
		border-top-left-radius: 12px;
		border-top-right-radius: 12px;
}
</style>

<!-- ======= Mobile nav toggle button ======= -->
	<button type="button" class="mobile-nav-toggle d-xl-none">
		<i class="icofont-navigation-menu"></i>
	</button>

	<!-- ======= Header ======= -->
	<header id="header" class="d-flex flex-column justify-content-center">

		<nav class="nav-menu">
			<ul>
				<li><a href='<c:url value="/"/>'><i class="bx bx-home"></i>
						<span>Home</span></a></li>
				<li class="active"><a href="#hero"><i class="bx bx-user"></i> <span>Search</span></a></li>
				<li><a href="#searchImages"><i class="bx bx-file-blank"></i> <span>SearchImages</span></a></li>
				<li><a href="#resume"><i class="bx bx-book-content"></i>
						<span>city</span></a></li>
				<li><a href="#testimonials"><i class="bx bx-server"></i> <span>Tip</span></a></li>
				<li><button id="chatbtn" class="rounded-circle" type="button" data-toggle="modal" data-target="#ChatModal" style="text-align: right;cursor: pointer; "><img src="<c:url value='/images/104352_482_1650.jpg'/>" class="rounded-circle" style="color: sandybrown" alt=""></button>
		<div class="modal-chatbot">
                              
            <div class="modal fade bd-example-modal-lg" id="ChatModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
         <div class="modal-dialog modal-lg">
            <div class="modal-dialog modal-notify modal-info">
         <div class="modal-content">
              <div class="modal-header">        
                <h4 class="modal-title" id="myModalLabel" style="color:white;"><i class="fa fa-fighter-jet"></i>TravelMaker</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
              </div>
              <div class="modal-body" >
      
            <iframe
                  id="iframe"            
                  style="min-height: 60vh; border:none;"
                  scrolling="no"              
                  width="100%"
                  height="90%"
                  src="https://ab686d1a72f1.ngrok.io">                        
              </iframe>
              </div>
               </div>
         </div>
             <!-- /.modal-content -->
           </div>
           <!-- /.modal-dialog -->
         </div>
         <!-- /.modal -->
   
      </div></li>
			</ul>
		</nav>
		<!-- .nav-menu -->
		
		
		
	</header>