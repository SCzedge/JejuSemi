<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
		int flag = Integer.parseInt(request.getParameter("data"));
    %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js" type="text/javascript"></script>
<style>
  ul.sidebar-menu li a.active5, ul.sidebar-menu li a:hover, ul.sidebar-menu li a:focus {
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

.jin{
	cursor:pointer;
}
/* ul.sidebar-menu li ul.sub li.active a {
    color: #fd7e14;
    -webkit-transition: all 0.3s ease;
    -moz-transition: all 0.3s ease;
    -o-transition: all 0.3s ease;
    -ms-transition: all 0.3s ease;
    transition: all 0.3s ease;
    display: block;
    cursor: pointer;
} */
  </style>
</head>
<body>
        <%@ include file="../../../views/adminowner/common/ownerSidebar.jsp" %>
<section id="main-content">
      <section class="wrapper">
			<div class="col-lg-12 mt">
				<div class="row content-panel">
					<div class="col-lg-10 col-lg-offset-1">
						<div class="invoice-body">
							<div class="pull-left">
								<h1>COMETO JEJU</h1>
								<address>
									<strong>KH정보교육원 '조장이누구조'.Inc.</strong><br> 서울특별시 강남구 테헤란로
									14길 6 남도빌딩 3F<br> (T: 1544-9970 / F: 02-562-2378)<br>
								</address>
							</div>
							<!-- /pull-left -->
							<div class="pull-right">
								<%if(flag == 30){ %>
								<h2>30일 Standard Pack</h2>
								<%}else if(flag == 60){ %>
								<h2>60일 Mega Pack</h2>
								<%}else if(flag == 90){ %>
								<h2>90일 Ultra Pack</h2>
								<%}%>
							</div>
							<!-- /pull-right -->
							<div class="clearfix"></div>
							<br> <br> <br>
							<div class="row">
								<div class="col-md-9">
									<h4><%= loginUser.getMemName() %></h4>
									<address>
										<strong><%= acm.getAcmName() %></strong><br>
										<%= acm.getAcmAddress() %><br>
										<%= acm.getAcmPhone() %> 
									</address>
								</div>
								<!-- /col-md-9 -->
								<div class="col-md-3">
									<br>

								</div>
								<!-- /col-lg-10 -->
								<table class="table">
									<thead>
										<tr>
											<th style="width: 60px" class="text-center">No</th>
											<th class="text-center">구매 목록</th>
											<th style="width: 230px" class="text-right">가격</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td class="text-center">1</td>
											<%if(flag == 30){ %>
											<td class="text-center">30일 Standard Pack</td>
											<%}else if(flag == 60){ %>
											<td class="text-center">60일 Mega Pack</td>
											<%}else if(flag == 90){ %>
											<td>90일 Ultra Pack</td>
											<%}%>
											<%if(flag == 30){ %>
											<td class="text-right">&#8361;300,000</td>
											<%}else if(flag == 60){ %>
											<td class="text-right">&#8361;550,000</td>
											<%}else if(flag == 90){ %>
											<td class="text-right">&#8361;800,000</td>
											<%}%>
										</tr>
										<tr>
											<td colspan="3">
											<h4>구매 후 환불 불가능한 상품입니다.</h4>
												<p>구입해주셔서 감사합니다. 더 좋은 서비스로 보답하겠습니다.
												문제가 있거나 문의 사항이 있으시면 좌측 하단 문의하기를 눌러주세요.</p>
											</td>
										</tr>
									</tbody>
								</table>
								<table>
										<div class="jin well well-small green" align="center" onclick="goDashBoard();">
											<strong>결제완료</strong>
										</div>
								</table>
								<br> <br>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--/col-lg-12 mt -->
      </section>
      <!-- /wrapper -->
    </section>
    <script>
    function goDashBoard(){
  		location.href = "<%= request.getContextPath() %>/page.ow";
  	}
    </script>
    <%@ include file="../../../views/adminowner/common/footer.jsp" %>
</body>
</html>