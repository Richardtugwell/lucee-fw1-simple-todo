component {

	this.sessionManagement="true";
	this.name="#hash(getCurrentTemplatePath())#";
	this.applicationTimeout=CreateTimeSpan(2,0,0,0);
	this.sessionTimeout=CreateTimeSpan(2,0,0,0);
	this.mappings["framework"] = expandpath("../framework");
	this.mappings["app"] = expandpath("../app");

    function _get_framework_one() {
        if ( !structKeyExists( request, '_framework_one' ) ) {

            // create your FW/1 application:
            request._framework_one = new app.MyApplication({
				base : "/app/fw1/" ,
				trace : "false" ,
				dilocations : '/app/services,/app/lib',
		        reloadApplicationOnEveryRequest : true,
				unhandledPaths : '/angular',
		        generateSES : true
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
