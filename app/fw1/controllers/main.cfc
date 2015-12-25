component accessors = true {

	property framework;
	property todoservice;

	public void function get( struct rc ) {

		var todobean = todoservice.get(arguments.rc.id);

		framework.renderdata("JSON" , todobean);

	}

	public void function delete( struct rc ) {

		var ret = todoservice.delete(arguments.rc.id);

		framework.renderdata("JSON" , ret);

	}

	public void function list( ) {

		var todos = todoservice.list();

		framework.renderdata("json" , todos);

	}

	public void function save( struct rc ) {

		var todobean = todoservice.save( arguments.rc );

		framework.renderdata("JSON" , todobean);

	}

	public void function test( ) {

		framework.renderdata( "JSON" , todoservice.test() );

	}
	public void function cloud( ) {

		framework.renderdata( "JSON" , entityLoad("cloud") );

	}
}
