/*******************************************************************************
**
** Copyright (C) 2022 ru.auroraos
**
** This file is part of the Моё приложение для ОС Аврора project.
**
** Redistribution and use in source and binary forms,
** with or without modification, are permitted provided
** that the following conditions are met:
**
** * Redistributions of source code must retain the above copyright notice,
**   this list of conditions and the following disclaimer.
** * Redistributions in binary form must reproduce the above copyright notice,
**   this list of conditions and the following disclaimer
**   in the documentation and/or other materials provided with the distribution.
** * Neither the name of the copyright holder nor the names of its contributors
**   may be used to endorse or promote products derived from this software
**   without specific prior written permission.
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
** AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
** THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
** FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
** IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
** FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY,
** OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
** PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
** LOSS OF USE, DATA, OR PROFITS;
** OR BUSINESS INTERRUPTION)
** HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
** WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE)
** ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
** EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
**
*******************************************************************************/

import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    objectName: "mainPage"
    allowedOrientations: Orientation.All

    PageHeader {
        objectName: "pageHeader"
        title: qsTr("lab1")
        extraContent.children: [
            IconButton {
                objectName: "aboutButton"
                icon.source: "image://theme/icon-m-about"
                anchors.verticalCenter: parent.verticalCenter

                onClicked: pageStack.push(Qt.resolvedUrl("AboutPage.qml"))
            }
        ]
    }

    Button{
        text: "print to console"
        backgroundColor:"mistyrose"
        x:200
        y:950
        onClicked: console.log("hello world")
    }

    Rectangle{
        id:root
        width:400
        height:500
        x:150
        y:350
        color: "transparent"

        Button{
            text:"button1"
            anchors.centerIn: parent
            onClicked: root.buttonClicked(1)
        }

        Button{
            text:"button2"
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: root.buttonClicked(2)
        }

        Button{
            text:"button3"
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: root.buttonClicked(3)
        }

        signal buttonClicked (int buttonNumber)

        Connections {
             target: root
             onButtonClicked: {
                console.log("Button", buttonNumber, "clicked")
             }
        }
    }

    Button {
        text: "signal button"
        x: 200
        y: 150
        backgroundColor: "lightblue"
        color:"black"
        signal doubleClicked()
        signal pressed()
        signal released()

        MouseArea {
            anchors.fill: parent
            onPressed: {
                parent.pressed(console.log("button pressed"));
            }
            onReleased: {
                parent.released(console.log("button released"));
            }
            onDoubleClicked: {
                parent.doubleClicked(console.log("button doubleClicked"));
            }
        }
    }
}
