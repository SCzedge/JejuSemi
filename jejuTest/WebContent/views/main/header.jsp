<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
/* The Modal (background) */
          .popModal {
             display: none; /* Hidden by default */
             position: fixed; /* Stay in place */
             z-index: 2; /* Sit on top */
             left: 0;
             top: 0;
             width: 100%; /* Full width */
             height: 100%; /* Full height */
             overflow: hidden; /* Enable scroll if needed */
             background-color: rgb(0,0,0); /* Fallback color */
             background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
         }
     
         /* Modal Content/Box */
         .modal-content {
             background-color: #fefefe;
             margin: 10% auto; /* 15% from the top and centered */
             padding: 20px;
             border: 1px solid #888;
             /* width: 30%; */ /* Could be more or less, depending on screen size */
             width:745px;
        	 height:450px;                        
         }
         /* The Close Button */
         .close {
             color: #aaa;
             float: right;
             font-size: 28px;
             font-weight: bold;
             text-align: right;
         }
         .close:hover,
         .close:focus {
             color: black;
             text-decoration: none;
             cursor: pointer;
         }
         .nav-item{
            cursor: pointer;
         }
         #logoutBtn{
         	display: none;
         }
         .test{
          	border: 1px solid lightgray;
         }  
         .aa{
            box-sizing: border-box;
         }
         .dd{
            float: left;
         }
        


</style>

</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark pb_navbar pb_scrolled-light" id="templateux-navbar">
      <div class="container">
        <a class="navbar-brand" href="<%= request.getContextPath() %>/index.jsp"><span class="text-danger">Jeju</span>Boram</a>
        <div class="site-menu-toggle js-site-menu-toggle  ml-auto"  data-aos="fade" data-toggle="collapse" data-target="#templateux-navbar-nav" aria-controls="templateux-navbar-nav" aria-expanded="false" aria-label="Toggle navigation">
              <span></span>
              <span></span>
              <span></span>
            </div>
            <!-- END menu-toggle -->

            <div class="collapse navbar-collapse" id="templateux-navbar-nav">
              <ul class="navbar-nav ml-auto">
                <li class="nav-item"><a class="nav-link" href="#section-home" id="nav1">Home</a></li>
                <li class="nav-item"><a class="nav-link" target="_blank" id="nav2">Flight</a></li>
                <li class="nav-item"><a class="nav-link" target="_blank" id="nav3">RentCar</a></li>
                <li class="nav-item"><a class="nav-link" href="#section-about" id="nav4">AboutJeju</a></li>
                <li class="nav-item"><a class="nav-link" href="#section-team" id="nav5">Recommand</a></li>              
                <li class="nav-item"><a class="nav-link" href="#section-menus" id="nav6">TourSpot</a></li>   
                <li class="nav-item"><a class="nav-link" href="#section-events" id="nav7">JejuFestival</a></li>         
                <li class="nav-item"><a class="nav-link" href="#section-contact" id="nav8">ContactUs</a></li>
                <!-- <li class="nav-item"><a class="nav-link" href="#section-apply" id="nav9">ApplyFor</a></li> -->
                <!-- <li class="nav-item"><a class="nav-link" href="#" id="join">Join</a></li> -->
                <li class="nav-item cta-btn ml-xl-2 ml-lg-2 ml-md-0 ml-sm-0 ml-0"><a class="nav-link" id="loginBtn" target="_blank"><span class="pb_rounded-4 px-4 rounded">Login</span></a></li>
                <li class="nav-item cta-btn ml-xl-2 ml-lg-2 ml-md-0 ml-sm-0 ml-0"><a class="nav-link" id="logoutBtn" onclick="logout();"><span class="pb_rounded-4 px-4 rounded" >Logout</span></a></li>
              </ul>
            </div>
          </div>
        </nav>

    <!-- Login Modal -->
    <div id="loginModal" class="popModal">
          <div class="container">
            <form class="form-login" action="<%= request.getContextPath() %>/login.me" method="post" onsubmit="return validate();">
              <h2 class="form-login-heading">sign in now</h2>
              <div class="login-wrap">
                  <span class="close" style="margin-left:auto;">&times;</span>
                <input type="text" name="userId" class="form-control" placeholder="User ID" id="userId" autofocus>
                <br>
                <input type="password" name="userPwd"class="form-control" placeholder="Password" id="userPwd">
                <!-- <label class="checkbox"> -->
                  <input type="checkbox" value="remember-me"> 기억하기
                  <span class="pull-right">
                  <a data-toggle="modal" href="header.jsp#myModal"> Forgot Password?</a>
                  </span>
                  <!-- </label> -->
                <button class="btn btn-theme btn-block" type="submit">SIGN IN</button>
                <hr>
                <div class="login-social-link centered">
                  <p>or you can sign in via your social network</p>
                  <button class="btn btn-facebook" type="submit"><i class="fa fa-facebook"></i> Facebook</button>
                  <button class="btn btn-twitter" type="submit"><i class="fa fa-twitter"></i> Twitter</button>
                </div>
                <div class="registration">
                  Don't have an account yet?<br/>
                  <a class="" href="#">
                    Create an account
                    </a>
                <!-- </div> -->
              </div>
              <!-- Modal -->
              <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal" class="modal fade">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                      <h4 class="modal-title">Forgot Password ?</h4>
                    </div>
                    <div class="modal-body">
                      <p>Enter your e-mail address below to reset your password.</p>
                      <input type="text" name="email" placeholder="Email" autocomplete="off" class="form-control placeholder-no-fix">
                    </div>
                    <div class="modal-footer">
                      <button data-dismiss="modal" class="btn btn-default" type="button">Cancel</button>
                      <button class="btn btn-theme" type="button">Submit</button>
                    </div>
                  </div>
                </div>
              </div>
            </div>
              <!-- modal -->
            </form>
          </div>
        </div>

      <!-- Flight Modal -->
    <div id="flightModal" class="popModal"> 
      <!-- Modal content -->
      <div class="modal-content">
          <span class="close" style="margin-left:auto;">&times;</span>
          <div
            data-skyscanner-widget="FlightSearchWidget"
            data-locale="ko-KR"
            data-market="KR"
            data-currency="KRW"
          ></div>
          <script src="https://widgets.skyscanner.net/widget-server/js/loader.js" async></script>
      </div>   
    </div>
  
      <script>
          // loginModal
          var loginModal = document.getElementById('loginModal');
          var loginBtn = document.getElementById("loginBtn");
   
          // flightModal
          var flightModal = document.getElementById('flightModal');
          var flight = document.getElementById("nav2");
   
          // Get the <span> element that closes the modal
          var span = document.getElementsByClassName("close");                                          
   
          // When the user clicks on the button, open the modal 
          loginBtn.onclick = function() {
            loginModal.style.display = "block";
          } 
          flight.onclick = function() {
            flightModal.style.display = "block";
          } 

          $(function(){
            // 모달창 x 버튼 누르면 창 꺼지기
            $(".close").click(function(){
              // console.log("sss");
              $(this).parents(".popModal")
              .css("display", "none");
            });
          });
          
          function validate() {
  			if($("#userId").val().trim().length == 0){	// 아이디 입력 안했을 경우
  				alert("아이디를 입력해주세요.");
  				$("#userId").focus();
  				return false;
  			}
  			
  			if($("#userPwd").val().trim().length == 0){	// 비밀번호 입력 안했을 경우
  				alert("비밀번호를 입력해주세요.");
  				$("#userPwd").focus();
  				return false;				
  			}
  				$("#loginBtn").css('display','none');
  				$("#logoutBtn").css('display','block');
  				
  				return true;
  			}
          
          	function logout() {
  				location.href="<%= request.getContextPath() %>/logout.me";			
  			}
          

      </script> 

    
    <!-- END nav -->

      <section class="site-hero overlay" style="background-image: url(<%= request.getContextPath() %>/resources/images/hero_5.jpg)" data-stellar-background-ratio="0.5" id="section-home">
        <div class="container">
          <div class="row site-hero-inner justify-content-center align-items-center">
            <div class="col-md-10 text-center" data-aos="fade-up">
              <img src="<%= request.getContextPath() %>/resources/images/jejuisland.png">
            </div>
          </div>
        </div>
      </section>
      <!-- END section -->
</body>
</html>