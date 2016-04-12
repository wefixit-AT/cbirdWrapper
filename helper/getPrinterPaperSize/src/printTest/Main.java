package printTest;

import javax.print.PrintService;
import javax.print.PrintServiceLookup;
import javax.print.attribute.standard.Media;
import javax.print.attribute.standard.MediaSize;
import javax.print.attribute.standard.MediaSizeName;

public class Main {

	public static void main(String[] args) {
		System.out.println("Get default printer paper settings:");
		System.out.println("-----------------------------------");
		PrintService printService = PrintServiceLookup.lookupDefaultPrintService();
		Media[] medias = (Media[]) printService.getSupportedAttributeValues(Media.class, null, null);
		for (Media m : medias) {
			if (m instanceof MediaSizeName) {
				MediaSizeName mediaSizeName = (MediaSizeName) m;
				MediaSize mediaSize = MediaSize.getMediaSizeForName(mediaSizeName);
				if (mediaSize != null) {
					float width = mediaSize.getX(MediaSize.MM);
					float height = mediaSize.getY(MediaSize.MM);
					System.out.println("Name: " + m);
					System.out.println("  Dimension MM: width=" + width + ", height=" + height);
					width = mediaSize.getX(MediaSize.INCH);
					height = mediaSize.getY(MediaSize.INCH);
					System.out.println("  Dimension INCH: width=" + width + ", height=" + height);
				}
			}
		}
	}

}
