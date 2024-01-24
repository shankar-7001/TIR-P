import QtQuick 2.0

Rectangle {

    ListModel{
        id: menuListModel
        ListElement{
            name: "Station List"
        }
        ListElement{
            name: "Delete Presets"
        }
        ListElement{
            name: "Scan"
        }
        ListElement{
            name: "Display off"
        }
    }

    ListView{
        id: menuListView
        height: parent.height
        width: parent.width
        model: menuListModel
        interactive: false
        clip: true
        delegate:
            Rectangle{
            border.width: 1
            border.color: "dark grey"
            width: menuListView.width
            height: menuListView.height * 0.25//100
            color: "white"
            Text{
                anchors.centerIn: parent
                text: name
                font.pixelSize: parent.height * 0.48 //48
            }
            MouseArea{
                id: mouseAreaForEachMenuListItem
                anchors.fill: parent
                onClicked: {
                    if(model.name === "Station List")
                        idListViewForRadioStation.visible = !idListViewForRadioStation.visible
                    if(model.name === "Display off")
                        stackView.push(displayOffPage)
                    if(model.name === "Delete Presets")
                        stackView.push(deletePresetPage)
                    rectForMenuList.visible = false
                }
            }
        }
    }
}
