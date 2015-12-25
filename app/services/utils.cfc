component accessors = true	{

	public any function getMilliseconds( mydate ) {
				
		return createDateTime( year( mydate ) , month( mydate ) , day( mydate ) , hour( mydate ) , 0 , 0 ).getTime();

	}



}