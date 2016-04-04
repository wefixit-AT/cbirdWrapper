# cbirdWrapper
A wrapper to run the cash register software cbird under linux
This is written in german because the cbird software is usualy distributed and used in Austria.

Mit dem  cbirdWrapper kann die cbird Registrierkassen-Software unter Linux betrieben werden.

HINWEIS: Es wird keine Haftung jeglicher Art übernommen weder von we-fix-it e.U. noch vom Hersteller der Software usoft e.U.. Der Anwender ist selbständig verantwortlich für verursachte Schäden und sollte vor jeder Änderung und vor Tests eine komplette Sicherung durchführen.

Blog: [https://blog.wefixit.at/?p=110](https://blog.wefixit.at/?p=110)

## Installation

* Kopiere den gesamten Inhalt vom USB Stick in den Ordner "cbird-usb-stick"
* Starte ./configure.sh so oft bis keine Fehlermeldungen angezeigt werden.
* Starte cbird mit ./start.sh

## Getestete Systeme:

* Arch Linux 4.4.2016, java 1.8.0_77

## Vorraussetzung:

* CPU 64bit, Auf ARM CPU's läuft cbird nicht (getestet mit Rasperry Pi und Cubieboard)

## TODO:

* Anpassen für CentOS 7
* Anpassen für Ubuntu 15.10
* Anpassen für Debian 8
