component extends="framework.one" {

	function setupApplication()

	{

		application.utils = getbeanfactory().getBean("utils");
		application.rb = getbeanfactory().getBean("javaRB");
        application.authrules = getBeanfactory().getBean( "authorisation" ).getRules();

	}

	function setupRequest() {
	header name='Access-Control-Allow-Origin' value='*' ;

		variables.utils = application.utils;
		request.context.page = structNew();
 		variables.rb = application.rb;
		request.context.page["title"] = "Default Page";
        if (structKeyexists(URL,"trace")) {
		framework.trace = true;
		}

        if (structKeyExists( session , "IDaccount" ) ) {

		var userPermissions = 3;
        }
        else
        {
        var userPermissions = 1;
        }
			request.context.authstuff = getBeanfactory().getBean( "authorisation" ).authorise( userPermissions = userPermissions , resource = getSection()  );
			//dump(var:request.context.authstuff);abort;
			if ( !getBeanfactory().getBean( "authorisation" ).authorise( userPermissions = userPermissions , resource = getSection()  ).authorised )
	        {
				request.context.targetPage = getfullyqualifiedaction();
				redirect("main.registerform" , "targetPage");
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
