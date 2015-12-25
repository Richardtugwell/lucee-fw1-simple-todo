component accessors = true	{

	property emailservice;

public any function checkEmail( email ) {

	return !isNull( entityLoad("account" , {email = email} , "true" ) );

}

public any function register( data  ) {

	var ret = structNew();
	var ret.errors = arrayNew(1);
	var ret.result = true;
	var ret.message = "ok";
	var maildata = structNew();
	/*regex min length 8 , >=1 uppercase, >=1 lowercase , >=1 number , >=1 special
	var pwdcheck = "^(?=.*[A-Z])(?=.*[!@##$&*])(?=.*[0-9])(?=.*[a-z]).{8,}$";
	if (
		( structKeyExists( data , "password" ) )
		AND
		( !arrayLen(REmatch( pwdcheck ,  data.password )) )
		) { arrayappend(ret.errors , "password fails rules"); }
	*/
	if ( !structKeyExists( data , "firstname" ) ) { arrayappend(ret.errors , "firstname is required"); }
	if ( !structKeyExists( data , "lastname" ) ) { arrayappend(ret.errors , "lastname is required"); }
	if ( !structKeyExists( data , "email" ) ) { arrayappend(ret.errors , "email is required"); }
	if ( !structKeyExists( data , "password" ) ) { arrayappend(ret.errors , "password is required"); }
	if ( !structKeyExists( data , "confirmpassword" ) ) { arrayappend(ret.errors , "confirm password is required"); }
	if (
		( structKeyExists( data , "password" ) )
		AND
		( structKeyExists( data , "confirmpassword" ) )
		AND
		( data.password != data.confirmpassword )
		) { arrayappend(ret.errors , "passwords are not equal"); }



	if ( arrayLen(ret.errors) ) {

		ret.result = false;
		ret.message = "validation errors";
		return ret;
		}

	if ( checkEmail( data.email ) )  {

		ret.result = false;
		ret.message = "Duplicate email address";
		return ret;
		}

	try {
	var account = entityNew("account");
	account.setfirstname( data.firstname );
	account.setlastname( data.lastname );
	account.setidaccount( data.IDaccount );
	account.setpassword( hash( data.password ) );
	account.setvalidemail(  data.validemail  );
	account.setpasswordreset(  createUUID() );
	account.setemail( data.email ) ;
	entitySave(account);
	ormFlush();
	maildata.subject = "Confirm Account";
	maildata.to = data.email;
	maildata.template = data.mailtemplate;
	emailservice.sendEmail( maildata );
	}
	catch ( any e ) {
		dump(var:e);abort;
		ret.result = false;
		ret.message = "Failed to register new user";
	}
	return ret;
}

public any function authenticate( data  ) {

	var ret = structNew();
	ret.result=false;
	ret.message="Invalid Login Credentials";

	var account = entityLoad('account', {email=data.email,password=hash(trim(data.password))} , "true");

	if ( !isNull(account) ) {

		if ( account.getIsValid() ) {

			ret["result"] = true;
			ret["idaccount"] = account.getIDaccount();

		}
		else
		{

		ret["result"] = false;
		ret["message"] = "Account validation is not complete. Please check your inbox";

		}

	}

	return ret;

}

public any function confirmemail( token  ) {

	var ret = structNew();
	ret.result=false;

	var account = entityLoad('account', {validemail=token} , "true");
			if ( !isNull(account) ) {

				account.setIsValid(1);
				entitySave(account);
				ormFlush();
				ret.result="true";

				}

	return ret;

}

public any function requestPasswordReset( data  ) {

	var ret = structNew();
	ret.result=false;

	var account = entityLoad('account', {email=data.email} , "true");

	var maildata = structNew();
	maildata.subject = "Intelligent Ranking password request";
	maildata.to = data.email;
	maildata.template = data.mailtemplate;
	ret.result = emailservice.sendEmail( maildata );

	return ret;

}


}
