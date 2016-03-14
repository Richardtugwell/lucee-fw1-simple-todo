component  {

	// NOTE! These functions return complete ORM Entities which will be rendered by fw.renderData().
	// For production sites and complex objects you probably wouldn't want to do this!!
	// In those cases it's probably best to craft a custom object to return only the properties required.

	public any function list(  ) {

		return entityload( "todo" , {} , "title asc" , {ignorecase=true} );
	}

	public any function get( string id ) {

		var todo  = entityloadByPk( "todo" , arguments.id  );

		if ( isNull( todo ) ) {
			return entityNew( "todo" );
		}

		return todo;
	}

	public any function save( struct rc  ) {

		param name="rc.id" default="0";
		param name="rc.title" default=""  ;
		param name="rc.status" default="new"  ;
		var todobean = get( rc.id );

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
