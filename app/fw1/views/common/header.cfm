<!DOCTYPE html>
<html ng-app="theApp" lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="google-site-verification" content="EGRA5Vv-kngJaZ8UNPjRrN-Lu8Pd9Em1xXL9PRlgM1w" />
    <!--<meta http-equiv="X-UA-Compatible" content="IE=edge">-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="ico/favicon.ico">

    <title>Lucee - FW1 - Heroku</title>

    <!-- CSS -->
    <link href="/css/bootstrap.css" rel="stylesheet">
	<link href="/css/custom-style.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
	<!-- Custom styles for this template -->
	<script>
	  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
	  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
	  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
	  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

	  ga('create', 'UA-42954876-1', 'intelligentranking.com');
	  ga('send', 'pageview');

	</script>
	<script src="/js/jquery-2.0.2.min.js"></script>
	<script src="/js/jquery.validate.min.js" type="text/javascript"></script>
	<script src="/angular/angular.min.js" type="text/javascript"></script>
	<script src="/angular/app.js" type="text/javascript"></script>
	<script src="/js/bootstrap.js"></script>
	<script src="/js/scripts.js"></script>

  </head>

  <body>

    <!-- Navigation -->
	<div class="navbar navbar-default" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="/"><i class="fa fa-check-square-o"></i> Lucee - FW1 Template</a>
			</div>
			<div class="collapse navbar-collapse">
				<cfif loggedIn()>
				<ul class="nav navbar-nav navbar-right">
<!---					<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">Admin <i class="caret"></i></a>
					<ul class="dropdown-menu">
--->						<cfoutput>
						<li><a href="#buildURL('admin/listsurveys')#">#RB.get('surveys')#</a></li>
						<li><a href="#buildURL('admin/audience')#">#RB.get('audience')#</a></li>
						<li><a href="#buildURL('admin/logout')#">#RB.get('logout')#</a></li>
						</cfoutput>
<!---					</ul>
					</li>--->
				</ul>
				</cfif>
			</div><!--/.nav-collapse -->
		</div>
	</div> <!-- / .navigation -->
	<cfif ( structKeyExists(rc , "message") ) AND ( !structIsEmpty(rc.message) )>
	<cfoutput>
	<div class="col-md-6 col-md-offset-3 alert alert-#rc.message.style#">
	#rc.message.text#
	</div>
	</cfoutput>
	</cfif>
