import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import RadioManager 1.0
import "Radio"

Window {
    visible: true
    width: configurationData.screenWidth    //1024
    height: configurationData.screenHeight  //600

    title: "RadioManager"
    StackView{
        id: stackView
        anchors.fill: parent
        initialItem: HomeScreen{
            onRadioIconClicked: {
                stackView.push(radioPage)
            }
        }

        ConfigurationData{
            id: configurationData
        }

        Component {
            id: radioPage
            Radio {
                onBackButtonClicked: {
                    stackView.pop(radioPage)
                }
            }
        }
        Component{
            id: displayOffPage
            DispayOffScreen{
            }
        }
        Component{
            id: deletePresetPage
            DeletePresets{
            }
        }
//        Component{
//            id: progressBarPageForDelete
//            ProgressBar{
//            }
//        }

    }
}
