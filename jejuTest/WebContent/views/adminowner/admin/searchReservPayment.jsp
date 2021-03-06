<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"  import="adminowner.admin.model.vo.*, java.util.*"%>
<%
	
	AdminIndex ai = (AdminIndex)request.getAttribute("ai");
	int uCount =ai.getuCount();
	int oCount =ai.getoCount();
	int pTotal =ai.getpTotal();
%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../../../views/adminowner/common/adminSidebar.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Come To Jeju -</title>
<style>
ul.sidebar-menu li a.active6, ul.sidebar-menu li a:hover, ul.sidebar-menu li a:focus
	{
	background: #fd7e14;
	color: #fff;
	display: block;
	-webkit-transition: all 0.3s ease;
	-moz-transition: all 0.3s ease;
	-o-transition: all 0.3s ease;
	-ms-transition: all 0.3s ease;
	transition: all 0.3s ease;
	cursor: pointer;
}

ul.sidebar-menu li ul.sub li.active a {
	color: #fd7e14;
	-webkit-transition: all 0.3s ease;
	-moz-transition: all 0.3s ease;
	-o-transition: all 0.3s ease;
	-ms-transition: all 0.3s ease;
	transition: all 0.3s ease;
	display: block;
	cursor: pointer;
}

.panel-heading {
	margin: 15px;
}
.inline {
	display:inline;
	align:right;
}
.pagingArea{
	align:right;
	float:right;
}
.content-panel{
margin-bottom:10px;
}
</style>
</head>
<body>
<script>

$(function(){
	ajaxP();
	ajaxR();
});



//PaymentAjax
var pCurrentPage;
var ppBoardLimit;
var pPageLimit;
var pMaxPage;
var pStartPage;
var pEndPage;
var pBoardLimit; 
function ajaxP(){
	$.ajax({
		url:"paymentAjax.ad",
		dataType:"json",
		type:"post",
		data:{pCurrentPage:pCurrentPage},
		success:function(data){
			var $tableBody = $("#myTable1 tbody");
			$tableBody.html("");
			
			$.each(data.pArr, function(index,value) {//data [index]
				var $tr = $("<tr>");//<tr></tr>
				
				var $payNumTd = $("<td>").text(value.payNum);
				var $resNumTd = $("<td>").text(value.resNum);
				var $payPriceTd = $("<td>").text(value.payPrice);
				var $confirmNumTd = $("<td>").text(value.confirmNum);
				var $payMethodTd = $("<td>").text(value.payMethod);
				var $paycanelTd = $("<td>").text(value.paycanel);
				var $payDateTd = $("<td>").text(value.payDate);
				var $cancelDateTd = $("<td>").text(value.cancelDate);

				$tr.append($payNumTd);
				$tr.append($resNumTd);
				$tr.append($payPriceTd);
				$tr.append($confirmNumTd);
				$tr.append($payMethodTd);
				$tr.append($paycanelTd);
				$tr.append($payDateTd);
				$tr.append($cancelDateTd);

				$tableBody.append($tr);
			});
			
			pCurrentPage = data.pObj.pCurrentPage;
			ppBoardLimit = data.pObj.pBoardLimit;
			pPageLimit = data.pObj.pPageLimit;
			pMaxPage = data.pObj.pMaxPage;
			pStartPage = data.pObj.pStartPage;
			pEndPage  = data.pObj.pEndPage;
			pBoardLimit = data.pObj.pBoardLimit;
			
			
			if(pCurrentPage==1){
				$('#prevP').attr('disabled',true);
			}else{
				$('#prevP').attr('disabled',false);
			}
			if(pCurrentPage==pMaxPage){
				$('#nextP').attr('disabled',true);
			}else{
				$('#nextP').attr('disabled',false);
			}
			
			$('#btnAreaP').empty();
			var $div =$('#btnAreaP')
			for(var i = pStartPage ; i <= pEndPage ; i++){        //시작페이지부터 종료페이지까지 반복문
	        	if(pCurrentPage == i){                            //현재페이지가 반복중인 페이지와 같다면
	               	$div.append("<button class=\"btn\" disabled >"+i+"</button>");    //버튼 비활성화
	        	}else{
	               	$div.append("<button class=\"btn\" onclick=\"pgBtnP("+i+");\">"+i+"</button>");    //버튼 비활성화
	        	}
	        }
		}//success end
	});//$ajax end
};//function ajax() end
function pgBtnP(i){
	pCurrentPage=i;
	ajaxP();
};
function prevP(){
	pCurrentPage =pCurrentPage-1;
	ajaxP();
}
function nextP(){
	pCurrentPage =pCurrentPage+1;
	ajaxP();
}
//PaymentAjax End.


//ReservationAjax
var rCurrentPage;
var rpBoardLimit;
var rPageLimit;
var rMaxPage;
var rStartPage;
var rEndPage;
var rBoardLimit; 
function ajaxR(){
	$.ajax({
		url:"reservAjax.ad",
		dataType:"json",
		type:"post",
		data:{rCurrentPage:rCurrentPage},
		success:function(data){
			var $tableBody = $("#myTable2 tbody");
			$tableBody.html("");
			
			$.each(data.rArr, function(index,value) {//data [index]
				var $tr = $("<tr>");//<tr></tr>
				
				var $reservNumTd = $("<td>").text(value.reservNum);
				var $memNameTd = $("<td>").text(value.memName);
				var $acmNameTd = $("<td>").text(value.acmName);
				var $roomNameTd = $("<td>").text(value.roomName);
				var $reservPaxTd = $("<td>").text(value.reservPax);
				var $checkInDateTd = $("<td>").text(value.checkInDate);
				var $checkOutDateTd = $("<td>").text(value.checkOutDate);
				var $reservPriceTd = $("<td>").text(value.reservPrice);
				var $reservCancelTd = $("<td>").text(value.reservCancel);
				var $reservDateTd = $("<td>").text(value.reservDate);
				var $cancelDateTd = $("<td>").text(value.cancelDate);
				var $reservRequireTd = $("<td>").text(value.reservRequire);
				var $noShowTd = $("<td>").text(value.noShow);
				var $statusTd = $("<td>").text(value.status);

				$tr.append($reservNumTd);
				$tr.append($memNameTd);
				$tr.append($acmNameTd);
				$tr.append($roomNameTd);
				$tr.append($reservPaxTd);
				$tr.append($checkInDateTd);
				$tr.append($checkOutDateTd);
				$tr.append($reservPriceTd);
				$tr.append($reservCancelTd);
				$tr.append($reservDateTd);
				$tr.append($cancelDateTd);
				$tr.append($reservRequireTd);
				$tr.append($noShowTd);
				$tr.append($statusTd);

				$tableBody.append($tr);
			});
			
			rCurrentPage = data.rObj.rCurrentPage;
			rpBoardLimit = data.rObj.rBoardLimit;
			rPageLimit = data.rObj.rPageLimit;
			rMaxPage = data.rObj.rMaxPage;
			rStartPage = data.rObj.rStartPage;
			rEndPage  = data.rObj.rEndPage;
			rBoardLimit = data.rObj.rBoardLimit;
			
			
			if(rCurrentPage==1){
				$('#prevR').attr('disabled',true);
			}else{
				$('#prevR').attr('disabled',false);
			}
			if(rCurrentPage==rMaxPage){
				$('#nextR').attr('disabled',true);
			}else{
				$('#nextR').attr('disabled',false);
			}
			
			$('#btnAreaR').empty();
			var $div =$('#btnAreaR')
			for(var i = rStartPage ; i <= rEndPage ; i++){        //시작페이지부터 종료페이지까지 반복문
	        	if(rCurrentPage == i){                            //현재페이지가 반복중인 페이지와 같다면
	               	$div.append("<button class=\"btn\" disabled >"+i+"</button>");    //버튼 비활성화
	        	}else{
	               	$div.append("<button class=\"btn\" onclick=\"pgBtnR("+i+");\">"+i+"</button>");    //버튼 비활성화
	        	}
	        }
		}//success end
	});//$ajax end
};//function ajax() end
function pgBtnR(i){//1~5버튼들
	rCurrentPage=i;
	ajaxR();
};
function prevR(){//뒤로가기
	rCurrentPage =rCurrentPage-1;
	ajaxR();
}
function nextR(){//앞으로가기
	rCurrentPage =rCurrentPage+1;
	ajaxR();
}



</script>
	<section id="container">
		<!-- **********************************************************************************************************************************************************
        MAIN CONTENT
        *********************************************************************************************************************************************************** -->
		<!-- main content start-->
		<section id="main-content">
			<section class="wrapper site-min-height">
			<div class="row mt">
				<div class="col-lg-12">
					<div class="row content-panel">
						<div class="col-md-4 profile-text mt mb centered">
							<div class="right-divider hidden-sm hidden-xs">
								<h4><%=uCount %></h4>
								<h6>유저 수</h6>
								<h4><%=oCount %></h4>
								<h6>숙소 수</h6>
								<h4>
									￦<%=pTotal %></h4>
								<h6>누적 수입</h6>
							</div>
						</div>
						<!-- /col-md-4 -->
						<div class="col-md-4 profile-text">
							<h3><%= loginUser.getMemName() %></h3>
							<h6>Main Administrator</h6>
							<p>Welcome to jeju.</p>
							<br>
							<p>
<!-- 								<button class="btn btn-theme" onclick="acmApproval();"> -->
<!-- 									<i class="fa fa-envelope"></i> 문의 확인 -->
<!-- 								</button> -->
							</p>
						</div>
						<!-- /col-md-4 -->
						<div class="col-md-4 centered">
							<div class="profile-pic">
								<p>
									<img
										src="<%=request.getContextPath()%>/resources/adminowner/img/jejuMain.png"
										class="img-circle">
								</p>
							</div>
						</div>
						<!-- /col-md-4 -->
					</div>
					<!-- /row -->
				</div>
					<!-- /col-lg-12 -->
					<div class="col-lg-12 mt">
						<div class="row content-panel">
							<div class="panel-heading">
								<ul class="nav nav-tabs nav-justified">
									
									<li id="li1" class="active">
									<a data-toggle="tab"  href="#paymentList" class="contact-map">결제 조회</a>
									</li>
									
									<li id="li2" >
									<a data-toggle="tab" href="#reservationList">예약 조회</a>
									
									</li>
								</ul>

							</div>
							<!-- /panel-heading -->
							<div class="panel-body">
								<div class="tab-content">
								
									<div id="paymentList" class="tab-pane active">
										<div class="col-md-12 mt">
											<div id="hide1" class="content-panel">
												<table id="myTable1" class="table table-hover table-bordered display"
													style="font-size: 13px;">
													<thead>
														<tr>
															<th>결제 번호</th>
															<th>예약 번호</th>
															<th>결제 금액</th>
															<th>승인 번호</th>
															<th>결제 수단</th>
															<th>결제 취소</th>
															<th>결제일시</th>
															<th>결체 취소일</th>
														</tr>
													</thead>
													<tbody>
													</tbody>
												</table>
												<div id="pagingAreaP" class="pagingArea inline" align="right">
												<br>
													<button id="prevP" class="btn btn-default" onclick="prevP();" >&lt; previous</button>
													
													<div id = "btnAreaP" class="inline"></div>
													
													<button id="nextP" class="btn btn-default" onclick="nextP();" >next &gt;</button>
												</div>	
											</div>
										</div>
									</div>
									<!-- /tab-pane -->



									<!-- 									공지사항작성 -->
									<div id="reservationList" class="tab-pane">
										<div class="col-md-12 mt">
											<div id="hide2" class="content-panel">
												<table id="myTable2" class="table table-hover table-bordered display"
													style="font-size: 13px;">
													<thead>
														<tr>
															<th>번호</th>
															<th>숙소</th>
															<th>룸</th>
															<th>예약자</th>
															<th>인원</th>
															<th>체크인</th>
															<th>체크아웃</th>
															<th>가격</th>
															<th>예약일</th>
															<th>취소</th>
															<th>취소일</th>
															<th>요구사항</th>
															<th>노쇼</th>
															<th>상태</th>
														</tr>
													</thead>
													<tbody>
													</tbody>
												</table>												
												<div id="pagingAreaR" class="pagingArea inline" align="right">
												<br>
													<button id="prevR" class="btn btn-default" onclick="prevR();" >&lt; previous</button>
													
													<div id = "btnAreaR" class="inline"></div>
													
													<button id="nextR" class="btn btn-default" onclick="nextR();" >next &gt;</button>
												</div>		
											</div>
											<!-- /col-lg-8 -->
										</div>
									</div>

								</div>
								<!-- /tab-content -->
							</div>
							<!-- /panel-body -->
						</div>
						<!-- /col-lg-12 -->
					</div>
					<!-- /row -->
				</div>
				<!-- /container -->
			</section>
			<!-- /wrapper -->
		</section>
		<!-- main content end-->
		<%@ include file="../../../views/adminowner/common/footer.jsp"%>
	</section>

</body>
</html>