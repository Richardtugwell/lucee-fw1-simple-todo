[![Dependency Status](https://www.versioneye.com/user/projects/55a9c89e306535002000016f/badge.svg?style=flat)](https://www.versioneye.com/user/projects/55a9c89e306535002000016f)

##Simple ToDo app using Lucee / FW1 / AngularJS / Bootstrap for deployment on Heroku

Demo: [https://lucee-fw1-todo.herokuapp.com/](https://lucee-fw1-todo.herokuapp.com/) (Note that DB is recreated every time the Heroku dyno is rebooted)

####Credits/Notes:
This began as a fork of Mike Sprague's [lucee-heroku-template](https://github.com/writecodedrinkcoffee/lucee-heroku-template) project.

This project uses the [cfmlprojects.org](http://cfmlprojects.org/artifacts/org/lucee/) Maven repo maintained by [Denny Valliant](https://github.com/denuno). Many thanks to Denny for his work maintaining cfmlprojects.org.

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
