component {
    	
	public any function authenticate( required string userID , required string password  ) {
        
        var ret = {};
        
        ret['authorised'] = false;
        ret['iduser'] = 0;
        ret['message'] = "";

		var userBean = entityload( "user" , {userid = userID , password = hash(password) } , "true" );
		
		if (!isNull(userBean)) {
		
			if ( userBean.getIsValid() ) {

			ret["authorised"] = true;
		
			ret["iduser"] = userBean.getiduser();
    	
			}
			else
			{
				
			ret["authorised"] = false;
			ret["message"] = "Email validation required. Please check your inbox";
				
			}
		}
	
	return ret;
	
	}

	public any function getAuthKey() {

		return "T1234Uai78ps";	
		
	}

}