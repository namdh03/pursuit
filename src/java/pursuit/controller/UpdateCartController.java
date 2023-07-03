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
import javax.servlet.http.HttpSession;
import pursuit.dao.CartItemDAO;
import pursuit.dao.ProductVariantDAO;
import pursuit.dto.AccountDTO;
import pursuit.dto.CartItemDTO;

/**
 *
 * @author namdh
 */
@WebServlet(name = "UpdateCartController", urlPatterns = {"/UpdateCartController"})
public class UpdateCartController extends HttpServlet {

    private static final String SUCCESS = "cart.jsp";
    private static final String ERROR = "cart.jsp";

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
        String cartId = request.getParameter("cartId");
        String pvId = request.getParameter("pvId");
        String qty = request.getParameter("qty");

        try {
            ProductVariantDAO pvdao = new ProductVariantDAO();
            CartItemDAO cidao = new CartItemDAO();

            int pvQty = pvdao.getQtyByPVID(Integer.parseInt(pvId));

            if (Integer.parseInt(qty) <= pvQty && Integer.parseInt(qty) > 0) {
                boolean check = cidao.updateCartItem(Integer.parseInt(qty), Integer.parseInt(cartId), Integer.parseInt(pvId));

                if (check) {
                    HttpSession session = request.getSession();
                    AccountDTO adto = (AccountDTO) session.getAttribute("USER");
                    List<CartItemDTO> list = cidao.getListCartItemByCID(adto.getCustomer().getCustomerId());
                    session.setAttribute("CART", list);
                    url = SUCCESS;
                }
            } else {
                request.setAttribute("CART_ERROR_QUANTITY", "Sorry, the selected quantity exceeds the available stock. Please adjust the quantity in your cart");
            }
        } catch (NumberFormatException nfe) {
            request.setAttribute("CART_ERROR_QUANTITY", "Sorry, the selected quantity exceeds the available stock. Please adjust the quantity in your cart");
        } catch (Exception e) {
            log("Error at UpdateCartController: " + e.toString());
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
