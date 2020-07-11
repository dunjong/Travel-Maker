<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Deprecated된 함수 사용시 아래 라이브러리 임베드 -->
<script src='https://code.jquery.com/jquery-migrate-1.4.1.min.js'></script>
<script>
/*  function allowDrop(ev) {
	  ev.preventDefault();
	}

	function drag(ev) {
	  ev.dataTransfer.setData("text", ev.target.id);
	}

	function drop(ev) {
	  ev.preventDefault();
	  var data = ev.dataTransfer.getData("text");
	  ev.target.appendChild(document.getElementById(data));
	} */
	$(function(){
		$(".searchcitytag").click(function(event){
			event.preventDefault();
			$('html,body').animate({scrollTop:$(this.hash).offset().top},700);
		});
		$(".basketcity").click(function(event){
			event.preventDefault();
			$('html,body').animate({scrollTop:$(this.hash).offset().top},700);
		});
		
		
		$('#inputid').autocomplete({
			source : function(request, response) {
				$.ajax({
		               url : "<c:url value='/TravelMaker/searchlist.kosmo'/>",
		               type : "GET",
		               dataType: "json",
		               data : {"search_keyword" : $("#inputid").val()},
		               success : function(data){
		                  console.log(data);
		                  response($.map(data, function(item){
		                     return {
		                        label: item,
		                        value: item
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
	         select : function(evt, ui) {
	        	 evt.preventDefault();
	        	 console.log("전체 data: " + JSON.stringify(ui));
	               console.log(ui.item.label);
	               $('#inputid').val(ui.item.label);
	               var e = $.Event( "keypress", { which: 13 } );
	               $('#inputid').trigger(e);
	               /* console.log("db Index : " + ui.item.idx);
	               console.log("검색 데이터 : " + ui.item.value); */
	               $('#inputid').val("");
	               $('#inputid').focus();
	           },
	           focus : function(evt, ui) {
	               return false;
	           },
	           close : function(evt) {
	              
	           }
		})
		
		   $('#inputid').keypress(function(e){
			   if(e.which == '13'){
			        var string = $('#inputid').val()
			        console.log(string);
			        $.ajax({
		        	   url : "<c:url value='/TravelMaker/checkcity.kosmo'/>",
		               type : "GET",
		               dataType: "json",
		               data : {"search_city" : $("#inputid").val()},
		               success : function(data){
		            	   var name,no;
		                 $.each(data,function(key,value){
		                	 console.log('키:',key);
		                	 console.log('밸루:',value);
		                	 if(key=='CITY_NAME'){
		                		 name=value;
		                	 }
		                	 else if(key=='CITY_NO'){
		                		 no=value;
		                	 }
		                 });
		                 console.log(name);
		                 console.log(no);
		                  /* response($.map(data, function(item){
		                     return {
		                        label: item,
		                        value: item
		                     }
		                  })); */
		                  $('#input-divs').prepend('<div class="cityname" style="margin:3px;border:1px solid gray;line-height:50px;font-size:25px;background-color:orange;color:red;display:inline;"><span>'+name+'</span><a href="javascript:;" onclick="wordexit(this);" class="ui-icon ui-icon-close" style="cursor:pointer;">'+no+'</a></div>')
					        $('#inputid').val('')
					        $('#inputid').focus()
		               },
		               error : function(){ //실패
		                     alert("통신에 실패했습니다.");
		                  }
			        });
			        /* console.log('keypress',string)
			        $('#input-divs').prepend('<div class="cityname" style="margin:3px;border:1px solid gray;line-height:50px;font-size:25px;background-color:orange;color:red;display:inline;"><span>'+string+'</span><a href="javascript:;" onclick="wordexit(this);" class="ui-icon ui-icon-close" style="cursor:pointer;">'+string+'</a></div>')
			        $('#inputid').val('')
			        $('#inputid').focus() */
			   }
		   })
		   
		   
	})
		function wordexit(obj){
			for(var i=0;i<$('div.cityname').length;i++){
				console.log($('div.cityname:eq('+i+') span').html());
				console.log($(obj).html());
				if($('div.cityname:eq('+i+') a').html()==$(obj).html()){
					$('div.cityname:eq('+i+')').remove();
				}
			}
}
	 function uploadFile(){
        var form = $('#FILE_FORM')[0];
        console.log(form);
        var formData = new FormData(form);
        formData.append('fileObj', $('#FILE_TAG')[0].files[0]);
		console.log(formData.get('fileObj'));
        $.ajax({
            url: '<c:url value="/TravelMaker/Vision.kosmo"/>',
                    processData: false,
                    contentType: false,
                    data: formData,
                    type: 'POST',
                    success: function(result){
                    	//console.log(result);
                    	var k=0;
                    	$.each(result,function(tag,tagper){
                    		console.log("태그 이름:",tag)
                    		console.log("태그 퍼센트:",tagper)
                    		var tagsize = $('.tagmatch ul li').length;
                    		console.log(tagsize)
                    		
                    		for(var i=0;i<tagsize;i++){
                    			if($('.tagmatch ul li:eq('+i+') strong').html()==tag){
                    				$('.tagmatch ul li:eq('+i+') input:checkbox').prop('checked',true);
                    			}
                    		}
                    		$('.count-box:eq('+k+') p').html(tag);
                    		$('.count-box:eq('+k+') span').html(tagper);
                    		k++;
                    	});
                    	
                        
                    },
			        error:function(request,error){
						console.log('상태코드:',request.status);
						console.log('서버로부터 받은 HTML데이타:',request.responseText);
						console.log('에러:',error);
					}
            });
    }
	
	function citytag(){
		var tagsize = $('.tagmatch ul li').length;
		console.log(tagsize)
		var tagsAr= new Array();
		for(var i=0;i<tagsize;i++){
			console.log($('.tagmatch ul li:eq('+i+') input:checkbox').prop('checked'))
			if($('.tagmatch ul li:eq('+i+') input:checkbox').prop('checked')){
				var tag=$('.tagmatch ul li:eq('+i+') strong').html()
				tagsAr.push(tag)
			}
		}
		var tags=tagsAr.join(',')
		console.log(tags)
		console.log(typeof(tags))
		$.ajax({
			url: '<c:url value="/TravelMaker/CityTag.kosmo"/>',
			data:{tags:tags},
            dataType:'json',//서버로 부터 응답 받을 데이터의 형식
			success:function(data){//서버로부터 정상적인 응답을 받았을때
				$.each(data,function(i,cityintroduce){
					console.log(data.length)
					console.log(i)
					var img = cityintroduce['city_img'];
					var intro = cityintroduce['city_intro'];
					var name = cityintroduce['city_name'];
					var no = cityintroduce['city_no'];
					var count = cityintroduce['count'];
					console.log("주소:",img);
					var city="<li class=\"ui-widget-content ui-corner-tr\">";
					city+="<h6 class=\"ui-widget-header\">"+name+"</h6>";
					city+="<img src=\"/travelmaker"+img+"\" alt=\""+name+"\" width=\"96\" height=\"72\">";
					city+="<a href=\"/travelmaker"+img+"\" title=\"상세보기\" class=\"ui-icon ui-icon-zoomin\">";
					city+="상세보기</a>";
					city+="<a href='link/to/trash/script/when/we/have/js/off' title=\"담기\" class=\"ui-icon ui-icon-plus\">";
					city+="담기</a>";
					city+="<input type='hidden' name='"+name+"' id='"+no+"' class='h_intro' value='"+intro+"'/>";
					city+="</li>";
					$(city).appendTo('#gallery');
					console.log(city);
					var $gallery = $("#gallery"),
			        $trash = $("#trash"),
			        $items = $("#items");
					if(data.length==i+1){
						 //갤러리 항목을 드래그 할 수있게하십시오
						 $(function(){
					    $("li", $gallery).draggable({
					      cancel: "a.ui-icon", //아이콘을 클릭하면 드래그가 시작되지 않습니다
					      revert: "invalid", //떨어 뜨리지 않으면 아이템은 원래 위치로 되돌아갑니다
					      containment: "document",
					      helper: "clone",
					      cursor: "move"
					    });

					    // 갤러리 항목을 수락하여 휴지통을 놓을 수있게하십시오.
					    $trash.droppable({
					      accept: "#gallery > li",//떨어뜨릴수 있는 권한 부여
					      activeClass: "ui-state-highlight",//지정된 경우 허용되는 드래그 가능 항목을 드래그하는 동안 클래스가 놓기 가능 항목에 추가됩니다.
					      addClasses: true,
					      drop: function(event, ui) {
					        deleteImage(ui.draggable);
					      }
					    });

					    // let the gallery be droppable as well, accepting items from the trash
					    $gallery.droppable({
					      accept: "#trash li",
					      activeClass: "custom-state-active",
					      drop: function(event, ui) {
					        recycleImage(ui.draggable);
					      }
					    });

					    // 이미지 삭제 기능
					    var recycle_icon = "<a href='link/to/recycle/script/when/we/have/js/off' title='되돌리기' class='ui-icon ui-icon-refresh'>Recycle image</a>";

					    function deleteImage($item) {
					      var obj = cloneObject($item);
					      console.log('obj:',obj.html());
					      console.log(obj.length);
					      var $list = $("ul", $trash).length ?
					          $("ul", $trash) :
					            $("<ul class='gallery ui-helper-reset'/>").appendTo($trash);//삼항 연산자
					      obj.find("a.ui-icon-plus").remove();
					            console.log('obj2:',obj.html());
					      obj.append(recycle_icon).appendTo($list).fadeIn(function() {
					        obj
					          .animate({
					          width: "100px"
					        })
					          .find("img")
					          .animate({
					          height: "100px"
					        });
					      });
					      $items.text($("li", $list).length);
					      }

					    // image recycle function
					    var trash_icon = "<a href='link/to/trash/script/when/we/have/js/off' title='담기' class='ui-icon ui-icon-plus'>Delete image</a>";

					    function recycleImage($item) {
					      
					      $item.fadeOut(function() {
					        $item.remove();
					         $items.text($("li", $("ul", $trash)).length);
					      });
					    }

					    // image preview function, demonstrating the ui.dialog used as a modal window
					    
					    function viewLargerImage($link) {
					         var src = $link.attr("href"), 
					            title = $link.siblings("img").attr("alt"), 
					            $modal = $("img[src$='" + src + "']");
					         console.log($link);
					         console.log('주소1:',src);
					         console.log($('input[type=hidden]').val());
					         $('.modal-body img').attr('src',src);
					         $('.modal-title').html(title);
					         $('.modal-body ul p:first').html(title);
					         $('.modal-body ul p:last').html($('.h_intro[name$="'+title+'"]').val());
					         $('#js-modal').modal('show');
					         /* console.log($link) */
					         /* console.log(src); */
					         /* console.log($modal); */
					         /* console.log($modal.length); */
					         /* if ($modal.length) {
					            $modal.dialog("open");
					         }*/ 
					         /* else { */
					            
					            /* var img = $("<img class='sd' alt='" + title + "' style='display: none; padding: 8px;width:100%;height:100%;' />")
					                  .prop("src",src).appendTo(".asd"); */
					            /* console.log(img.attr("src")); */
					            /*setTimeout(function() {
					               $("#dia").dialog({
					                  title : title,
					                  width : 600,
					                  height: 600,
					                  modal : true
					               });
					            }, 1);
					         /*} */
					      }

							$('#close').on('click',function(){
								$('#js-modal').modal('hide');
							});
					      function cloneObject($item) {
					         var obj = $item.clone();
					         obj.draggable({
					            cancel : "a.ui-icon",
					            revert : "invalid",
					            containment : "document",
					            helper : "clone",
					            cursor : "move"
					         });
					         obj.click(function(event) {
					            /* event.preventDefault(); */
					            var $item = $(this), $target = $(event.target);
					            console.log('타겟:',$target);
					            if ($target.is("a.ui-icon-plus")) {
					               deleteImage($item);
					            } else if ($target.is("a.ui-icon-zoomin")) {
					               viewLargerImage($target);
					            } else if ($target.is("a.ui-icon-refresh")) {
					               recycleImage($item);
					            }
					            return false;
					         });
					         return obj;
					      }
					      // resolve the icons behavior with event delegation
					      $("ul.gallery > li").click(function(event) {
					         var $item = $(this), $target = $(event.target);
					         console.log('피직컬:',$item.find("img").attr("alt"))
					         /* $("#trash"). */
					         if ($target.is("a.ui-icon-plus")) {
					        	 var overlap=0;
					        	 /* if($item.find("img").attr("alt")){ */
					        	console.log('들어간갯수:',$('#trash ul li').length);
					        	for(i=0;i<$('#trash ul li').length;i++){
					        		console.log('클릭한이미지:',$(this).find("img").attr("alt"));
					        		console.log('들어가있는이미지',$('#trash ul li:eq('+i+') img').attr("alt"));
					        		if($(this).find("img").attr("alt")==$('#trash ul li:eq('+i+') img').attr("alt")){
					        			overlap=1;
					        		}
					        	}
					        	if(overlap==0){
					        		deleteImage($item);
					        	}
					        	else{
					        		alert('같은 도시는 장바구니에 넣을 수 없습니다');
					        	}
					        		 /* if($('#trash ul '+$item+'.find("img").attr("alt")')) */
					        	 /* } */
					         } else if ($target.is("a.ui-icon-zoomin")) {
					        	 
					            viewLargerImage($target);
					         } else if ($target.is("a.ui-icon-refresh")) {
					            recycleImage($item);
					         }
					         return false;
					      });
							
					      /* function preventClick(e){
					    		e.preventDefalut()
					    	} */
						 })
					}
				});	
			},
			error:function(data){//서버로부터 비정상적인 응답을 받았을때 호출되는 콜백함수
				console.log('에러:'+data.responseText);					
			}
		});
	}
	
	function basketcity(){
		console.log($('#trash ul li').length)
		var string,no;
		for(i=0;i<$('#trash ul li').length;i++){
			string=$('#trash ul li:eq('+i+') input[type=hidden]').attr('name');
			no=$('#trash ul li:eq('+i+') input[type=hidden]').attr('id');
			$('#input-divs').prepend('<div class="cityname" style="margin:3px;border:1px solid gray;line-height:50px;font-size:25px;background-color:orange;color:red;display:inline;"><span>'+string+'</span><a href="javascript:;" onclick="wordexit(this);" class="ui-icon ui-icon-close" style="cursor:pointer;">'+no+'</a></div>');
		}
	};
	function citypick(){
		var city_name=new Array();
		var city_no=new Array();
		for(i=0;i<$('.cityname').length;i++){
			console.log($('div.cityname:eq('+i+') span').html());
			console.log($('div.cityname:eq('+i+') a').html());
			city_name.push($('div.cityname:eq('+i+') span').html());
			city_no.push($('div.cityname:eq('+i+') a').html());
		}
		var citynames=city_name.toString();
		var citynos=city_no.toString();
		console.log(citynames);
		console.log(citynos);
		$('input[name=city_no]').val(citynos);
		$('input[name=city_name]').val(citynames);
		console.log($('input[name=city_no]').val());
		console.log($('input[name=city_name]').val());
	};
	
	
</script>

<!-- ======= Hero Section ======= -->



<section id="hero" class="d-flex flex-column justify-content-center"
	style="position: relative">

	<div class="jb-box" style="position: absolute; left: 0px; top: 0px">

		<video muted autoplay loop>
			<source src="<c:url value='/plugins/assets/mp4/mainpage.mp4'/>"
				type="video/mp4">
			<strong>Your browser does not support the video tag.</strong>
		</video>

		<div class="jb-text">
			<div class="container" data-aos="zoom-in" data-aos-delay="100">
				<h1>ARE YOU READY FOR TRAVEL?</h1>
				<p>
					가고 싶은 곳을 입력해보세요 ex)<span class="typed"
						data-typed-items="세부, 다낭, 괌, 발리, 보라카이"></span>
				</p>
				<div id="input-divs" style="border:2px solid black;opacity:0.5;border-radius: 5px;width:900px;height:50px;display:table-cell;vertical-align: middle;">
					<input type="text" name="searchWord" id="inputid" class="form-control"
						style="line-height:50px;opacity: 0.5;font-weight:bold;height:40px;width:150px;display:inline;" />
				</div>
				<form action="<c:url value='/TravelMaker/Planner.kosmo'/>" >
				<div
					class="d-flex flex-lg-row flex-column align-items-start justify-content-lg-between justify-content-start">
					<input type="hidden" name="city_no">
					<input type="hidden" id="ctiyname" name="city_name"/>
					<!-- 콤마로 구분해서 도시 번호 넘겨주세요 -->
					<button class="home_search_button citysearch" onclick="citypick();">도시선택</button>
					<!-- btn-lg float-right -->
				</div>
			</form>
				<div class="social-links">
					<a href="#" class="twitter"><i class="bx bxl-twitter"></i></a> <a
						href="#" class="facebook"><i class="bx bxl-facebook"></i></a> <a
						href="#" class="instagram"><i class="bx bxl-instagram"></i></a> <a
						href="#" class="google-plus"><i class="bx bxl-skype"></i></a> <a
						href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
				</div>
				<div>
					<p style="font-size: 30px; border: bold;">아직 여행할 곳을 못찾으셨다면 아래를
						눌러보세요!</p>
				</div>
				<a href="#searchImages" class="btn-get-started scrollto"> <i
					class="bx bx-chevrons-down"></i>
				</a>
			</div>
		</div>
	</div>
</section>

<!-- End Hero -->

<main id="main">

	<!-- ======= searchImages Section ======= -->
	<section id="searchImages" class="searchImages">
		<div class="container" data-aos="fade-right">

			<div class="section-title">
				<h2>Search Images</h2>
				<p style="font-size: 1.8rem">가보고싶은 곳의 사진을 넣어 자신의 여행계획을 세워보는 것은 어떨까요?</p>
			</div>

			<div class="row">
				<div class="col-lg-6" style="border-right: 1px solid green;">
					<div class="col-xs-12 example">
						<img draggable="true" id="drag1"
							src="<c:url value='/plugins/assets/img/bananajoong.jpg'/>"
							ondragstart="drag(event)" class="img-find" alt=""> <img
							draggable="true" id="drag2"
							src="<c:url value='/plugins/assets/img/exampleI2.jpg'/>"
							ondragstart="drag(event)" class="img-find" alt=""> <img
							draggable="true" id="drag3"
							src="<c:url value='/plugins/assets/img/profile-img123.jpg'/>"
							ondragstart="drag(event)" class="img-find" alt="">
					</div>
					<!-- <div id="div1" class="col-xs-12 picture" ondrop="drop(event)"
						ondragover="allowDrop(event)"
						style="width: 200px; height: 200px; position: relative; top: 10%; left: 15%; border: 1px green solid;"></div> -->
					<form id="FILE_FORM" method="post" enctype="multipart/form-data" style="width:495px; padding-top: 30px"
						action="">
						<input type="file" id="FILE_TAG" name="FILE_TAG"> 
						<a class="ui-shadow ui-btn ui-corner-all" 
						href="javascript:uploadFile();"><button type="button" class="btn btn-info btn-lg float-right">전송</button></a>
					</form>
				</div> 
				
				
				<div class="col-lg-6 pt-4 pt-lg-0 tagview">
					<h3 style="color: olive;">사진 관련 태그들</h3>
					<div class="row tagmatch">
						<div class="col-lg-6">
							<ul>
								<li><i class="icofont-rounded-right"></i><strong>Beach</strong><input
									type="checkbox" value="Beach"/></li>
								<li><i class="icofont-rounded-right"></i><strong>City</strong><input
									type="checkbox" value="City"/></li>
								<li><i class="icofont-rounded-right"></i><strong>Coast</strong><input
									type="checkbox" value="Coast"/></li>
								<li><i class="icofont-rounded-right"></i><strong>Mountain</strong><input
									type="checkbox" value="Mountain"/></li>
								<li><i class="icofont-rounded-right"></i><strong>Ocean</strong><input
									type="checkbox" value="Ocean"/></li>
								<li><i class="icofont-rounded-right"></i><strong>Natural Landscape</strong><input
									type="checkbox" value="Natural Landscape"/></li>
								<li><i class="icofont-rounded-right"></i><strong>Metropolitan Area</strong><input
									type="checkbox" value="Metropolitan Area"/></li>
							</ul>
						</div>
						<div class="col-lg-6">
							<ul>
								<li><i class="icofont-rounded-right"></i><strong>Cave</strong><input
									type="checkbox" value="Cave"/></li>	
								<li><i class="icofont-rounded-right"></i><strong>Landmark</strong><input
									type="checkbox" value="Landmark"/></li>
								<li><i class="icofont-rounded-right"></i><strong>Sea</strong><input
									type="checkbox" value="Sea"/></li>
								<li><i class="icofont-rounded-right"></i><strong>Waterfall</strong><input
									type="checkbox" value="Ocean"/></li>
								<li><i class="icofont-rounded-right"></i><strong>Historic Site</strong><input 
								type="checkbox" value="Historic Site"/></li>
								<li><i class="icofont-rounded-right"></i><strong>Nature</strong><input
									type="checkbox" value="Nature"/></li>
								<li><i class="icofont-rounded-right"></i><strong>Caribbean</strong><input
									type="checkbox" value="Caribbean"/></li>

							</ul>
						</div>
						<div class="citysearch-div">

							<!-- <button type="submit" class="citysearch" value="관련 도시 검색"></button>
 -->
							<a class="searchcitytag" href="#resume" onclick="citytag();">관련 도시 검색</a>
								
						</div>
					</div>
				</div>
			</div>
			<div class="row search">
				<div class="col-lg-3 col-md-6">
					<div class="count-box">
						<i class="icofont-simple-smile"></i> <span
							data-toggle="counter-up">100</span>%
						<p><strong>사진을</strong></p>
					</div>
				</div>

				<div class="col-lg-3 col-md-6 mt-5 mt-md-0">
					<div class="count-box">
						<i class="icofont-simple-smile"></i> <span
							data-toggle="counter-up">100</span>%
						<p>등록해보세요</p>
					</div>
				</div>

				<div class="col-lg-3 col-md-6 mt-5 mt-lg-0">
					<div class="count-box">
						<i class="icofont-simple-smile"></i> <span
							data-toggle="counter-up">100</span>%
						<p>데이타가</p>
					</div>
				</div>

				<div class="col-lg-3 col-md-6 mt-5 mt-lg-0">
					<div class="count-box">
						<i class="icofont-simple-smile"></i> <span
							data-toggle="counter-up">100</span>%
						<p>바뀝니다</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- End searchImages Section -->

	<!-- ======= Resume Section ======= -->
	<section id="resume" class="resume">
		<div class="container" data-aos="fade-up">

			<div class="section-title">
				<h2>찾은 도시</h2>
				<p>당신이 좋아하는 사진과 비슷한 도시들입니다.</p>
			</div>

			<div class="row">
				<div class="col-md-8">
					<div class="ui-widget ui-helper-clearfix">
						<ul id="gallery" class="gallery ui-helper-reset ui-helper-clearfix">
							<%-- <li class="ui-widget-content ui-corner-tr">
								<h6 class="ui-widget-header">세부</h6> <img
								src="<c:url value='/plugins/assets/img/세부.jpg'/>" alt="세부" width="96"
								height="72"> <a href='<c:url value="/plugins/assets/img/세부.jpg"/>' onclick='preventClick(event)'
								title="상세보기" class="ui-icon ui-icon-zoomin">View larger</a> <a
								href="link/to/trash/script/when/we/have/js/off" title="담기"
								class="ui-icon ui-icon-plus">Delete image</a>
							</li> --%>
						</ul>
					</div>
				</div>
					<div class="col-md-4">
						<div id="trash" class="ui-widget-content ui-state-default" style="width:100%;position:relative;height:100%;">
							<h5 class="ui-widget-header">
								저장된 도시:<span id="items">0</span>
								<!-- <span class="ui-icon ui-icon-trash"></span> Trash -->
							</h5>
								<a href="#hero" class="basketcity" onclick="basketcity();" style="position:absolute; right:0px; bottom:0px;">
									저장완료
									<!-- <span class="ui-icon ui-icon-trash"></span> Trash -->
								</a>
						</div>
					</div>
			</div>
		</div>
		<%-- <div id="dia" style="width: 600px; height: 600px;display:none;">
            <img src="<c:url value='/plugins/assets/img/세부.jpg'/>" alt="세부" align="left"
               style="width:300px;height:300px;" />
            <div style="padding-left:5px;">
            <h3>고래상어 스쿠버다이빙과 스페인 종교건축물들이 기다리는 필리핀 옛 수도</h3>
            <a href="<c:url value='/'/>">리뷰바로가기</a>
        </div> --%>
		<div class="modal fade" id="js-modal" data-backdrop="static">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">세부</h4>
						<button class="close" data-dismiss="modal">
							<span>&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<!-- <button class="close" id="close">
		    		ad
		    		</button> -->
						<img src='<c:url value="/plugins/assets/img/세부.jpg"/>' style="width: 100%;">
						<ul>
							<li>도시이름:</li>
							<p>세부</p>
							<li>도시소개:</li>
							<p>한줄평</p>
						</ul>
					</div>
					<div class="modal-footer">
						<a href="#">리뷰이동</a>
						<button class="btn btn-info" data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- End Resume Section -->
	
	<!-- ======= Testimonials Section ======= -->
	<section id="testimonials" class="testimonials section-bg">
		<div class="container" data-aos="fade-up">

			<div class="section-title">
				<h2>TravelMaker직원들의 각종 꿀팁!</h2>
			</div>

			<div class="owl-carousel testimonials-carousel" data-aos="zoom-in"
				data-aos-delay="100">

				<div class="testimonial-item">
					<img src="<c:url value='/plugins/assets/img/bananaman.jpg'/>"
						class="testimonial-img" alt="">
					<h3>바나나맨</h3>
					<h4>banana &amp; banana</h4>
					<p>
						<i class="bx bxs-quote-alt-left quote-icon-left"></i> 바나나는 이렇게
						먹는거에요.. <i class="bx bxs-quote-alt-right quote-icon-right"></i>
					</p>
				</div>

				<div class="testimonial-item">
					<img src="<c:url value='/plugins/assets/img/bananaman.jpg'/>"
						class="testimonial-img" alt="">
					<h3>바나나맨 박종현</h3>
					<h4>banana man</h4>
					<p>
						<i class="bx bxs-quote-alt-left quote-icon-left"></i> 바나나란 심오한거에오
						<i class="bx bxs-quote-alt-right quote-icon-right"></i>
					</p>
				</div>

				<div class="testimonial-item">
					<img src="<c:url value='/plugins/assets/img/bananaman.jpg'/>"
						class="testimonial-img" alt="">
					<h3>바나나좋아하는 박조년</h3>
					<h4>banana designer</h4>
					<p>
						<i class="bx bxs-quote-alt-left quote-icon-left"></i> 바나나를 디자인해보아오
						<i class="bx bxs-quote-alt-right quote-icon-right"></i>
					</p>
				</div>

				<div class="testimonial-item">
					<img src="<c:url value='/plugins/assets/img/bananaman.jpg'/>"
						class="testimonial-img" alt="">
					<h3>바나나 많이 먹는 박종현</h3>
					<h4>banana many eat man</h4>
					<p>
						<i class="bx bxs-quote-alt-left quote-icon-left"></i> 바나나 많이 먹게하는중
						<i class="bx bxs-quote-alt-right quote-icon-right"></i>
					</p>
				</div>

				<div class="testimonial-item">
					<img src="<c:url value='/plugins/assets/img/bananaman.jpg'/>"
						class="testimonial-img" alt="">
					<h3>바나나만 먹는 박종현</h3>
					<h4>physical</h4>
					<p>
						<i class="bx bxs-quote-alt-left quote-icon-left"></i> 바나나 먹는 걸
						습관화합시다 <i class="bx bxs-quote-alt-right quote-icon-right"></i>
					</p>
				</div>

			</div>

		</div>
	</section>
	<!-- End Testimonials Section -->



</main>
<!-- End #main -->

