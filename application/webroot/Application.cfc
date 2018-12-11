component {

	this.sessionManagement="true";
	this.name="#hash(getCurrentTemplatePath())#";
	this.applicationTimeout=CreateTimeSpan(2,0,0,0);
	this.sessionTimeout=CreateTimeSpan(0,1,0,0);
	this.mappings["framework"] = expandpath("../framework");
	this.mappings["appbase"] = expandpath("../");
	this.datasources["todos"] = {
		// Embedded hsql db. Note that this is not included in the repo
		// If using Heroku deploy it will get recreated everytime the dyno is rebooted
		class: 'org.hsqldb.jdbcDriver',
		connectionString: 'jdbc:hsqldb:file:./application/db/todos'
		// Example ds for Heroku postgres
		// class: 'org.postgresql.driver',
        // connectionString: 'postgres://gfgsvyodgtjewt:ZGzmDpXe241rHK3bTnD3JkKhmj@ec2-107-22-197-152.compute-1.amazonaws.com:5432/d371fthq0lkgsb'
    };
	this.datasource="todos";
	this.ormenabled="true";
	this.ormsettings={
		datasource="todos" ,
		cfclocation="/appbase/entities" ,
		dbcreate="update",
		autoManageSession="false",
		flushatrequestend="false"
	};

    function _get_framework_one() {

        if ( !structKeyExists( request, '_framework_one' ) ) {

            // create your FW/1 application:
            request._framework_one = new appbase.fw1({
				// FW/1 - configuration is defined in root/fw1.cfc:
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
