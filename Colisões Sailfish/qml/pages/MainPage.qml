/*
  Copyright (C) 2013 Jolla Ltd.
  Contact: Thomas Perl <thomas.perl@jollamobile.com>
  All rights reserved.

  You may use this file under the terms of BSD license as follows:

  Redistribution and use in source and binary forms, with or without
  modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of the Jolla Ltd nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
  DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR
  ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
  ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

import QtQuick 2.0
import Sailfish.Silica 1.0
import "../components"

Page {
    id: page
    allowedOrientations: Orientation.All

    SilicaFlickable {
        anchors.fill: parent

        PullDownMenu {
            MenuItem {
                text: "Sobre"
                onClicked: pageStack.push(Qt.resolvedUrl("AboutPage.qml"))
            }
        }

        contentHeight: column.height

        Column {
            id: column

            width: page.width
            spacing: Theme.paddingLarge

            PageHeader {
                title: "Collisions"
            }

            CalcGroup { id: x1; label1Text: "X1"; label3Text: "cm"; width: parent.width }
            CalcGroup { id: x2; label1Text: "X2"; label3Text: "cm"; width: parent.width }
            CalcGroup { id: t1; label1Text: "T1"; label3Text: "s";  width: parent.width }
            CalcGroup { id: t2; label1Text: "T2"; label3Text: "s";  width: parent.width }
            CalcGroup { id: m1; label1Text: "M1"; label3Text: "kg"; width: parent.width }
            CalcGroup { id: m2; label1Text: "M2"; label3Text: "kg"; width: parent.width }

            Row {
                width: parent.width

                Button {
                    text: "Calcular"
                    width: parent.width / 2
                    anchors.margins: 10

                    onClicked: {
                        var x1v = x1.getValues()
                        var x2v = x2.getValues()
                        var t1v = t1.getValues()
                        var t2v = t2.getValues()
                        var m1v = m1.getValues()
                        var m2v = m2.getValues()

                        var all = [x1v, x2v, t1v, t2v, m1v, m2v]

                        all.forEach(function (e) {
                            console.log(e.a, e.b)
                        })
                    }
                }

                Button {
                    text: "Limpar"
                    width: parent.width / 2
                    anchors.margins: 10

                    onClicked: {
                        x1.resetValues()
                        x2.resetValues()
                        t1.resetValues()
                        t2.resetValues()
                        m1.resetValues()
                        m2.resetValues()
                    }
                }
            }
        }
    }
}

