import QtQuick 2.0

Rectangle{
    id: mainRectDisplayOffScreen
    property var currentDate :new Date()
    property var month : ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sept","Oct","Nov","Dec"];
    property var days : ["Sun","Mon","Tue","Wed","Thu","Fri","Sat"];

    signal displayOffScreenClicked()
    height: parent.height
    width: parent.width
    color: "grey"
    MouseArea{
        anchors.fill: parent
        onClicked: stackView.pop(displayOffPage);
    }

    function formatTime(date, format) {
        return Qt.formatTime(date, format);
    }

    Rectangle{
        id: rectHomeScreenTxt
        height: parent.height
        width: parent.width
        color: "#202020"
        border.width: 1
        anchors.left: parent.left
        Text{
            id: timeText
            text: formatTime(new Date(), "hh:mm");
            font.pixelSize: parent.height * 0.0583 //35
            font.bold: true
            anchors.centerIn: parent
            color: "white"
        }
        Text{
            id: dateText
            font.pixelSize: parent.height * 0.05 //30
            anchors.top: timeText.bottom
            anchors.horizontalCenter: timeText.horizontalCenter
            color: "white"
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
}
