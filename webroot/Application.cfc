component {

	this.sessionManagement="true";
	this.name="#hash(getCurrentTemplatePath())#";
	this.applicationTimeout=CreateTimeSpan(2,0,0,0);
	this.sessionTimeout=CreateTimeSpan(0,1,0,0);
	this.mappings["framework"] = expandpath("../framework");
	this.mappings["app"] = expandpath("../app");
	this.datasources["todos"] = {
	  class: 'org.hsqldb.jdbcDriver',
	  connectionString: 'jdbc:hsqldb:file:./db/todos'
	};
	this.datasource="todos";
	this.ormenabled="true";

	this.ormsettings={
		datasource="todos" ,
		logSQL="false" ,
		eventHandling="false" ,
		cfclocation="/app/entities" ,
		savemapping="false",
		dbcreate="update",
		autoManageSession=false,
		flushatrequestend="false"
	};

    function _get_framework_one() {
        if ( !structKeyExists( request, '_framework_one' ) ) {

            // create your FW/1 application:
            request._framework_one = new app.MyApplication({
				base : "/app/fw1/" ,
				dilocations : '/app/services,/app/lib',
				unhandledPaths : '/angular',
				framework.trace: true,
				reloadApplicationOnEveryRequest : true,
		        generateSES : true,
				routes = [
				  { "$GET/todo/:id" = "/main/get/id/:id" },
				  { "$GET/todo/" = "/main/list" },
				  { "$DELETE/todo/:id" = "/main/delete/id/:id" },
				  { "$POST/todo/" = "/main/save" },
				  { "$GET/*" = "/main/default/" },
				  { "*" = "/main/default/" }
				]

	        })
		}

        return request._framework_one;

    }

    // delegation of lifecycle methods to FW/1:
    function onApplicationStart() {
        return _get_framework_one().onApplicationStart();
    }
    function onError( exception, event ) {
        return _get_framework_one().onError( exception, event );
    }
    function onRequest( targetPath ) {
        return _get_framework_one().onRequest( targetPath );
    }
    function onRequestEnd() {
        return _get_framework_one().onRequestEnd();
    }
    function onRequestStart( targetPath ) {
        return _get_framework_one().onRequestStart( targetPath );
    }
    function onSessionStart() {
        return _get_framework_one().onSessionStart();
    }

	function loggedIn(  ) { return structKeyExists(session , "IDaccount") } ;

	function getURL( action ) { return "http://" & CGI.http_host & buildURL( action ) } ;


}
