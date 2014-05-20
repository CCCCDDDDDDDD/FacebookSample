FacebookSample
==============

This sample project for the V-Play Facebook Plugin connect the app with Facebook and displays information about the current user after a successful login. It also demonstrates how to perform Facebook Graph API GET requests.

Instructions
------------

- Install the Facebook plugin as described here: http://plugins.v-play.net/doc/plugin-installation/#downloading-v-play-plugins

- Android: Open `vendor/facebook/local.properties` and adapt the path to your Android SDK installation

- Open `FaebookSample.pro` in Qt Creator and configure the project for an iOS or Android target

- Android: In case you want to test the plugin on Android you need to create an own Facebook app on http://developers.facebook.com and add your Android signing certificate's key hash to the app. Otherwise you won't be able to login to Facebook with this sample app.

- Run the project and enjoy the ads

Please also have a look at http://plugins.v-play.net/doc/plugin-facebook/ on how to integrate the plugin into your own Qt 5 apps.
