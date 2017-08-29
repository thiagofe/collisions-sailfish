import QtQuick 2.0
import Sailfish.Silica 1.0

Row {
    property string label1Text: ""
    property string label3Text: ""
    property alias varA: a
    property alias varB: b

    Text {
        text: label1Text + " ("
        width: parent.width * 0.1
        horizontalAlignment: Text.AlignHCenter
        color: "white"
    }

    TextField {
        id: a
        placeholderText: ""
        width: parent.width * 0.31
        EnterKey.iconSource: "image://theme/icon-m-enter-next"
        EnterKey.onClicked: b.focus = true
        inputMethodHints: Qt.ImhFormattedNumbersOnly
    }

    Text {
        text: "±"
        width: parent.width * 0.1
        horizontalAlignment: Text.AlignHCenter
        color: "white"
    }

    TextField {
        id: b
        placeholderText: ""
        width: parent.width * 0.31
        EnterKey.iconSource: "image://theme/icon-m-enter-close"
        EnterKey.onClicked: focus = false
        inputMethodHints: Qt.ImhFormattedNumbersOnly
    }

    Text {
        text: ") " + label3Text
        width: parent.width * 0.1
        horizontalAlignment: Text.AlignHCenter
        color: "white"
    }

    function getValues() {
        return {a: Number(a.text), b: Number(b.text)}
    }

    function resetValues() {
        a.text = ""
        b.text = ""
    }
}

