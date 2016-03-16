[![Dependency Status](https://www.versioneye.com/user/projects/55a9c89e306535002000016f/badge.svg?style=flat)](https://www.versioneye.com/user/projects/55a9c89e306535002000016f)

##Simple ToDo app using Lucee / FW1 / AngularJS / Bootstrap for deployment on Heroku

Demo: [https://lucee-fw1-todo.herokuapp.com/](https://lucee-fw1-todo.herokuapp.com/) (Note that DB is recreated every time the Heroku dyno is rebooted)

This a simple, but functional application that is intended to illustrate a few useful things for people who are new to any of these technologies. It also provides an super easy way to get a Lucee environment and application up and running in literally seconds. Credit for this goes to Mike Sprague and others (see below). 

Here are some of the features.

####Lucee

* Build and start a Lucee server using Maven and Foreman
* Deploy a Lucee application to Heroku
* Define per-application mappings and datasources in application.cfc bypassing some of the need to use the Lucee Administrator
* Embedded database (HSQL) - no setup!
* Tuckey urlRewrite to lock down the Lucee Administrator

####FW1

* Uses the latest Alpha build of V4.0.0
* Alternative application structure - application.cfc doesn't extend anything -  [documentation](http://framework-one.github.io/documentation/developing-applications.html#alternative-application-structure)
* Application code is located outside the webroot except application.cfc and managed by per-application mappings
* Uses URL routes to implement API calls
* renderData() to drive angularJS http calls

####Angular

* The angularJS functionality is minimal and just really a POC to show how easy it is to use client side frameworks with a Lucee/FW1 backend. With a reasonably sized application you would probably modularise the angular code and implement some kind of build process, also using SASS/LESS to pre process the Bootstrap code.

* Note that in this demo there is only one FW1 section/action - 'main.default' - and it may seem that FW1 is a bit redundant, however for larger applications I've found that separating an application into multiple SPA's based on FW1 sections (or even subsystems/actions) has proved an effective hybrid solution for apps requiring a lot of client side functionality along with backend functionality such as authorisation, customisation, complex business logic etc.

####Credits - all open source!:

Sean Corfield for [FW1](http://framework-one.github.io/) and much other inspiration

[Lucee Association Switzerland](http://lucee.org/) for a powerful, lightweight JVM language

Mike Sprague for his [lucee-heroku-template](https://github.com/writecodedrinkcoffee/lucee-heroku-template) project. That project also uses the [cfmlprojects.org](http://cfmlprojects.org/artifacts/org/lucee/) Maven repo maintained by [Denny Valliant](https://github.com/denuno). Many thanks to Denny for his work maintaining cfmlprojects.org.

[AngularJS](https://angularjs.org/) from the folks at Google and [Bootstrap](http://getbootstrap.com/) from Twitter

###Requirements
* [Maven](http://maven.apache.org/) to build the project
* [Foreman](https://github.com/ddollar/foreman) to run locally

###Instructions
To get started, run the following commands:

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
