component {
    	
	public any function getIDuser(  ) {
        
	    if ( structKeyExists( session , "IDuser" ) ) 
	    	{
	    	if ( len( trim( session['IDuser'] ) ) ) 
	    		{
				return session['IDuser'];
	    		}
	    	else 
	    		return 'Unknown User';
	    	}
	
	}

	public any function getIDaccount(  ) {
        
	    if ( structKeyExists( session , "IDaccount" ) ) 
	    	{
	    	if ( len( trim( session['IDaccount'] ) ) ) 
	    		{
				return session['IDaccount'];
	    		}
	    	else 
	    		return 'Unknown account';
	    	}

	
	    }
	
	public any function getIDsurvey(  ) {
        
	    if ( structKeyExists( session , "IDsurvey" ) ) 
	    	{
	    	if ( len( trim( session['IDsurvey'] ) ) ) 
	    		{
				return session['IDsurvey'];
	    		}
	    	else 
	    		return 'Unknown IDsurvey';
	    	}

	
	    }


}