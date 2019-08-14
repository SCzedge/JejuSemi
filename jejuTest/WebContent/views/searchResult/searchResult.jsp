<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/animate.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/aos.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/bootstrap-datepicker.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/jquery.timepicker.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/fancybox.min.css">      
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/fonts/ionicons/css/ionicons.min.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/fonts/fontawesome/css/font-awesome.min.css">
<!-- Theme Style -->
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/style.css">

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
         aside {
           float: left;
         }
         .star{
           color:gold;
           font-size: 20px;
         }
         .searchForm{
           border: 1px solid lightgray;
           width: 100%;
         }
         .result{
          border: 1px solid lightgray;
          width: 85%;
         }
         .searchPhoto{
          border: 1px solid lightgray;
          width: 300px;
          height: 200px;
         }
         .test{
          border: 1px solid lightgray;
         }
         
         
         li{
            list-style-type: none;
        }
        .test{
            border: 1px solid lightgray;
        }
        .aa{
            box-sizing: border-box;
        }
        .resultWrap{
            width: 100%;
            height: 250px;
        }
        .d1{
            width: 75%;
            height: 100%;
        }
        .d2{
            width: 25%;
            height: 100%;
        }        
        .d3{
            height: 20%;
        }
        .d4{
            height: 80%;
        }
        .d5{
            width: 50%;
            height: 100%;
            padding: 15px;
            padding-top: 0px;
        }
        .d6{
            width: 50%;
            height: 100%;
        }
        .d7{
        	height:70%
        }
        .d8{
        	height: 30%;
        	text-align:center;
        }
        .imgDiv{
            width: 300px;
            height: 170px;
            margin:auto;
        }
        .dd{
            float: left;
        }
        .title{
        	text-indent: 25px;
        }
        .detailBtn{
        	margin:auto;
        }
        .resultSection{
        	height:1400px;
        }
         
         
</style>
</head>
<body data-spy="scroll" data-target="#templateux-navbar" data-offset="200">

	<%-- 헤더,메뉴바 --%>
    <%@ include file="../main/header.jsp" %>
    
    
    
    
    
    <section class="section resultSection" id="searchResult">
        <div class="container">
          <aside>
            <hr>
              <label style="font-weight:bold">숙소유형</label><br>
              <input type="checkbox" id="hotel"><label for="hotel">호텔</label><br> 
              <input type="checkbox" id="resort"><label for="resort">리조트</label><br> 
              <input type="checkbox" id="condo"><label for="condo">콘도</label><br> 
              <input type="checkbox" id="hostel"><label for="hostel">호스텔</label><br> 
              <input type="checkbox" id="minbak"><label for="minbak">민박</label><br> 
              
              <hr>
              
              <label style="font-weight:bold">구역</label><br>
              <input type="checkbox" id="jeju"><label for="jeju">제주시</label><br>
              <input type="checkbox" id="seoguipo"><label for="seoguipo">서귀포시</label><br>
              
              <hr>
              
              <label style="font-weight:bold">1박요금</label><br>
              <font size=2 id="minPrice_view">최소가격 : &#8361;0</font><br>
              <input oninput='ShowSliderValueMin(this.value)' class="slide" id="maxPrice" type="range" min='1' max='100' value='1' step="1">
              <br>
              <font size=2 id="maxPrice_view">최대가격 : &#8361;0</font><br>
              <input oninput='ShowSliderValueMax(this.value)' class="slide" id="maxPrice" type="range" min='1' max='100' value='1' step="1">

              <script>
                  function ShowSliderValueMin(sVal){
	                  var obValueView = document.getElementById("minPrice_view");
                    if(sVal == '100'){
                      sVal = '1,00';
                      obValueView.innerHTML = "최소가격 : &#8361;"+sVal+"0,000+"
                    }else{
	                    obValueView.innerHTML = "최소가격 : &#8361;"+sVal+"0,000"
                    }
                  }
                  function ShowSliderValueMax(sVal){
	                  var obValueView = document.getElementById("maxPrice_view");
                    if(sVal == '100'){
                      sVal = '1,00';
                      obValueView.innerHTML = "최대가격 : &#8361;"+sVal+"0,000+"
                    }else{
	                    obValueView.innerHTML = "최대가격 : &#8361;"+sVal+"0,000"
                    }
                  }
              </script>
              <br>
              <hr>
              <label style="font-weight:bold">등급</label><br>
              <input type="checkbox" name="avgStar" value="1"><span class="star"> ★★★★★</span><br>
              <input type="checkbox" name="avgStar" value="2"><span class="star"> ★★★★</span><br>
              <input type="checkbox" name="avgStar" value="3"><span class="star"> ★★★</span><br>
              <input type="checkbox" name="avgStar" value="4"><span class="star"> ★★</span><br>
              <input type="checkbox" name="avgStar" value="5"><span class="star"> ★</span><br>
              <hr>







          </aside>
          <div class="row justify-content-center mb-5">
             
            <!-- <div class="result" data-aos="fade-up">     -->          
              <!-- <h2 class="heading" data-aos="fade-up">검색결과</h2> -->
              <!-- <div data-aos="fade-up" data-aos-delay="100" class="searchForm" >검색된 숙소들 db에서 불러와서 여기에 뿌려주면 될듯?</div> -->
              <!-- <a href="#" style="font-weight:bold; font-size: 1.5em;">testHotel</a><br> -->
              
            <!-- </div> -->

				<ul class="resultWrap">
					2019/00/00 ~ 2019/00/00 검색 결과
					<li>
						<div class="test resultWrap aa">
							<div class="test d1 dd aa">							
								<div class="test d3 aa title">
									<a href="#" style="font-weight:bold; font-size:1.5em;">testHotel</a><br>
								</div>
								<div class="test d4 aa">
									<div class="test dd d5 aa">
										<div class="test imgDiv aa">썸네일</div>
									</div>
									<div class="test dd d6">설명</div>
								</div>
							</div>

							<div class="test d2 dd aa">
								<div class="test d7 aa">가격</div>
								<div class="test d8 aa">
									<button class="detailBtn btn btn-primary btn-block text-white" style="width:70%;">상세보기</button>
								</div>							
							</div>
						</div>
					</li><br>
					
					
					<li>
						<div class="test resultWrap aa">
							<div class="test d1 dd aa">							
								<div class="test d3 aa title">
									<a href="#" style="font-weight:bold; font-size:1.5em;">testHotel</a><br>
								</div>
								<div class="test d4 aa">
									<div class="test dd d5 aa">
										<div class="test imgDiv aa">썸네일</div>
									</div>
									<div class="test dd d6">설명</div>
								</div>
							</div>

							<div class="test d2 dd aa">
								<div class="test d7 aa">가격</div>
								<div class="test d8 aa">
									<button class="detailBtn btn btn-primary btn-block text-white" style="width:70%;">상세보기</button>
								</div>							
							</div>
						</div>
					</li><br>
					
					
					<li>
						<div class="test resultWrap aa">
							<div class="test d1 dd aa">							
								<div class="test d3 aa title">
									<a href="#" style="font-weight:bold; font-size:1.5em;">testHotel</a><br>
								</div>
								<div class="test d4 aa">
									<div class="test dd d5 aa">
										<div class="test imgDiv aa">썸네일</div>
									</div>
									<div class="test dd d6">설명</div>
								</div>
							</div>

							<div class="test d2 dd aa">
								<div class="test d7 aa">가격</div>
								<div class="test d8 aa">
									<button class="detailBtn btn btn-primary btn-block text-white" style="width:70%;">상세보기</button>
								</div>							
							</div>
						</div>
					</li><br>
					
					
					<li>
						<div class="test resultWrap aa">
							<div class="test d1 dd aa">							
								<div class="test d3 aa title">
									<a href="#" style="font-weight:bold; font-size:1.5em;">testHotel</a><br>
								</div>
								<div class="test d4 aa">
									<div class="test dd d5 aa">
										<div class="test imgDiv aa">썸네일</div>
									</div>
									<div class="test dd d6">설명</div>
								</div>
							</div>

							<div class="test d2 dd aa">
								<div class="test d7 aa">가격</div>
								<div class="test d8 aa">
									<button class="detailBtn btn btn-primary btn-block text-white" style="width:70%;">상세보기</button>
								</div>							
							</div>
						</div>
					</li><br>
					
					
				</ul>
				

			</div>          
        </div>
      </section>
      
     

	<section class="section bg-image overlay" style="background-image: url('<%= request.getContextPath() %>/resources/images/hero_4.jpg');" id="section-apply">
        <div class="container" >
          <div class="row align-items-center">
            <div class="col-12 col-md-6 text-center mb-4 mb-md-0 text-md-left" data-aos="fade-up">
              <h2 class="text-white font-weight-bold">제주에서 놀면서 일하실분!</h2>
            </div>
            <div class="col-12 col-md-6 text-center text-md-right" data-aos="fade-up" data-aos-delay="200">
              <!-- Extra large modal -->
              <a href="#" class="btn btn-outline-white-primary py-3 text-white px-5" data-toggle="modal" data-target="#reservation-form">지금 지원하기</a>
            </div>
          </div>
        </div>
      </section>


	<%-- 풋터 --%>
    <%@ include file="../main/footer.jsp" %>

<script src="<%= request.getContextPath() %>/resources/js/jquery-migrate-3.0.1.min.js"></script>
<script src="<%= request.getContextPath() %>/resources/js/popper.min.js"></script>
<script src="<%= request.getContextPath() %>/resources/js/bootstrap.min.js"></script>
<script src="<%= request.getContextPath() %>/resources/js/owl.carousel.min.js"></script>
<script src="<%= request.getContextPath() %>/resources/js/jquery.stellar.min.js"></script>
<script src="<%= request.getContextPath() %>/resources/js/jquery.fancybox.min.js"></script>
<script src="<%= request.getContextPath() %>/resources/js/jquery.easing.1.3.js"></script>     
<script src="<%= request.getContextPath() %>/resources/js/aos.js"></script>      
<script src="<%= request.getContextPath() %>/resources/js/bootstrap-datepicker.js"></script> 
<script src="<%= request.getContextPath() %>/resources/js/jquery.timepicker.min.js"></script> 
<script src="<%= request.getContextPath() %>/resources/js/main.js"></script>

</body>
</html>