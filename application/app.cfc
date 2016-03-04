component extends="framework.one" {

	function setupRequest() {

		request.context.page = structNew();
		request.context.page["title"] = "Default Page";

    }

	function onMissingView() {

		return view("main/404");

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
		//	dumpException(session);
		//	dumpException(request);

	}

}
