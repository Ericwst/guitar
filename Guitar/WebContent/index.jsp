<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="domain.GuitarForm"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<title>管理控制台</title>
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

<script src="lib/jQuery-Knob/js/jquery.knob.js" type="text/javascript"></script>
<script type="text/javascript">
	$(function() {
		$(".knob").knob();
	});
</script>


<link rel="stylesheet" type="text/css" href="stylesheets/theme.css">
<link rel="stylesheet" type="text/css" href="stylesheets/premium.css">
</head>
<%
	GuitarForm form = (GuitarForm) session.getAttribute("guitar");
%>
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

	<!--右侧内容 -->
	<div class="content">
		<div class="header">
			<div class="stats">
				<p class="stat">
					<span class="label label-info">5</span> Tickets
				</p>
				<p class="stat">
					<span class="label label-success">27</span> Tasks
				</p>
				<p class="stat">
					<span class="label label-danger">15</span> Overdue
				</p>
			</div>

			<h1 class="page-title">数据统计</h1>
			<ul class="breadcrumb">
				<li><a href="index.jsp">首页</a></li>
				<li class="active">数据统计</li>
			</ul>
		</div>


		<div class="main-content">





			<div class="panel panel-default">
				<a href="#page-stats" class="panel-heading" data-toggle="collapse">Latest
					Stats</a>
				<div id="page-stats" class="panel-collapse panel-body collapse in">

					<div class="row">
						<div class="col-md-3 col-sm-6">
							<div class="knob-container">
								<input class="knob" data-width="200" data-min="0"
									data-max="3000" data-displayPrevious="true" value="2500"
									data-fgColor="#92A3C2" data-readOnly=true;>
								<h3 class="text-muted text-center">Accounts</h3>
							</div>
						</div>
						<div class="col-md-3 col-sm-6">
							<div class="knob-container">
								<input class="knob" data-width="200" data-min="0"
									data-max="4500" data-displayPrevious="true" value="3299"
									data-fgColor="#92A3C2" data-readOnly=true;>
								<h3 class="text-muted text-center">Subscribers</h3>
							</div>
						</div>
						<div class="col-md-3 col-sm-6">
							<div class="knob-container">
								<input class="knob" data-width="200" data-min="0"
									data-max="2700" data-displayPrevious="true" value="1840"
									data-fgColor="#92A3C2" data-readOnly=true;>
								<h3 class="text-muted text-center">Pending</h3>
							</div>
						</div>
						<div class="col-md-3 col-sm-6">
							<div class="knob-container">
								<input class="knob" data-width="200" data-min="0"
									data-max="15000" data-displayPrevious="true" value="10067"
									data-fgColor="#92A3C2" data-readOnly=true;>
								<h3 class="text-muted text-center">Completed</h3>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-sm-6 col-md-6">
					<div class="panel panel-default">
						<div class="panel-heading no-collapse">
							不可伸缩的表格<span class="label label-warning">+10</span>
						</div>
						<table class="table table-bordered table-striped">
							<thead>
								<tr>
									<th>First Name</th>
									<th>Last Name</th>
									<th>Username</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>Mark</td>
									<td>Tompson</td>
									<td>the_mark7</td>
								</tr>
								<tr>
									<td>Ashley</td>
									<td>Jacobs</td>
									<td>ash11927</td>
								</tr>
								<tr>
									<td>Audrey</td>
									<td>Ann</td>
									<td>audann84</td>
								</tr>
								<tr>
									<td>John</td>
									<td>Robinson</td>
									<td>jr5527</td>
								</tr>
								<tr>
									<td>Aaron</td>
									<td>Butler</td>
									<td>aaron_butler</td>
								</tr>
								<tr>
									<td>Chris</td>
									<td>Albert</td>
									<td>cab79</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="col-sm-6 col-md-6">
					<div class="panel panel-default">
						<a href="#widget1container" class="panel-heading"
							data-toggle="collapse">Collapsible </a>
						<div id="widget1container" class="panel-body collapse in">
							<h2>Here's a Tip</h2>
							<p>
								This template was developed with <a
									href="http://middlemanapp.com/" target="_blank">Middleman</a>
								and includes .erb layouts and views.
							</p>
							<p>All of the views you see here (sign in, sign up, users,
								etc) are already split up so you don't have to waste your time
								doing it yourself!</p>
							<p>The layout.erb file includes the header, footer, and side
								navigation and all of the views are broken out into their own
								files.</p>
							<p>If you aren't using Ruby, there is also a set of plain
								HTML files for each page, just like you would expect.</p>
						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-sm-6 col-md-6">
					<div class="panel panel-default">
						<div class="panel-heading no-collapse">
							<span class="panel-icon pull-right"> <a href="#"
								class="demo-cancel-click" rel="tooltip" title="Click to refresh"><i
									class="fa fa-refresh"></i></a>
							</span> Needed to Close
						</div>
						<table class="table list">
							<tbody>
								<tr>
									<td><a href="#"><p class="title">Care Hospital</p></a>
										<p class="info">Sales Rating: 86%</p></td>
									<td>
										<p>Date: 7/19/2012</p> <a href="#">View Transaction</a>
									</td>
									<td>
										<p class="text-danger h3 pull-right" style="margin-top: 12px;">$20,500</p>
									</td>
								</tr>
								<tr>
									<td><a href="#"><p class="title">Custom Eyesight</p></a>
										<p class="info">Sales Rating: 58%</p></td>
									<td>
										<p>Date: 7/19/2012</p> <a href="#">View Transaction</a>
									</td>
									<td>
										<p class="text-danger h3 pull-right" style="margin-top: 12px;">$12,600</p>
									</td>
								</tr>
								<tr>
									<td><a href="#"><p class="title">Clear Dental</p></a>
										<p class="info">Sales Rating: 76%</p></td>
									<td>
										<p>Date: 7/19/2012</p> <a href="#">View Transaction</a>
									</td>
									<td>
										<p class="text-danger h3 pull-right" style="margin-top: 12px;">$2,500</p>
									</td>
								</tr>
								<tr>
									<td><a href="#"><p class="title">Safe Insurance</p></a>
										<p class="info">Sales Rating: 82%</p></td>
									<td>
										<p>Date: 7/19/2012</p> <a href="#">View Transaction</a>
									</td>
									<td>
										<p class="text-danger h3 pull-right" style="margin-top: 12px;">$22,400</p>
									</td>
								</tr>

							</tbody>
						</table>
					</div>
				</div>
				<div class="col-sm-6 col-md-6">
					<div class="panel panel-default">
						<a href="#widget2container" class="panel-heading"
							data-toggle="collapse">Collapsible </a>
						<div id="widget2container" class="panel-body collapse in">
							<h2>Built with Less</h2>
							<p>The CSS is built with Less. There is a compiled version
								included if you prefer plain CSS.</p>
							<p>Fava bean jícama seakale beetroot courgette shallot
								amaranth pea garbanzo carrot radicchio peanut leek pea sprouts
								arugula brussels sprout green bean. Spring onion broccoli
								chicory shallot winter purslane pumpkin gumbo cabbage squash
								beet greens lettuce celery. Gram zucchini swiss chard mustard
								burdock radish brussels sprout groundnut. Asparagus horseradish
								beet greens broccoli brussels.</p>
							<p>
								<a class="btn btn-primary">Learn more »</a>
							</p>
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
