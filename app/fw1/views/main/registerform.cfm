<div class="container" ng-controller="registerFormCtrl">
	<div class="row">
		<div class="col-md-6 col-md-offset-3">
			<br>
			<!-- Nav tabs -->
			<ul class="nav nav-tabs" id="userTabs" role="tablist">
				<li class="active"><a href="#user" role="tab" data-toggle="tab" class="big">Login</a>
				</li>
				<li><a href="#new" role="tab" data-toggle="tab" class="big">Register</a>
				</li>
				<li><a href="#reset" role="tab" data-toggle="tab" class="big">Reset Password</a>
				</li>
			</ul>
			<cfoutput>
			<div class="tab-content">
				<div class="tab-pane fade" id="new">
				<br>
				<form class="form-vertical" id="register_form" action=#buildURL('main.register')# method="post" role="form">
					<div class="form-group col-sm-6">					
						<label for="surveyname" class="control-label">#rb.get('firstname')#</label>					
						<input id="firstname" name="firstname" class="form-control input-lg" placeholder="First Name" type="text">
					</div><!-- form-group -->			

					<div class="form-group col-sm-6">					
						<label for="lastname" class="control-label">#rb.get('lastname')#</label>					
						<input id="lastname" name="lastname" class="form-control input-lg" placeholder="Last Name" type="text">
					</div><!-- form-group -->			

					<div class="form-group col-sm-12">					
						<label for="email" class="control-label">#rb.get('email')#</label>					
						<input id="email" name="email" class="form-control input-lg" placeholder="Email Address" type="text">
					</div><!-- form-group -->			
						<div class="form-group col-sm-12">
							<label for="password" class="control-label">#rb.get('password')#</label>					
							<input name="password" id="password" class="form-control input-lg" placeholder="Password" type="password">
			            </div>
						<div class="form-group col-sm-12">
							<label for="confirmpassword" class="control-label">#rb.get('confirmpassword')#</label>					
							<input name="confirmpassword" id="confirmpassword" class="form-control input-lg" placeholder="Password" type="password">
						</div>
					<br>
					<div class=" text-center">
					<button class="btn btn-primary">#rb.get('register')#</button>
					</div>
				</form><!-- form-horizontal -->
				</div>
				<div class="tab-pane fade in active" id="user">
					<br>
					<form class="form-vertical" id="login_form"  action=#buildURL('main.authenticate')# method="post" role="form">
						<div class="form-group col-sm-12">
							<label for="email" class="control-label">#rb.get('email')#</label>					
							<input id="email" name="email" class="form-control input-lg" placeholder="Email Address" type="text">
						</div>
						<div class="form-group col-sm-12">
							<label for="password" class="control-label">#rb.get('password')#</label>					
							<input id="password" name="password" class="form-control input-lg" placeholder="Password" type="password">
						</div>
					<br>
					<div class=" text-center">
					<button class="btn btn-primary">#rb.get('login')#</button>
					</div>
					</form>
				</div>
				<div class="tab-pane fade" id="reset">
	<br>	
					<form class="form-vertical" id="reset_form" ng-submit="requestPasswordReset()">
						<div class="form-group col-sm-12">
							<label for="resetemail" class="control-label">#rb.get('email')#</label>					
							<input ng-model="resetemail" class="form-control input-lg" placeholder="Email Address" type="text">
						</div>
					<br>
					<div class="col-sm-12">
					<p>If you have forgotten your password, please enter your email address and click submit.</p>
					<br>
					<div ng-if="message.text.length > 0" class="alert alert-dismissable" ng-class="message.style">
					<button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>					{{message.text}}	
					</div>
					</div>
					<div class=" text-center col-sm-12">
					<button class="btn btn-primary">#rb.get('submit')#</button>
					</div>
					</form>
				</div>
			</div>
			</cfoutput>
	
			<br>
		</div>
	</div>
</div>
<script>


$.validator.addMethod(
        "regex",
        function(value, element, regexp) {
            var re = new RegExp(regexp);
            return this.optional(element) || re.test(value);
        },
        "8 chars min. Must contain uppercase, lowercase and numeric characters."
);


	$("#register_form").validate(	
		
	{
	rules: {
		email: {
		  required: true,
		  email: true
			} ,
		firstname: "required",
		lastname: "required",
		password: {
			required:true , regex: "^(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z]).{8,}$"
		} ,
		confirmpassword: {
		  equalTo: "#password"
			} 
  		}
	})

    theApp.controller('registerFormCtrl', function ($scope , $http , $timeout ) {

	$scope.showTab = function( tab ) {
		
		$('#userTabs a[href="#' + tab + '"]').tab('show'); 		
	}

	$scope.message = {text:"" , style:"alert-info"};
    $scope.requestPasswordReset = function( ){ 

        $http({
        method  : 'post',
        url     : '/index.cfm/main/requestPasswordReset',
		data: "email=" + this.resetemail, // pass in data as JSON
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        } // set the headers so angular passing info as form data (not request payload)
    }).success( function( data ) { 
    	$scope.message.text = "Thanks! You will shortly receive an email with instructions about resetting your password.";
	})
	
	};
	})

</script>