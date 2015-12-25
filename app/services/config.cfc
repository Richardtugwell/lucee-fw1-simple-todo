component {
    	
	public any function init(  ) {
        
	   	variables.config = {}; 
	
	}

	public any function setConfig( config ) {
        
	   	variables.config = config; 
	
	}

	public any function getConfig( key  ) {
        
	    if ( structKeyExists( arguments , key ) ) 
	    	{
	    	if ( structKeyExists( config , key ) )
	    		{
				return config[ key];
	    		}
	    	else 
	    		return 'Unknown key';
	    	}

	    else return config;
	
	    }
	


}