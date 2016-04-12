# getPrinterPaperSize

Gibt die Papiergrößen vom Standarddrucker aus. 

Dies dient zum debuggen bei Problemen mit Bondruckern, da die Kassasoftware prüft ob ein Drucker mit einer Papierbreite von 80mm vorliegt.

Zuständiger Eintrag siehe: Bondrucker wird nicht angezeigt #6 

## Installation

    gradle jar

## Start

    java -jar build/libs/getPrinterPaperSize.jar 

## Beispielausgabe

    Get default printer paper settings:
    -----------------------------------
    Name: Roll paper 80 x 297 mm
      Dimension MM: width=80.0, height=296.999
      iDimension INCH: width=3.1496062, height=11.692874
