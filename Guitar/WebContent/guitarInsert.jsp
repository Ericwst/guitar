<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="domain.GuitarForm"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css"
	href="lib/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="lib/font-awesome/css/font-awesome.css">
<script src="lib/jquery-1.11.1.min.js" type="text/javascript"></script>

<link rel="stylesheet" type="text/css" href="stylesheets/theme.css">
<link rel="stylesheet" type="text/css" href="stylesheets/premium.css">
<!-- 检查用户的学号填写、密码确认、表单是否为空 -->
<script type="text/javascript" src="js/checkUser.js"></script>
<title>吉他添加</title>
</head>
<body class=" theme-blue">
	<script type="text/javascript">
		$(function() {
			var match = document.cookie.match(new RegExp('color=([^;]+)'));
			if (match)
				var color = match[1];
			if (color) {
				$('body').removeClass(function(index, css) {
					return (css.match(/\btheme-\S+/g) || []).join(' ')
				})
				$('body').addClass('theme-' + color);
			}

			$('[data-popover="true"]').popover({
				html : true
			});

		});
	</script>
	<style type="text/css">
#line-chart {
	height: 300px;
	width: 800px;
	margin: 0px auto;
	margin-top: 1em;
}

.navbar-default .navbar-brand, .navbar-default .navbar-brand:hover {
	color: #fff;
}
</style>

	<script type="text/javascript">
		$(function() {
			var uls = $('.sidebar-nav > ul > *').clone();
			uls.addClass('visible-xs');
			$('#main-menu').append(uls.clone());
		});
	</script>

	<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
	<!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

	<!-- Le fav and touch icons -->
	<link rel="shortcut icon" href="../assets/ico/favicon.ico">
	<link rel="apple-touch-icon-precomposed" sizes="144x144"
		href="../assets/ico/apple-touch-icon-144-precomposed.png">
	<link rel="apple-touch-icon-precomposed" sizes="114x114"
		href="../assets/ico/apple-touch-icon-114-precomposed.png">
	<link rel="apple-touch-icon-precomposed" sizes="72x72"
		href="../assets/ico/apple-touch-icon-72-precomposed.png">
	<link rel="apple-touch-icon-precomposed"
		href="../assets/ico/apple-touch-icon-57-precomposed.png">


	<!--[if lt IE 7 ]> <body class="ie ie6"> <![endif]-->
	<!--[if IE 7 ]> <body class="ie ie7 "> <![endif]-->
	<!--[if IE 8 ]> <body class="ie ie8 "> <![endif]-->
	<!--[if IE 9 ]> <body class="ie ie9 "> <![endif]-->
	<!--[if (gt IE 9)|!(IE)]><!-->

	<!--<![endif]-->

	<!--顶部导航栏 -->
	<jsp:include page="adminTop.jsp" flush="true" />

	<!--左边导航栏 -->
	<jsp:include page="adminLeft.jsp" flush="true" />

	<div class="content">
		<div class="header">

			<h1 class="page-title">编辑吉他信息</h1>
			<ul class="breadcrumb">
				<li><a href="index.jsp">首页</a></li>
				<li><a href="guitarAction.do?action=1">吉他</a></li>
				<li class="active">吉他添加</li>
			</ul>

		</div>
		<div class="main-content">


			<div class="row">
				<div class="col-md-4">
					<br>
					<div id="myTabContent" class="tab-content">
						<div class="tab-pane active in" id="home">
							<form action="guitarAction.do?action=2" method="post" name="form">
								<div class="form-group">
									<label>serialNumber</label> <input type="text" value=""
										class="form-control" name="serialNumber">
								</div>
								<div class="form-group">
									<label>price</label> <input type="text" value=""
										class="form-control" name="price">
								</div>
								<div class="form-group">
									<label>builder</label> <input type="text" value=""
										class="form-control" name="builder">
								</div>
								<div class="form-group">
									<label>model</label> <input type="text" value=""
										class="form-control" name="model">
								</div>
								<div class="form-group">
									<label>type</label> <select name="type"
										id="DropDownTimezone" class="form-control" >
										<option value="acoustic">acoustic</option>
										<option value="electric">electric</option>

									</select>
								</div>
								<div class="form-group">
									<label>topWood</label> <input type="text" value=""
										class="form-control" name="topWood">
								</div>
								<div class="form-group">
									<label>backWood</label> <input type="text" value=""
										class="form-control" name="backWood">
								</div>
								<div class="btn-toolbar list-toolbar">
									<a href="guitarInsert.jsp"><button class="btn btn-primary"
											type="submit">
											<i class="fa fa-plus"></i> 添加吉他
										</button></a>
								</div>
							</form>
						</div>

					</div>
				</div>
			</div>


		</div>
	</div>



	<!-- 页面底部 -->
	<jsp:include page="adminFooter.html" flush="true" />


	</div>
	</div>


	<script src="lib/bootstrap/js/bootstrap.js"></script>
	<script type="text/javascript">
		$("[rel=tooltip]").tooltip();
		$(function() {
			$('.demo-cancel-click').click(function() {
				return false;
			});
		});
	</script>

</body>
</html>