<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert 옘병 here</title>
<style>
/* //fd7e14 */
ul.sidebar-menu li a.active1, ul.sidebar-menu li a:hover, ul.sidebar-menu li a:focus
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

.table table-bordered>buttons {
	background: #fd7e14;
	color: #fd7e14;
}
.content-panel{
	padding: 10px;
}
	</style>

<link rel="stylesheet"
	href="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.css">
<script
	src="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.js"></script>
<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 <script>	
 	var data2;

 	$(document).ready(function(){
 		
 			$.ajax({
 				url:"MemSearchTable.ad",
//  				dataType:"JSON",
 				type:"post",
 				success:function(data1){
 					$("#h1").val(data1);
 					data2 ="data:"+ $("#h1").val();
 					console.log("data2 11 "+data2);
 				},
 			});
 			
 			$('#myTable').DataTable({
 				data : data2,
 				columns: [
 					{data:'memNum'},
 					{data:'memId'},
 					{data:'memName'},
 					{data:'memGender'},
 					{data:'memPhone'},
 					{data:'nationCode'},
 					{data:'memPoint'},
 					{data:'memType'},
 					{data:'memStatus'},
 					{data:'enrollDate'},
 					{data:'noShow'}
 			    ]
 				
				});
 			
//  			var table = $('#myTable').DataTable({
//  			     ajax: {
//  			        'url':'MemSearchTable.ad', 
//  			        //'type': 'POST',
// //  			        'dataSrc':
// 					'data':data2
//  			     },
//  			    columns: [
// 					{data:'memNum'},
// 					{data:'memId'},
// 					{data:'memName'},
// 					{data:'memGender'},
// 					{data:'memPhone'},
// 					{data:'nationCode'},
// 					{data:'memPoint'},
// 					{data:'memType'},
// 					{data:'memStatus'},
// 					{data:'enrollDate'},
// 					{data:'noShow'}
// 			    ]
//  			});
 	});
	</script>
<%@ include file="../../../views/adminowner/common/adminSidebar.jsp"%>
</head>
<body>
	<section id="main-content">
		<section class="wrapper site-min-height">
			<h3>
				<i class="fa fa-angle-right"></i> 회원조회
			</h3>
			<br>
			<div class="col-lg-12 mt">
				<div class="row content-panel">
					<input type="hidden" id ="h1">
					<table id="myTable" class="table table-bordered">
						<thead>
							<tr>
								<th>회원 번호</th>
								<th>회원 아이디</th>
								<th>회원 이름</th>
								<th>회원 성별</th>
								<th>회원 전화번호</th>
								<th>회원 국적</th>
								<th>회원 포인트</th>
								<th>회원 타입</th>
								<th>회원 상태</th>
								<th>회원 가입일</th>
								<th>회원 노쇼</th>
							</tr>
						</thead>
						<tbody>
						<tr>
								<td>memNum</td>
								<td>memId</td>
								<td>memName</td>
								<td>memGender</td>
								<td>memPhone</td>
								<td>nationCode</td>
								<td>memPoint</td>
								<td>memType</td>
								<td>memStatus</td>
								<td>enrollDate</td>
								<td>noShow</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</section>
	</section>
	<%@ include file="../../../views/adminowner/common/footer.jsp"%>
</body>
</html>


