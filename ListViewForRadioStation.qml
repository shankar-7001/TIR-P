import QtQuick 2.0
import QtQuick.Controls 1.4

Rectangle{
    id : rectForStationList
    height: parent.height
    width: parent.width * 0.263 //270
    anchors.left: parent.left
    anchors.top: parent.top
    color: "dark grey"
    z:1

    property bool checkBoxShouldVisibleOrNot : false
    property int checkCount : 0
    signal taskUnMarkEnable()
    signal taskUnMarkDisable()

    property int txtSize : Math.sqrt(parent.width * parent.width + parent.height * parent.height)/47.44 //25

    ListView {
        id: listViewFrequencies
        width: parent.width
        height: parent.height
        anchors.fill: parent
        clip: true
        interactive : true
        model: classFavoriteFreqList

        delegate: Rectangle {
            id: rectFrequency
            width: listViewFrequencies.width
            height: listViewFrequencies.height * 0.20 //100
            color: (!checkBoxShouldVisibleOrNot && textCurrentPlayingFreq.text === model.name) ? "red" : (checkBoxShouldVisibleOrNot == true)? "#202020" : "grey"
            border.width: 1
            border.color: "dark grey"
            CheckBox{
                id: checkBoxForFrequency
                anchors.left: parent.left
                anchors.leftMargin: parent.width * 0.055 //15
                anchors.verticalCenter: parent.verticalCenter
                checked: model.isChecked
                visible: checkBoxShouldVisibleOrNot
                scale: 1.3
            }

            Text {
                anchors.left : checkBoxForFrequency.right
                anchors.leftMargin: parent.width * 0.055 //15
                anchors.verticalCenter: parent.verticalCenter
                text: model.FreqType
                font.pixelSize: txtSize //parent.height * 0.25
                color: "white"
            }
            MouseArea{
                anchors.fill : parent
                onClicked: {
                    console.log(model.name);
                    classFavoriteFreqList.setData(index, {isChecked: !classFavoriteFreqList.data(index, classFavoriteFreqList.IsCheckedRole)}, classFavoriteFreqList.IsCheckedRole);
                    console.log(model.isChecked + " - " + model.isFav)
                    listViewFrequencies.currentIndex = index
                    if(checkBoxShouldVisibleOrNot == true){
                        model.checked = !model.checked;

                        if(model.checked){
                            rectFrequency.color = "#CC6600"
                            checkCount += 1
                        }
                        else{
                            rectFrequency.color = "#202020"
                            checkCount -= 1
                        }
                        if(0 < checkCount)
                            taskUnMarkEnable()
                        else
                            taskUnMarkDisable()
                    }
                    else{
 //                       textCurrentPlayingFreq.text = model.name
                        classRadioFrequencyList.onListItemClick(model.name);

                    }
                }
            }
        }
}
    Rectangle {
        id: scrollbar
        color: "#E0E0E0"
        width: (checkBoxShouldVisibleOrNot)? (0.015 * listViewFrequencies.width) : (0.0280 * listViewFrequencies.width) // size controlled by width
        height: listViewFrequencies.height    * listViewFrequencies.height / listViewFrequencies.contentHeight
        y: listViewFrequencies.contentY * listViewFrequencies.height / listViewFrequencies.contentHeight
        anchors.right:  listViewFrequencies.right
        visible: (listViewFrequencies.height  < listViewFrequencies.contentHeight)
        clip : true
    }
}
