component extends="framework.one" {

	function setupApplication()

	{

		application.rb = getbeanfactory().getBean("javaRB");

	}

	function setupRequest() {

		request.context.page = structNew();
 		variables.rb = application.rb;
		request.context.page["title"] = "Default Page";
        if (structKeyexists(URL,"trace")) {
		framework.trace = true;
		}

    }

	function failure( exception, event ) { // "private"

			if ( structKeyExists(exception, 'rootCause') ) {
				exception = exception.rootCause;
			}
			writeOutput( '<h1>Something bad happened in #event#</h1>' );
			if ( structKeyExists( request, 'failedAction' ) ) {
				writeOutput( '<p>The action #request.failedAction# failed.</p>' );
			}
			writeOutput( '<h2>#exception.message#</h2>' );
			writeOutput( '<p>#exception.detail# (#exception.type#)</p>' );
			dumpException(exception);
//			dumpException(session);
	//		dumpException(request);

	}

	function loggedIn(  ) { return structKeyExists(session , "IDaccount") } ;

	//function getURL( action ) { return "http://" & CGI.http_host & buildURL( action ) } ;


}
