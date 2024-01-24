import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import ClassRadioFrequencyList 1.0
import ClassFavoriteFreqList 1.0

Rectangle {
    height: parent.height
    width: parent.width
    anchors.centerIn: parent
    signal backButtonClicked()
    property  var ctx
    property int txtSize : Math.sqrt(width * width + height * height)/47.44 //25


    MouseArea{
        anchors.fill : parent
        onClicked: {
            rectForMenuList.visible = false
        }
    }
    RadioFrequencyList{
        id: classRadioFrequencyList
    }

    FavouriteModel{
        id: classFavoriteFreqList
    }

    Rectangle{
        id: rectMenuBar
        height: parent.height * 0.133 //80
        width: parent.width
        anchors.left: parent.left
        anchors.top: parent.top
        border.width: 1
        color: "dark grey"
        z:1
        Row{
            id: rowForMenuAndBackButton
            height: parent.height
            width: parent.width * 0.292 //300
            anchors.right: parent.right
            spacing: parent.width * 0.0195 //20
            anchors.top: parent.top
            z: 2
            Rectangle{
                id: menuButton
                border.color: "black"
                border.width: 1
                color: "grey"
                height: parent.height * 0.875 //70
                width: parent.width * 0.4 // 100
                anchors.verticalCenter: parent.verticalCenter
                Text{
                    text: "Menu"
                    anchors.centerIn: parent
                    font.pixelSize: txtSize //parent.height * 0.285
                }

                MouseArea{
                    id: mouseAreaForMenuButton
                    anchors.fill: parent
                    onClicked:{
                        rectForMenuList.visible = !rectForMenuList.visible
                    }
                    onPressed: {
                        menuButton.color =  "#F92F2F"
                    }
                    onReleased: {
                        menuButton.color = "grey"
                    }
                }
            }
            Rectangle{
                id: backButton
                border.color: "black"
                border.width: 1
                color: "grey"
                height: parent.height * 0.875 //70
                width: parent.width * 0.4 // 100
                anchors.verticalCenter: parent.verticalCenter
                Text{
                    text: "Back"
                    anchors.centerIn: parent
                    font.pixelSize: txtSize //parent.height * 0.285
                }
                MouseArea{
                    id: mouseAreaForBackButton
                    anchors.fill: parent
                    onClicked: {
                        if(idListViewForRadioStation.visible == false && rectForMenuList.visible == false)
                            backButtonClicked()
                        if (idListViewForRadioStation.visible == true)
                            idListViewForRadioStation.visible = false
                        else if (rectForMenuList.visible == true)
                            rectForMenuList.visible = false
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
    }


    Rectangle{
        id: rectRadioMainContent
        height: parent.height * 0.866 //520
        width: parent.width
        anchors.top: rectMenuBar.bottom
        anchors.left: parent.left
        color: "#202020"
        border.width: 1

        ListViewForRadioStation{
            id: idListViewForRadioStation
            visible: false
        }

        Rectangle{
            id: rectForMenuList
            height: parent.height * 0.3846 //200
            width: parent.width * 0.244 // 250
            visible: false
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.right: parent.right
            anchors.rightMargin: parent.width * 0.048
            MenuButtonList{
                anchors.fill: parent
            }
        }

        Rectangle{
            id: rectCurrentPlayingFrequency
            height: parent.height * 0.346 //180
            width: parent.width * 0.2440 //250
            anchors.left: parent.left
            anchors.leftMargin: (idListViewForRadioStation.visible == true)? (parent.width * 0.493) : (parent.width * 0.376) //386 + 119
            anchors.verticalCenter: parent.verticalCenter
            color: "transparent"
            Text{
                text: classRadioFrequencyList.strCurrentPlayingFrequency
                anchors.centerIn: parent
                id: textCurrentPlayingFreq
                font.pixelSize: txtSize * 2.2 //parent.height * 0.26 //50
                //                font.bold: true
                color: "white"
            }
        }


        Rectangle{
            id: leftButton
            height:parent.height * 0.0833//50
            width: parent.width * 0.0878//90
            anchors.left: parent.left
            anchors.leftMargin: (idListViewForRadioStation.visible == true)? (parent.width * 0.395) : (parent.width * 0.2792) //286 + 119
            anchors.verticalCenter: parent.verticalCenter
            color: "grey"
            Text{
                text: "<-"
                anchors.centerIn: parent
                font.pixelSize: txtSize //parent.height * 0.40 //20
            }
            MouseArea{
                id: mouseAreaForLeftButton
                anchors.fill: leftButton
                onPressed: {
                    leftButton.color =  "#F92F2F"
                }
                onReleased: {
                    leftButton.color = "grey"
                }
                onClicked: {
                    console.log("Left Button Clicked !")
                    classRadioFrequencyList.onSeekDownClicked();
                    if(classFavoriteFreqList.isCurrentPlayingFreqIsFav(textCurrentPlayingFreq.text))
                    {
                        canvas.starColor = "yellow"
                        canvas.requestPaint()
                    }
                    else
                    {
                        canvas.starColor = "white"
                        canvas.requestPaint()
                    }
                }
                }

        }

        Rectangle{
            id: rightButton
            height:parent.height * 0.0833//50
            width: parent.width * 0.0878//90
            anchors.left: parent.left
            anchors.leftMargin: (idListViewForRadioStation.visible == true)? (parent.width * 0.795) : (parent.width * 0.679) //696 + 119
            anchors.verticalCenter: parent.verticalCenter
            color: "grey"
            Text{
                text: "->"
                anchors.centerIn: parent
                font.pixelSize: txtSize //parent.height * 0.40 //20
            }
            MouseArea{
                id: mouseAreaForRightButton
                anchors.fill: rightButton
                onPressed: {
                    rightButton.color =  "#F92F2F"
                }
                onReleased: {
                    rightButton.color = "grey"
                }
                onClicked: {
                    console.log("Right Button Clicked !")
                   classRadioFrequencyList.onSeekUpClicked();
                    if(classFavoriteFreqList.isCurrentPlayingFreqIsFav(textCurrentPlayingFreq.text))
                    {
                        canvas.starColor = "yellow"
                        canvas.requestPaint()
                    }
                    else
                    {
                        canvas.starColor = "white"
                        canvas.requestPaint()
                    }
                }
            }
        }

        Rectangle{
            id: rectForFavourite
            anchors.left: parent.left
            anchors.leftMargin: (idListViewForRadioStation.visible == true)? (parent.width * 0.744) : (parent.width * 0.6279) //643 + 119
            anchors.verticalCenter: parent.verticalCenter
            height:parent.height * 0.0833//50
            width: parent.width * 0.0488//50
            color: "#202020"
            Canvas {
                id: canvas

                anchors.fill: parent
                width: 5
                height: 5
                antialiasing: true


                property string starColor: (classFavoriteFreqList.isCurrentPlayingFreqIsFav(textCurrentPlayingFreq.text) === true)? "Yellow" : "white" // Initial color

                onPaint: {
                    var ctx = getContext('2d')

                    // Set the stroke color and line width
                    ctx.strokeStyle = starColor
                    ctx.lineWidth = 4

                    // Set the center of the star
                    var centerX = width / 2
                    var centerY = height / 2

                    // Set the outer and inner radius of the star
                    var outerRadius = Math.min(width, height) / 3
                    var innerRadius = outerRadius / 2

                    // Draw the star
                    ctx.beginPath()
                    for (var i = 0; i < 5; ++i) {
                        // Outer point
                        var outerX = centerX + outerRadius * Math.cos(i * 2 * Math.PI / 5 - Math.PI / 2)
                        var outerY = centerY + outerRadius * Math.sin(i * 2 * Math.PI / 5 - Math.PI / 2)
                        ctx.lineTo(outerX, outerY)

                        // Inner point
                        var innerX = centerX + innerRadius * Math.cos((i + 0.5) * 2 * Math.PI / 5 - Math.PI / 2)
                        var innerY = centerY + innerRadius * Math.sin((i + 0.5) * 2 * Math.PI / 5 - Math.PI / 2)
                        ctx.lineTo(innerX, innerY)
                    }
                    ctx.closePath()

                    // Stroke and fill the star
                    ctx.stroke()
                    ctx.fillStyle = starColor
                    ctx.fill()
                }
            }

            MouseArea{
                id: mouseAreaForFavButton
                anchors.fill: parent
                onClicked:{
                    //classRadioFrequencyList.onFavoriteButtonClicked();
                    canvas.starColor = (canvas.starColor == "yellow")? "white" : "yellow"
                    canvas.requestPaint()
                    console.log(canvas.starColor)
                    classFavoriteFreqList.onFavouriteButtonClicked(textCurrentPlayingFreq.text , classFavoriteFreqList.isCurrentPlayingFreqIsFav(textCurrentPlayingFreq.text))
                    }
            }
        }

    }
//    function resetSelection(){
//        if(canvas.starColor === "yellow"){
//        canvas.starColor = "white";
//        canvas.requestPaint();
//        }
//    }
}


