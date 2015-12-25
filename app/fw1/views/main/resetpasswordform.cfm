<cfoutput>
<div class="container">
	<div class="row">
		<div class="col-md-6 col-md-offset-3">
		<div class="panel panel-default">
			<div class="panel-heading">
			<h3 class="panel-title">Reset your password</h3>
			</div>				
			<div class="panel-body">
			<p>Passwords must be 8 chars min. Must contain uppercase, lowercase and numeric characters</p>
				<form class="form" id="reset_pwd_form" action=#buildURL('main.setPassword')# method="post" role="form">
					<input type="hidden" name="token" value="#rc.token#">
					<div class="form-group col-sm-12">
						<label for="password" class="control-label">#rb.get('newpassword')#</label>					
						<input name="password" id="password" class="form-control input-lg" placeholder="Password" type="password">
		            </div>
					<div class="form-group col-sm-12">
						<label for="confirmpassword" class="control-label">#rb.get('confirmpassword')#</label>					
						<input name="confirmpassword" id="confirmpassword" class="form-control input-lg" placeholder="Password" type="password">
					</div>
					<br>
					<div class=" text-center">
					<button class="btn btn-primary">#rb.get('submit')#</button>
					</div>
				</form><!-- form-horizontal -->
			</div><!-- body -->
			</div><!-- panel -->		
		</div>
	</div>
</div>
</cfoutput>
<script>

$.validator.addMethod(
        "regex",
        function(value, element, regexp) {
            var re = new RegExp(regexp);
            return this.optional(element) || re.test(value);
        },
        "8 chars min. Must contain uppercase, lowercase and numeric characters."
);


	$("#reset_pwd_form").validate(	
		
	{
	rules: {
		password: {
			required:true , regex: "^(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z]).{8,}$"
		} ,
		confirmpassword: {
		  equalTo: "#password"
			} 
  		}
	})


</script>