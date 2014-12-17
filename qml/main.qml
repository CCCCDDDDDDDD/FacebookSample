import QtQuick 2.2
import QtQuick.Window 2.1
import QtQuick.Controls 1.1
import VPlayPlugins.facebook 1.0

Window {
  visible: true
  width: 360
  height: 360

  // The Facebook plugin item
  Facebook {
    licenseKey: "1802219D9DB5B476BA12870EB3692921CF8F51009303CD091C54CAE8FB752667E52DFDA39FAF6DB55FE5A760F8E09C5518FDA3AAAB64BD5A07E7E0565386BEB8295E12AB5D6F1A039A620C08A29EAE1C86BC453C2681BA484B7DD5F16F088F7C5F3C5EE099EA19FF4F2607CD958CB6EB74557077F1757531B322264EB6E095692C6DF37470DF6EC893C8D8E27D957C9F6F7D181D0DDB1CE43ECDC1A4E011BB61"
    id: facebook

    // You have to replace the app id with your own facebook app in case you want to test on Android
    appId: "1405862952975746"
    readPermissions: [ "public_profile", "user_location" ]

    // Handle session state changes
    onSessionStateChanged: {
      if (sessionState === Facebook.SessionOpened) {
        console.debug("Session opened.");
        // Load user's basic profile
        fetchUserDetails()
        // Fetch user details
        getGraphRequest("me")
      }
      else if (sessionState === Facebook.SessionOpening) {
        console.debug("Session opening...");
      }
      else if (sessionState === Facebook.SessionClosed) {
        console.debug("Session closed.");
      }
      else if (sessionState === Facebook.SessionFailed) {
        console.debug("Session failed.");
      }
      else if (sessionState === Facebook.SessionPermissionDenied) {
        console.debug("User denied requested permissions.");
      }
    }

    // Handle the friends request in this callback
    onGetGraphRequestFinished: {
      if (graphPath === "me" && resultState === Facebook.ResultOk) {
        // Parse the result json
        var jsonData = JSON.parse(result)
        profileView.location = jsonData["location"]["name"]
      }
    }
  }

  // We use a simple rectangle to set a background color to the window
  Rectangle {
    anchors.fill: parent
    color: "#E9EAED"

    Column {
      spacing: 20
      anchors.fill: parent
      anchors.margins: 20

      Text {
        font.pixelSize: 22
        color: "#3B5998"
        text: "Your Profile"
      }

      // Profile View
      ProfileView {
        id: profileView

        visible: facebook.sessionState === Facebook.SessionOpened

        name: facebook.profile.firstName
        imageUrl: facebook.profile.pictureUrl
        location: " "
      }

      // Login / Logout Button
      Button {
        id: sessionButton

        text: facebook.sessionState === Facebook.SessionOpened ? "Logout" : "Login"

        onClicked: {
          if (facebook.sessionState === Facebook.SessionOpened) {
            facebook.closeSession()
          }
          else {
            facebook.openSession()
          }
        }
      }

    } // Column

  } // Background Rectangle

}
