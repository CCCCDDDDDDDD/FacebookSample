import QtQuick 2.2


Rectangle {

  // Properties to set for this view
  property alias imageUrl: profilePicture.source
  property alias name: nameLabel.text
  property alias gender: genderLabel.text
  property alias friends: friendsLabel.text


  // Anchoring settings
  anchors.margins: 20
  height: profilePicture.height + 40


  // Appeareance settings
  border.color: "#D3D6DB"
  border.width: 1
  color: "#fff"
  radius: 6

  Image {
    id: profilePicture

    width: detailsColumn.height
    height: detailsColumn.height

    anchors.top: parent.top
    anchors.topMargin: 20
    anchors.left: parent.left
    anchors.leftMargin: 20
  }

  Column {
    id: detailsColumn
    anchors.left: profilePicture.right
    anchors.top: profilePicture.top

    spacing: 5
    anchors.leftMargin: 20

    Text {
      id: nameLabel
      font.pixelSize: 22
      color: "#3B5998"
    }

    Text {
      id: genderLabel

      font.pixelSize: 16
      color: "#666"
    }

    Text {
      id: friendsLabel
      font.pixelSize: 16
      color: "#666"
    }
  }
}
