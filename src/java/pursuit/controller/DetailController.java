/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pursuit.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pursuit.dao.ColorDAO;
import pursuit.dao.ImageDAO;
import pursuit.dao.ProductVariantDAO;
import pursuit.dao.SizeDAO;
import pursuit.dto.ColorDTO;
import pursuit.dto.ImageDTO;
import pursuit.dto.ProductVariantDTO;
import pursuit.dto.SizeDTO;

/**
 *
 * @author namdh
 */
@WebServlet(name = "DetailController", urlPatterns = {"/DetailController"})
public class DetailController extends HttpServlet {

    private static final String SUCCESS = "detail.jsp";
    private static final String ERROR = "index.jsp";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        String productID = request.getParameter("productId");

        try {
            ProductVariantDAO pvdao = new ProductVariantDAO();
            ProductVariantDTO pvdto = pvdao.getPVByProductID(productID);
            
            ImageDAO idao = new ImageDAO();
            List<ImageDTO> imgList = idao.getListImagesByPID(productID);
            
            SizeDAO sdao = new SizeDAO();
            List<SizeDTO> sizeList = sdao.getListSizeByPID(productID);
            
            ColorDAO cdao = new ColorDAO();
            List<ColorDTO> colorList = cdao.getListColorByPID(productID);
            
            pvdao.getPVBySizeID("1", "1");

            if (pvdto != null) {
                url = SUCCESS;
                request.setAttribute("PRODUCT", pvdto);
                request.setAttribute("IMAGES", imgList);
                request.setAttribute("SIZE", sizeList);
                request.setAttribute("COLOR", colorList);
            }
        } catch (Exception e) {
            log("Error at CategoryController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
