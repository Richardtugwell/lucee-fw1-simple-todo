component accessors = true { 

	property framework;
	property accountservice;

public any function default( rc  ) {
	
	if ( structKeyExists( session , "IDaccount") ) {
		
		framework.redirect("admin.default");
		}
		
		else framework.setView("main.registerform");
	}
 
public any function getResourceBundle( rc  ) {

    framework.renderdata("json" , rc.dict );  
    }
	

public any function register( rc  ) {
	
	param name="rc.email" default=""; 
	param name="rc.firstname" default=""; 
	param name="rc.lastname" default=""; 
	param name="rc.password" default=""; 
	param name="rc.confirmpassword" default=""; 
	
	var IDaccount = createUUID();

	rc.token = hash(IDaccount);
	rc.message = structNew();

	var data = {
		email=rc.email ,
		firstname=rc.firstname,
		lastname=rc.lastname,
		password=rc.password,
		idaccount = idaccount,
		confirmpassword=rc.confirmpassword,
		validemail=rc.token,
		mailtemplate = framework.view("email/confirmemail")
		 };

	var register = accountservice.register( data );
	
	if ( register.result ) {

		rc.message.text = "Registration successful";
		rc.message.style = "success";
		framework.redirect("main.registrationok");
		}
		else {
		rc.message.text = register.message;
		rc.message.errors = register.errors;
		rc.message.style = "warning";
		framework.redirect("main.registerform" , "message");
			
		}

	}
 
public any function authenticate( rc  ) {
	
	rc.message = structNew();

	var userdata = {
		email=rc.email ,
		password=rc.password
		}
		
	var auth = accountservice.authenticate( userdata )

	if ( auth.result ) {
		
		session.IDaccount = auth['IDaccount']; 
		framework.redirect("admin.default");
	}
	else
		{
		rc.message.text = auth.message;
		rc.message.style = "warning";
		framework.redirect("main.registerform" , "message");
		}
	}
 

public any function confirmemail( rc  ) {
	
	param name="rc.token" default=""; 
	rc.message = structNew();
	if ( accountservice.confirmemail( rc.token ).result ) {
		rc.message.text = "Congratulations - Email verification OK";
		rc.message.style = "success";
		
	}
	else 
	{
		rc.message.text = "Woops - Email verification failed - please check your email";
		rc.message.style = "warning";		
	}	
	
	framework.redirect( "main.registerform" , "message" );

	}

public any function requestPasswordReset( rc  ) {
	
	param name="rc.email" default=""; 

	var ret = structNew();
	ret.msg = "";
	ret.result = false;
	var account = entityload("account" , {email = rc.email} , "true");

	if ( !isNull(account)) {
		
		rc.token = toBase64( account.getPasswordReset( )  ) ;
		var data = {
			email=rc.email,
			mailtemplate = framework.view("email/requestPasswordReset")
		 };
		ret = accountservice.requestPasswordReset( data );
	}
	else ret.msg = "Account not found";

	framework.renderdata("JSON" , ret);	

	}

public any function resetPassword( rc  ) {
	
	param name="rc.token" default=""; 

	var passwordreset = toString( toBinary (rc.token ) );

	var account = entityload("account" , {passwordREset = passwordreset} , "true");

	if ( !isNull(account)) {

	framework.setView("main.resetPasswordForm");	
		
	}
	else {
		
		rc.message = structNew();
		rc.message.text = "Invalid password reset - perhaps token has been used, try requesting a new one";
		rc.message.style = "warning";
		framework.redirect("main.default" , "message");
	}


	}

public any function setPassword( rc  ) {
	
	param name="rc.token" default=""; 

	var passwordreset = toString( toBinary (rc.token ) );

	var account = entityload("account" , {passwordReset = passwordreset} , "true");

	if ( !isNull(account)) {
		
		account.setPassword( hash( rc.password ) );
		account.setPasswordReset( createUUID() );
		entitySave(account);
		ormFlush();
		rc.message = structNew();
		rc.message.text = "Password successfully changed";
		rc.message.style = "info";
		framework.redirect("main.default" , "message");	

	}
	else {
		rc.message = structNew();
		rc.message.text = "An unknown error occurred.  Password was not changed";
		rc.message.style = "warning";
		framework.redirect("main.default" , "message");	
	}
	}



public any function checkEmail( ) {
	
	framework.renderdata("Json" ,  accountservice.checkEmail( "r.tugwellforthmedia.com" ) );

	}

}