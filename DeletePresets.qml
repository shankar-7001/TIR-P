import QtQuick 2.0

Rectangle{

    property int txtSize : Math.sqrt(width * width + height * height)/47.44 //25
    id: mainRectForDeletePresets
    height: parent.height
    width: parent.width
    anchors.centerIn: parent
    color: "#202020"

    Rectangle{
        id: rectMenuBar
        height: parent.height * 0.133 //80
        width: parent.width
        anchors.left: parent.left
        anchors.top: parent.top
        border.width: 1
        color: "dark grey"
        z:2
        Rectangle{
            id: backButton
            border.color: "black"
            border.width: 1
            color: "grey"
            height: parent.height * 0.875 //70
            width: parent.width * 0.115 // 115
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: parent.width * 0.040//40
            Text{
                text: "Back"
                anchors.centerIn: parent
                font.pixelSize: txtSize //parent.height * 0.285
            }
            MouseArea{
                id: mouseAreaForBackButton
                anchors.fill: parent
                onClicked: {
                    if(stackView.contains(deletePresetPage))
                        stackView.pop(deletePresetPage)
                }

                onPressed: {
                    backButton.color =  "#F92F2F"
                }
                onReleased: {
                    backButton.color = "grey"
                }
            }
        }
    }

    ListViewForRadioStation{
        anchors.left: parent.left
        anchors.top: rectMenuBar.bottom
        height: parent.height * 0.733 //440
        width: parent.width
        checkBoxShouldVisibleOrNot: true
        color: "dark grey"
        z:1
        onTaskUnMarkDisable: {
            unMarkAllButton.enabled = false
            unMarkAllButton.color = "grey"
            deleteButton.enabled = false
            deleteButton.color = "grey"
        }

        onTaskUnMarkEnable: {
            unMarkAllButton.enabled = true
            unMarkAllButton.color = "dark grey"
            deleteButton.enabled = true
            deleteButton.color = "dark grey"
        }
    }

    Rectangle{
        id: rectBottomBar
        height: parent.height * 0.133 //80
        width: parent.width
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        border.width: 1
        color: "grey"
        z:1
        Row{
            id: rowForbottomButtons
            height: parent.height
            width: parent.width
            anchors.left: parent.left
            anchors.leftMargin: parent.width * 0.0195 //20
            spacing: parent.width * 0.0195 //20
            anchors.top: parent.top
            z: 2
            Rectangle{
                id: markAllButton
                border.color: "black"
                border.width: 1
                color: "dark grey"
                height: parent.height * 0.875 //70
                width: parent.width * 0.307 // 314
                anchors.verticalCenter: parent.verticalCenter
                Text{
                    text: "Mark All"
                    anchors.centerIn: parent
                    font.pixelSize: txtSize //parent.height * 0.285
                }

                MouseArea{
                    id: mouseAreaForMarkAllButton
                    anchors.fill: parent
                    onClicked:{
                        console.log("Mark All Button Clicked")
                    }
                    onPressed: markAllButton.color =  "#F92F2F"
                    onReleased: markAllButton.color = "dark grey"
                }
            }
            Rectangle{
                id: unMarkAllButton
                border.color: "black"
                border.width: 1
                color: "grey"
                height: parent.height * 0.875 //70
                width: parent.width * 0.307 // 314
                anchors.verticalCenter: parent.verticalCenter
                enabled: false
                Text{
                    text: "Unmark All"
                    anchors.centerIn: parent
                    font.pixelSize: txtSize // parent.height * 0.285
                }
                MouseArea{
                    id: mouseAreaForUnmarkAllButton
                    anchors.fill: parent
                    onClicked:{
                        console.log("UnMark All Button Clicked")
                    }
                    onPressed: unMarkAllButton.color =  "#F92F2F"
                    onReleased: unMarkAllButton.color = "dark grey"
                }
            }

            Rectangle{
                id: deleteButton
                border.color: "black"
                border.width: 1
                color: "grey"
                height: parent.height * 0.875 //70
                width: parent.width * 0.307 // 314
                anchors.verticalCenter: parent.verticalCenter
                enabled: false
                Text{
                    text: "Delete"
                    anchors.centerIn: parent
                    font.pixelSize: txtSize //parent.height * 0.285
                }
                MouseArea{
                    id: mouseAreaForDeleteButton
                    anchors.fill: parent
                    onClicked:{
                        console.log("Delete Button Clicked")
                        progressBarPage.z = 3
                        progressBarPage.visible = true
                        progressBarPage.reset = true
                    }
                    onPressed: deleteButton.color =  "#F92F2F"
                    onReleased: deleteButton.color = "dark grey"
                }
            }
        }
    }

    ProgressBar{
        id: progressBarPage
        height: parent.height * 0.45//270
        width: parent.width * 0.488//500
        anchors.centerIn: parent
    }
}

