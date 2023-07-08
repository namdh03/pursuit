/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pursuit.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pursuit.dao.ProductVariantDAO;

/**
 *
 * @author namdh
 */
@WebServlet(name = "UpdatePVariantController", urlPatterns = {"/UpdatePVariantController"})
public class UpdatePVariantController extends HttpServlet {

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
        int productVariantId = Integer.parseInt(request.getParameter("productVariantId"));
        boolean isDefault = Boolean.parseBoolean(request.getParameter("default"));
        int sizeId = Integer.parseInt(request.getParameter("sizeId"));
        int colorId = Integer.parseInt(request.getParameter("colorId"));
        float price = Float.parseFloat(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        try {
            ProductVariantDAO pvdao = new ProductVariantDAO();
            boolean check = pvdao.updatePVByID(productVariantId, sizeId, colorId, price, quantity, isDefault);
            
            if (check) {
                request.setAttribute("UPDATE_SUCCESS", "Update Successful!");
                request.getRequestDispatcher("ProductController").include(request, response);
            } else {
                request.setAttribute("UPDATE_ERROR", "Update Failed!");
            }
        } catch (Exception e) {
            log("Error at UpdatePVariantController: " + e.toString());
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
