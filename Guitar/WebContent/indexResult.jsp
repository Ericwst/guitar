<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="domain.GuitarForm"%>
<%
	List list = (List) request.getAttribute("list");
	int number = Integer.parseInt((String) request.getAttribute("number"));
	int maxPage = Integer.parseInt((String) request.getAttribute("maxPage"));
	int pageNumber = Integer.parseInt((String) request.getAttribute("pageNumber"));
	int start = number * 12;//
	int over = (number + 1) * 12;//
	int count = pageNumber - over;//
	if (count <= 0) {
		over = pageNumber;
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<title>吉他查询</title>
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
</head>
<%
	GuitarForm form = (GuitarForm) session.getAttribute("guitar");
%>
<body class=" theme-blue">

	<!-- Demo page code -->

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

	<!--右边正文 -->
	<div class="content">
		<div class="header">

			<h1 class="page-title">吉他查询</h1>
			<ul class="breadcrumb">
				<li><a href="index.jsp">首页</a></li>
				<li class="active">吉他查询</li>
			</ul>

		</div>

		<div class="main-content">

			<div class="btn-toolbar list-toolbar">
				<a href="guitarInsert.jsp"><button class="btn btn-primary">
						<i class="fa fa-plus"></i> 添加吉他
					</button></a>
			</div>


			<!-- 搜索条件 -->
			<form action="guitarAction.do?action=1" method="post" name="form">
				<table>
					<tr>
						<td width="8%">serialNumber</td>
						<td>price</td>
						<td>builder</td>
						<td>model</td>
						<td>type</td>
						<td>topWood</td>
						<td>backWood</td>
					</tr>
					<tr>
						<td>
							<div class="input-group search pull-right hidden-sm hidden-xs">
								<div class="input-group">
									<span class="input-group-btn"><input type="text"
										name="serialNumber" class="form-control"></span>


								</div>
							</div>
						</td>
						<td>
							<div class="input-group search pull-right hidden-sm hidden-xs">
								<div class="input-group">
									<span class="input-group-btn"><input type="text"
										name="price" class="form-control"> </span>

								</div>
							</div>
						</td>
						<td>
							<div class="input-group search pull-right hidden-sm hidden-xs">
								<div class="input-group">
									<span class="input-group-btn"><input type="text"
										name="builder" class="form-control"> </span>

								</div>
							</div>
						</td>
						<td>
							<div class="input-group search pull-right hidden-sm hidden-xs">
								<div class="input-group">
									<span class="input-group-btn"><input type="text"
										name="model" class="form-control"> </span>

								</div>
							</div>
						</td>
						<td>
							<div class="input-group search pull-right hidden-sm hidden-xs">
								<div class="input-group">
									<span class="input-group-btn"><input type="text"
										name="type" class="form-control"> </span>

								</div>
							</div>
						</td>
						<td>
							<div class="input-group search pull-right hidden-sm hidden-xs">
								<div class="input-group">
									<span class="input-group-btn"><input type="text"
										name="topWood" class="form-control"> </span>

								</div>
							</div>
						</td>
						<td>
							<div class="input-group search pull-right hidden-sm hidden-xs">
								<div class="input-group">
									<span class="input-group-btn"><input type="text"
										name="backWood" class="form-control"> </span>


								</div>
							</div>
						</td>
						<td>
							<div class="input-group search pull-right hidden-sm hidden-xs">
								<div class="input-group">
									<button class="btn btn-primary" type="submit">
										<i class="fa fa-search "></i>
									</button>

								</div>
							</div>
						</td>
					</tr>
				</table>
			</form>

			<div class="btn-group"></div>
			<table class="table">
				<thead>
					<tr>
						<th>序列号</th>
						<th>价格</th>
						<th>制造商</th>
						<th>型号</th>
						<th>类型</th>
						<th>正面</th>
						<th>反面</th>
						<th style="width: 3.5em;"></th>

					</tr>
				</thead>
				<tbody>
					<%
						for (int i = start; i < over; i++) {
							GuitarForm guitarForm = (GuitarForm) list.get(i);
					%>
					<tr bgcolor="#FFFFFF">
						<td height="30"><div align="center"><%=guitarForm.getSerialNumber()%></div></td>
						<td><div align="center"><%=guitarForm.getPrice()%></div></td>
						<td><div align="center"><%=guitarForm.getBuilder()%></div></td>
						<td><div align="center"><%=guitarForm.getModel()%></div></td>
						<td><div align="center"><%=guitarForm.getType()%></div></td>
						<td><div align="center"><%=guitarForm.getTopWood()%></div></td>
						<td><div align="center"><%=guitarForm.getBackWood()%></div></td>
						<td><div align="center">
								<a
									href="guitarAction.do?action=3&serialNumber=<%=guitarForm.getSerialNumber()%>">删除</a>
							</div></td>
						<%
							}
						%>
					</tr>
				</tbody>
			</table>

			<div id="div3">
				<table width="90%" border="0" align="center" cellpadding="0"
					cellspacing="0">
					<tr align="center">
						<td width="13%">共<%=maxPage%>页
						</td>
						<td width="16%">共<%=pageNumber%>条记录
						</td>
						<td width="14%">当前第<%=number + 1%>页
						</td>
						<td width="19%">
							<%
								if ((number + 1) == 1) {
							%> 上一页 <%
								} else {
							%> <a href="guitarAction.do?action=1&i=<%=number - 1%>">上一页</a>
						</td>
						<%
							}
						%>
						<td width="18%">
							<%
								if (maxPage <= (number + 1)) {
							%> 下一页 <%
								} else {
							%> <a href="guitarAction.do?action=1&i=<%=number + 1%>">下一页</a>
						</td>
						<%
							}
						%>


					</tr>
				</table>
			</div>

			<%-- 			<div class="modal small fade" id="myModal" tabindex="-1"
				role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">×</button>
							<h3 id="myModalLabel">Delete Confirmation</h3>
						</div>
						<div class="modal-body">
							<p class="error-text">
								<i class="fa fa-warning modal-icon"></i>Are you sure you want to
								delete the user?<br>This cannot be undone.
							</p>
						</div>
						<div class="modal-footer">
							<button class="btn btn-default" data-dismiss="modal"
								aria-hidden="true">Cancel</button>
								<% %>
							<button href="deletedata?userId=<%=request.getParameter("userId")%>" class="btn btn-danger" data-dismiss="modal">Delete</button>
						</div>
					</div>
				</div>
			</div> --%>


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
