[![Dependency Status](https://www.versioneye.com/user/projects/55a9c89e306535002000016f/badge.svg?style=flat)](https://www.versioneye.com/user/projects/55a9c89e306535002000016f)

##Simple ToDo app using Lucee / FW1 / AngularJS / Bootstrap for deployment on Heroku

Demo: [https://lucee-fw1-todo.herokuapp.com/](https://lucee-fw1-todo.herokuapp.com/) (Note that DB is recreated every time the Heroku dyno is rebooted)

This a simple, but functional application that is intended to illustrate a few useful things for people who are new to any of these technologies. It also provides an super easy way to get a CFML environment and application up and running in literally seconds. Credit for this goes to Mike Sprague and others (see below)

Here are some of the features.

####Lucee

* Build and start a Lucee server using Maven and Foreman
* Deploy a Lucee application to Heroku
* Define per-application mappings and datasources in application.cfc bypassing some of the need to use the Lucee Administrator
* Use Tuckey urelRewrite to lock down the Lucee Administrator

####FW1

* Uses the latest Alpha build of V4.0.0
* Alternative application structure - application.cfc doesn't extend anything -  [documentation](http://framework-one.github.io/documentation/developing-applications.html#alternative-application-structure)
* Application code is located outside the webroot except application.cfc and managed by per-application mappings
* Uses URL routes to implement API calls
* renderData() drives angularJS http.get calls

####Credits - all open source!:

Mike Sprague for his [lucee-heroku-template](https://github.com/writecodedrinkcoffee/lucee-heroku-template) project.

That project also uses the [cfmlprojects.org](http://cfmlprojects.org/artifacts/org/lucee/) Maven repo maintained by [Denny Valliant](https://github.com/denuno). Many thanks to Denny for his work maintaining cfmlprojects.org.

Sean Corfield for [FW1](http://framework-one.github.io/) and much other inspiration

[Lucee Association Switzerland](http://lucee.org/) for a powerful, lightweight JVM language

[AngularJS](https://angularjs.org/) from the folks at Google and [Bootstrap](http://getbootstrap.com/) from Twitter

###Requirements
* [Maven](http://maven.apache.org/) to build the project
* [Foreman](https://github.com/ddollar/foreman) to run locally

###Lucee info
Version 4.5.3.001

Lucee admin settings such as mappings and datasources are defined in application.cfc

###FW1 Notes
Version 4.0.0 Alpha

###Instructions
To get started, run the following commands in GitBash (or your terminal of preference):

```bash
$ git clone https://github.com/Richardtugwell/lucee-fw1-simple-todo.git
$ cd lucee-fw1-simple-todo
$ mvn package
$ foreman start
```
NOTE: On Windows, start foreman with the following command:
```bash
$ foreman start -f Procfile.dev
```

You should now have the ToDo application up and running at [http://localhost:5000](http://localhost:5000).
Start hacking modifying as required.

By default, access to the Lucee server/web admins has remote access blocked. This can be
configured in /webroot/WEB-INF/urlrewrite.xml

To deploy your site to Heroku you need to setup a free Heroku account, install the Heroku toolbelt (Suggested reading: [Getting Started with Java on Heroku](https://devcenter.heroku.com/articles/getting-started-with-java)). Then..

```bash
$ heroku apps:create [NAME]
$ git push heroku master
$ heroku open
```

You should now be looking at your app running on Heroku.

Enjoy!
