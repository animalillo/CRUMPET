/*
 *   Copyright 2019 Ildar Gilmanov <gil.ildar@gmail.com>
 *   This file based on sample code from Kirigami
 *
 *   This program is free software; you can redistribute it and/or modify
 *   it under the terms of the GNU Library General Public License as
 *   published by the Free Software Foundation; either version 3, or
 *   (at your option) any later version.
 *
 *   This program is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU Library General Public License for more details
 *
 *   You should have received a copy of the GNU Library General Public License
 *   along with this program; if not, see <https://www.gnu.org/licenses/>
 */

import QtQuick 2.7
import QtQuick.Controls 2.4 as QQC2
import org.kde.kirigami 2.6 as Kirigami
import QtQuick.Layouts 1.11

Kirigami.ScrollablePage {
    objectName: "settingsPage";
    title: qsTr("Settings");

    ColumnLayout {
        width: parent.width;
        spacing: Kirigami.Units.largeSpacing;

        SettingsCard {
            headerText: qsTr("Instructions");
            descriptionText: qsTr("Please download and read the instructions by clicking the link below. This includes instructions on how to wear your tail, along with some nice graphics showing you how.");
            footer: Kirigami.UrlButton {
                Layout.fillWidth: true; Layout.fillHeight: true;
                url: "http://thetailcompany.com/digitail.pdf";
            }
        }

        SettingsCard {
            headerText: qsTr("Automatic Reconnection");
            descriptionText: qsTr("In certain situations, the app might lose its connection to your tail. Ticking this option will ensure that the app will attempt to reconnect automatically when the connection is lost.");
            footer: QQC2.CheckBox {
                text: qsTr("Reconnect Automatically");
                checked: AppSettings.autoReconnect;
                onClicked: {
                    AppSettings.autoReconnect = !AppSettings.autoReconnect;
                }
            }
        }

        SettingsCard {
            headerText: qsTr("Tail Names");
            descriptionText: qsTr("If you want to clear the names of any tails you have given a name, click the button below to make the app forget them all.");
            footer: QQC2.Button {
                text: qsTr("Forget Tail Names")
                Layout.fillWidth: true
                onClicked: {
                    BTConnectionManager.clearDeviceNames()
                }
            }
        }

        SettingsCard {
            headerText: qsTr("Fake Tail");
            descriptionText: qsTr("If you have just downloaded the app, for example in anticipation of the arrival of your brand new, super shiny DIGITAiL, you might want to explore what the app can do. You can click the button below to trick the app into thinking that it is connected to a tail, and explore what options exist.");
            footer: QQC2.Button {
                text: qsTr("Fake it!")
                Layout.fillWidth: true

                onClicked: {
                    BTConnectionManager.stopDiscovery();
                    BTConnectionManager.setFakeTailMode(true);
                }
            }
        }
    }
}
