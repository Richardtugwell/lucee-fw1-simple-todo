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

	public any function test( ) {

		var theDay = createDate(2015, 1, 1)

		while ( theDay <= createDate(2015, 12, 31) ) {
			transaction {
				var refDate = entityNew("almanac")
				refDate.setIDdate(theDay)
				refDate.setTheMonth(datePart("m" , theDay))
				refDate.setTheWeek(datePart("ww" , theDay))
				refDate.setTheDay(datePart("d" , theDay))
				entitySave(refDate)
				theDay = dateAdd("d" , 1 , theDay)
			}
		}

		var r = [];
		theDay = createDate(2015, 1, 1)
		while ( theDay <= createDate(2015, 12, 31) ) {
			for ( var a = 1; a < 4; a++) {
				for ( var b = 1; b < 3; b++) {
					for ( var d = 1; d < 4; d++) {
						for ( var e = 1; e < 10; e++) {
							var test = entityNew("cloud")
							test.setAccount(d)
							test.setProject(a)
							test.setV(RandRange(250, 650))
							test.setProvider(b)
							test.setService(e)
							test.setTheDate(theDay)
							entitySave(test)
						}

					}
				}
			}
			theDay = dateAdd("d" , 1 , theDay)
		}
		ormflush()
	return "ok"

	}


}
