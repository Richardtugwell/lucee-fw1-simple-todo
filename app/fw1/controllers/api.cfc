component accessors = true { 

	property framework;
	property beanfactory;
	property sessionservice;
	property accountservice;

public any function default( rc  ) {

    framework.renderdata("json" , rc  );
    }

}