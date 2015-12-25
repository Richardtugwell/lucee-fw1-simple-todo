component accessors = true { 

	property framework;
 
public any function default( rc  ) {
	
	}
 	
public any function logout(  ) {
	
	structClear(session);
    framework.redirect('main.registerform'); 

	}

}