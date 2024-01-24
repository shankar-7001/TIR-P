import QtQuick 2.0

Rectangle {
    id: mainRectHomeScreen
    property var currentDate :new Date()
    property var month : ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sept","Oct","Nov","Dec"];
    property var days : ["Sun","Mon","Tue","Wed","Thu","Fri","Sat"];

    height: parent.height
    width: parent.width
    color: "grey"
    signal radioIconClicked()

    function formatTime(date, format) {
        return Qt.formatTime(date, format);
    }

    Rectangle{
        id: rectHomeScreenTxt
        height: parent.height *  0.133 //80
        width: parent.width
        color: "dark grey"
        border.width: 1
        anchors.left: parent.left
        Text{
            id: timeText
            text: formatTime(new Date(), "hh:mm");
            font.pixelSize: parent.height * 0.40 //35
            font.bold: true
            anchors.top: parent.top
            anchors.topMargin: parent.height * 0.0625//5
            anchors.horizontalCenter: parent.horizontalCenter
        }
        Text{
            id: dateText
            font.pixelSize: parent.height * 0.30 //30
            anchors.top: timeText.bottom
            anchors.horizontalCenter: timeText.horizontalCenter
        }
    }

    Timer {
        id: timer
        interval: 100
        repeat: true
        running: true
        onTriggered: {
            timeText.text = formatTime(new Date(), "hh:mm");
            var currentDate = new Date();
            var currmonth = month[currentDate.getMonth()];
            var curryear = currentDate.getFullYear();
            var currday = days[currentDate.getDay()];
            var currdate = currentDate.getDate();
            dateText.text = currday + ", " + currmonth + ". " + currdate+ ". "+ curryear;
        }
    }
    Rectangle{
        id: rectHomeScreenBtnIcon
        height: parent.height * 0.866 //520
        width: parent.width
        anchors.top: rectHomeScreenTxt.bottom
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        border.width: 1
        color: "#202020"
        Rectangle{
            id: iconRadio
            height: parent.height * 0.30 //150
            width: parent.width * 0.244 //250
            anchors.centerIn: parent
            radius: parent.height * 0.05 // 5
            color: "grey"
            Text{
                text: "Radio Icon\n        FM"
                font.pixelSize: parent.height * 0.166 //25
                anchors.centerIn: parent
            }
            MouseArea{
                id : mouseAreaForRadioIcon
                anchors.fill: parent
                onPressed: {
                    iconRadio.color =  "#F92F2F"
                }
                onReleased: {
                    iconRadio.color = "grey"
                }
                onClicked: {
                    radioIconClicked()
                }
            }
        }
    }
}
