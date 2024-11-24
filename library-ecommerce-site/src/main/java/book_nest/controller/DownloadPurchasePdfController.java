package book_nest.controller;

import java.io.IOException;

import jakarta.servlet.ServletOutputStream;

import book_nest.dao.BookPurchaseDao;
import book_nest.dto.Purchase;
import book_nest.utils.PDFGenerator;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/downloadPurchasePdf")
public class DownloadPurchasePdfController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int purchaseId = Integer.parseInt(req.getParameter("purchase_id"));
        BookPurchaseDao bookPurchaseDao = new BookPurchaseDao();
        Purchase purchase = bookPurchaseDao.getPurchaseById(purchaseId);

        try {
            byte[] pdfBytes = PDFGenerator.generateStyledPurchasePdf(purchase);
            resp.setContentType("application/pdf");
            resp.setHeader("Content-Disposition", "attachment; filename=OrderConfirmation.pdf");
            resp.setContentLength(pdfBytes.length);
            ServletOutputStream os = resp.getOutputStream();
            os.write(pdfBytes);
            os.flush();
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Unable to generate PDF");
        }
    }
}
