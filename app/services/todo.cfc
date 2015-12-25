component  {

	// NOTE! These functions return complete ORM Entities which will be rendered by fw.renderData().
	// For production sites and complex objects you probably wouldn't want to do this!!
	// In those cases it's probably best to craft a custom object to return only the properties required.

	public any function list(  ) {

		var todos  = entityload( "todo" , {} , "title asc" , {ignorecase=true} );

	return todos;

	}

	public any function get( string id ) {

		var todo  = entityloadByPk( "todo" , arguments.id  );

		if ( isNull( todo ) ) {

		var todo  = entityNew( "todo" );

		}

	return todo;

	}

	public any function save( struct rc  ) {

		param name="rc.id" default="0";
		var todobean = get( rc.id );

		param name="rc.title" default=""  ;
		param name="rc.status" default="new"  ;

		transaction {

		todoBean.setTitle( rc["title"] )  ;
		todoBean.setStatus( rc["status"] )  ;

		entitySave( todobean );

		}

	return todobean;

	}

	public any function delete(  string id ) {

		param name="arguments.id" default="0";

		var todoBean  = entityloadByPk( "todo" , arguments.id  );

		if ( not isNull( todoBean ) ) {

		transaction {
			entityDelete( todoBean );
			}
		}

	return id;

	}


}
