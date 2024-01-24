import QtQuick 2.0

Rectangle {
    id: progressBar
    property int size: Math.sqrt(width * width + height * height)/3
    property int lineWidth: 13
    property real value: 0
    property bool reset : false

    property color primaryColor: "#29b6f6"
    property color secondaryColor: "#e0e0e0"
    property int animationDuration: 500


    //    height: parent.height * 0.45//270
    //    width: parent.width * 0.488//500
    color: "Black"
    border.width: 1
    border.color: "white"
    visible: false
    onResetChanged: {
        console.log("reset : ", reset)
        yesButton.visible = true
        noButton.visible = true
        canvas.visible = false
        loadingText.text = "Delete the selected item(s)?"
        value = 0
        reset = false
    }

    onValueChanged: {
        canvas.degree = value * 360;
    }

    Canvas {
        id: canvas
        visible: false
        property real degree: 0

        anchors.fill: parent
        antialiasing: true

        onDegreeChanged: {
            requestPaint();
        }

        onPaint: {
            var ctx = getContext("2d");

            var x = progressBar.width/2;
            var y = progressBar.height/2;

            var radius = progressBar.size/2 - progressBar.lineWidth
            var startAngle = (Math.PI/180) * 270;
            var fullAngle = (Math.PI/180) * (270 + 360);
            var progressAngle = (Math.PI/180) * (270 + degree);

            ctx.reset()

            ctx.lineCap = 'round';
            ctx.lineWidth = progressBar.lineWidth;

            ctx.beginPath();
            ctx.arc(x, y, radius, startAngle, fullAngle);
            ctx.strokeStyle = progressBar.secondaryColor;
            ctx.stroke();

            ctx.beginPath();
            ctx.arc(x, y, radius, startAngle, progressAngle);
            ctx.strokeStyle = progressBar.primaryColor;
            ctx.stroke();
        }

        Behavior on degree {
            NumberAnimation {
                duration: progressBar.animationDuration
            }
        }
    }
    Text {
        id: loadingText
        text: "Delete the selected item(s)?"
        anchors.centerIn: parent
        font.pointSize: size/10//progressBar.height * 0.0925//25
        color: "White"
    }

    Timer {
        id: timerForLoadingAnimation
        interval: 100
        running: false
        repeat: true
        onTriggered: {
            value = value + 0.1;  // Update the value by 0.1
            if(value > 1.5){
                loadingText.text = "Deleted"
            }
            if(value > 2.5)
            {
                timerForLoadingAnimation.running = false
                progressBar.visible = false
            }
        }
    }
    Rectangle{
        id: yesButton
        height: progressBar.height * 0.1851//50
        width: progressBar.width * 0.44 //220
        anchors.bottom: progressBar.bottom
        anchors.left: progressBar.left
        anchors.leftMargin: progressBar.width * 0.04//20
        anchors.bottomMargin: progressBar.height  * 0.0185 //5
        color: "grey"
        Text{
            text: "Yes"
            anchors.centerIn: parent
            font.pixelSize: size/10
        }

        MouseArea{
            anchors.fill: yesButton
            onClicked:{
                yesButton.visible = false
                noButton.visible = false
                canvas.visible = true
                loadingText.text = "Loading"
                timerForLoadingAnimation.running = true
                timerForLoadingAnimation.restart()
                timerForLoadingAnimation.repeat
            }
        }
    }

    Rectangle{
        id: noButton
        height: progressBar.height * 0.1851//50
        width: progressBar.width * 0.44 //220
        anchors.bottom: progressBar.bottom
        anchors.right: progressBar.right
        anchors.rightMargin: progressBar.width * 0.04//20
        anchors.bottomMargin: progressBar.height  * 0.0185 //5
        color: "grey"
        Text{
            text: "No"
            anchors.centerIn: parent
            font.pixelSize: size/10
        }
        MouseArea{
            anchors.fill: noButton
            onClicked:{
                progressBar.visible = false
            }
        }
    }

    Component.onCompleted: {
        console.log("height : ", progressBar.height, "width : ", progressBar.width)
    }
}
