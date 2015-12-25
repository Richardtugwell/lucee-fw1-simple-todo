component  {

	rules = createObject("java", "java.util.LinkedHashMap").init() ;
  	rules['main'] = 1;
  	rules['survey*'] = 1;
  	rules['admin*'] = 2;
  	rules['api*'] = 2;
  	rules['email*'] = 1;
  	rules['*'] = 0;

	public struct function authorise( required number userPermissions , required string resource  ) {

	var ret = { "authorised" : false};

	for (keyName in rules) {

		var terminator = right( keyName , 1) eq "*" ? "" : "$";

	    if ( REfindNOCASE( '^' & keyName & terminator , resource) ) {
	       	ret["authkey"] = keyName;
	       	ret["resource"] = resource;
	       	ret["authorised"] = bitAnd( rules[ keyName ] , userpermissions ) gt 0;
			return ret;
	    }

	}

	return ret;

    }

	public struct function getRules( ) {
	    return rules;
    }
}
