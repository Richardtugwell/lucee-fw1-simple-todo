component {

	this.sessionManagement="true";
	this.name="#hash(getCurrentTemplatePath())#";
	this.applicationTimeout=CreateTimeSpan(2,0,0,0);
	this.sessionTimeout=CreateTimeSpan(0,1,0,0);
	this.mappings["framework"] = expandpath("../framework");
	this.mappings["application"] = expandpath("../application");
	this.datasources["todos"] = {
		// Embedded hsql db is fine for local testing and POC, but I beleive it will get reset by Heroku on app reloads
		class: 'org.hsqldb.jdbcDriver',
		connectionString: 'jdbc:hsqldb:file:./db/todos'
		// If you want to persist data on Heroku you should probably use Heroku Postgres§
		//class: 'org.postgresql.Driver',
		//connectionString: 'jdbc:postgresql://ec2-107-22-197-152.compute-1.amazonaws.com:5432/d371fthq0lkgsb?ssl=true&sslfactory=org.postgresql.ssl.NonValidatingFactory&user=xxxxxxx&password=xxxxxxx'
	};
	this.datasource="todos";
	this.ormenabled="true";
	this.ormsettings={
		datasource="todos" ,
		logSQL="false" ,
		eventHandling="false" ,
		cfclocation="/application/entities" ,
		savemapping="false",
		dbcreate="update",
		autoManageSession=false,
		flushatrequestend="false"
	};

    function _get_framework_one() {

        if ( !structKeyExists( request, '_framework_one' ) ) {

            // create your FW/1 application:
            request._framework_one = new application.app({
				base : "/application/fw1/" ,
				dilocations : '/application/services',
				unhandledPaths : '/angular',
				reloadApplicationOnEveryRequest : true,
		        generateSES : true,
		        SESOmitIndex : true,
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

}
