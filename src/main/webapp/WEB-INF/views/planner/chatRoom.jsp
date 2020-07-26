<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
	<meta name="description" content="Travello template project">
	<link rel="stylesheet" href="<c:url value='/styles/bootstrap4/bootstrap.min.css'/>">
	<link href="<c:url value='/plugins/font-awesome-4.7.0/css/font-awesome.min.css'/>" rel="stylesheet">
	<link rel="stylesheet" href="<c:url value='/plugins/OwlCarousel2-2.2.1/owl.carousel.css'/>">
	<link rel="stylesheet" href="<c:url value='/plugins/OwlCarousel2-2.2.1/owl.theme.default.css'/>">
	<link rel="stylesheet" href="<c:url value='/plugins/OwlCarousel2-2.2.1/animate.css'/>">
	<link rel="stylesheet" href="<c:url value='/styles/main_styles.css'/>">
	<link rel="stylesheet" href="<c:url value='/styles/responsive.css'/>">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<!-- 제이쿼리 UI용 라이브러리 임베드 -->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
<script type="text/javascript">
$(function(){
var me = {};
me.avatar = "https://lh6.googleusercontent.com/-lr2nyjhhjXw/AAAAAAAAAAI/AAAAAAAARmE/MdtfUmC0M4s/photo.jpg?sz=48";

var you = {};
you.avatar = "https://a11.t26.net/taringa/avatares/9/1/2/F/7/8/Demon_King1/48x48_5C5.jpg";

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

//-- No use time. It is a javaScript effect.
function insertChat(who, text, time){
    if (time === undefined){
        time = 0;
    }
    var control = "";
    var date = formatAMPM(new Date());
    
    if (who == "me"){
        control = '<li style="width:100%">' +
                        '<div class="msj macro">' +
                        '<div class="avatar"><img class="img-circle" style="width:100%;" src="'+ me.avatar +'" /></div>' +
                            '<div class="text text-l">' +
                                '<p>'+ text +'</p>' +
                                '<p><small>'+date+'</small></p>' +
                            '</div>' +
                        '</div>' +
                    '</li>';                    
    }else{
        control = '<li style="width:100%;">' +
                        '<div class="msj-rta macro">' +
                            '<div class="text text-r">' +
                                '<p>'+text+'</p>' +
                                '<p><small>'+date+'</small></p>' +
                            '</div>' +
                        '<div class="avatar" style="padding:0px 0px 0px 10px !important"><img class="img-circle" style="width:100%;" src="'+you.avatar+'" /></div>' +                                
                  '</li>';
    }
    setTimeout(
        function(){                        
            $("ul").append(control).scrollTop($("ul").prop('scrollHeight'));
        }, time);
    
}

function resetChat(){
    $("ul").empty();
}
function enter(){
        var text = $('.mytext').val();
        if (text !== ""){
            insertChat("me", text);              
            $('.mytext').val('');
        }
}

$(".mytext").on("keyup", function(e){
	console.log('enter:',e.which)
    if (e.which == 13){
        var text = $(this).val();
        if (text !== ""){
            insertChat("me", text);              
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
insertChat("me", "Hello Tom...", 0);  
insertChat("you", "Hi, Pablo", 1500);
/*
insertChat("me", "What would you like to talk about today?", 3500);
insertChat("you", "Tell me a joke",7000);
insertChat("me", "Spaceman: Computer! Computer! Do we bring battery?!", 9500);
insertChat("you", "LOL", 12000);
*/
})
//-- NOTE: No use time on insertChat.
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
body > div > div > div:nth-child(2) > span{
    background: whitesmoke;padding: 10px;font-size: 21px;border-radius: 50%;
}
body > div > div > div.msj-rta.macro{
    margin:auto;margin-left:1%;
}
ul {
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
input:focus{
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
<script>
	function BackToMyPlanner(){
		window.location.replace('<c:url value="/TravelMaker/MyPlanner.kosmo?planner_no=${planner_no}"/>')
	}

</script>
</head>
<body>
	<h2>'${planner_no}' 번방 채팅입니다.</h2>
	<div class="row">
		<div class="col-md-2" style="background:#e0f7fa">
			<h3>주인 아이디:${owner.user_id}</h3>
			<h3>나이:?</h3>
			<h3>성별:?</h3>
		</div>
		<c:forEach items="${member_list}" var="member">
			
			<div class="col-md-2" style="background:#e0f7fa">
				<h3>아이디:${member.user_id}</h3>
				<h3>나이:${member.user_rrn}</h3>
				<h3>성별:${member.user_gender}</h3>
			</div>
		</c:forEach>
		<div class="12">
			   
		</div>
	</div>
	<div class="row">
		<div class="col-sm-3 frame">
            <ul></ul>
            <div>
                <div class="msj-rta macro">                        
                    <div class="text text-r" style="background:whitesmoke !important">
                        <input class="mytext" placeholder="Type a message"/>
                    </div> 

                </div>
                <div style="padding:10px;">
                    <span onclick="enter()" class="glyphicon glyphicon-pencil">보내기</span>
                </div>                
            </div>
        </div>    
	</div>
	
	<button class="btn btn-info" onclick="BackToMyPlanner()">내 플래너로 돌아가기</button>
	
</body>
<script src="<c:url value='/styles/bootstrap4/popper.js'/>"></script>
<script src="<c:url value='/styles/bootstrap4/bootstrap.min.js'/>"></script>
<script src="<c:url value='/plugins/OwlCarousel2-2.2.1/owl.carousel.js'/>"></script>
<script src="<c:url value='/plugins/Isotope/isotope.pkgd.min.js'/>"></script>
<script src="<c:url value='/plugins/scrollTo/jquery.scrollTo.min.js'/>"></script>
<script src="<c:url value='/plugins/easing/easing.js'/>"></script>
<script src="<c:url value='/plugins/parallax-js-master/parallax.min.js'/>"></script>
<script src="<c:url value='/js/custom.js'/>"></script>

</html>