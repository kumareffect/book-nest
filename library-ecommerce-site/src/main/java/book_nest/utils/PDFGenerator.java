package book_nest.utils;

import java.io.ByteArrayOutputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Base64;

import com.itextpdf.kernel.colors.ColorConstants;
import com.itextpdf.kernel.geom.PageSize;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.borders.Border;
import com.itextpdf.layout.element.Cell;
import com.itextpdf.layout.element.Div;
import com.itextpdf.layout.element.Image;
import com.itextpdf.layout.element.Paragraph;
import com.itextpdf.layout.element.Table;
import com.itextpdf.layout.property.HorizontalAlignment;
import com.itextpdf.layout.property.TextAlignment;
import com.itextpdf.io.image.ImageDataFactory;

import book_nest.dto.Purchase;

public class PDFGenerator {

    public static byte[] generateStyledPurchasePdf(Purchase purchase) throws Exception {
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        PdfWriter writer = new PdfWriter(byteArrayOutputStream);
        PdfDocument pdf = new PdfDocument(writer);
        Document document = new Document(pdf, PageSize.A4);
        
        Paragraph title = new Paragraph("Order Confirmation")
                .setTextAlignment(TextAlignment.CENTER)
                .setFontSize(20)
                .setBold();
        document.add(title);

        if (purchase.getCustomer().getImage() != null) {
            byte[] customerImageBytes = Base64.getDecoder().decode(Base64.getEncoder().encodeToString(purchase.getCustomer().getImage()));
            Image customerImage = new Image(ImageDataFactory.create(customerImageBytes));
            customerImage.setWidth(100).setHeight(100);  
            customerImage.setHorizontalAlignment(HorizontalAlignment.CENTER);
            document.add(customerImage);
        }

        document.add(new Paragraph(purchase.getCustomer().getName())
                .setTextAlignment(TextAlignment.CENTER)
                .setFontSize(14).setBold());

        Table table = new Table(new float[]{1, 3});
        table.setWidth(document.getPdfDocument().getDefaultPageSize().getWidth() * 0.8f);
        table.setHorizontalAlignment(HorizontalAlignment.CENTER);


        table.addCell(new Cell().add(new Paragraph("Payment ID:")).setBorder(Border.NO_BORDER).setBold());
        table.addCell(new Cell().add(new Paragraph(purchase.getPaymentId())).setBorder(Border.NO_BORDER));

        table.addCell(new Cell().add(new Paragraph("Book Name:")).setBorder(Border.NO_BORDER).setBold());
        table.addCell(new Cell().add(new Paragraph(purchase.getBook().getName())).setBorder(Border.NO_BORDER));

        table.addCell(new Cell().add(new Paragraph("Price: ₹")).setBorder(Border.NO_BORDER).setBold());
        table.addCell(new Cell().add(new Paragraph(String.valueOf(purchase.getAmount()))).setBorder(Border.NO_BORDER));

        table.addCell(new Cell().add(new Paragraph("Purchase Date:")).setBorder(Border.NO_BORDER).setBold());
        table.addCell(new Cell().add(new Paragraph(purchase.getTime().toString())).setBorder(Border.NO_BORDER));

        table.addCell(new Cell().add(new Paragraph("Customer Name:")).setBorder(Border.NO_BORDER).setBold());
        table.addCell(new Cell().add(new Paragraph(purchase.getCustomer().getName())).setBorder(Border.NO_BORDER));

        table.addCell(new Cell().add(new Paragraph("Delivery Address:")).setBorder(Border.NO_BORDER).setBold());
        table.addCell(new Cell().add(new Paragraph(purchase.getCustomer().getAddress())).setBorder(Border.NO_BORDER));

        document.add(table);

        document.add(new Paragraph("-------------------------------------------------"));

        if (purchase.getBook().getImage() != null) {
            byte[] bookImageBytes = Base64.getDecoder().decode(Base64.getEncoder().encodeToString(purchase.getBook().getImage()));
            Image bookImage = new Image(ImageDataFactory.create(bookImageBytes));
            bookImage.setWidth(100).setHeight(150);  
            document.add(bookImage);
        }

        Div totalAmountSection = new Div().setBorder(Border.NO_BORDER).setPadding(10);
        totalAmountSection.add(new Paragraph("Total Amount: ₹" + purchase.getAmount())
                .setTextAlignment(TextAlignment.RIGHT).setFontSize(14).setBold());
        document.add(totalAmountSection);

        try {
            byte[] logoBytes = Files.readAllBytes(Paths.get("D:/logo_main.png"));
            Image logoImage = new Image(ImageDataFactory.create(logoBytes));
            logoImage.setWidth(80).setHorizontalAlignment(HorizontalAlignment.CENTER);
            document.add(logoImage);
        } catch (Exception e) {
            System.err.println("Logo image not found: " + e.getMessage());
        }

        Paragraph footer = new Paragraph("Thank you for your purchase!")
                .setTextAlignment(TextAlignment.CENTER)
                .setFontSize(12)
                .setItalic();
        document.add(footer);

        document.close();
        return byteArrayOutputStream.toByteArray();
    }
}
