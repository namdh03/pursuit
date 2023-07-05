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

/**
 *
 * @author namdh
 */
@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainController extends HttpServlet {

    private static final String WELCOME_PAGE = "index.jsp";
    private static final String REGISTER = "Register";
    private static final String REGISTER_CONTROLLER = "RegisterController";
    private static final String VERIFY = "Verify";
    private static final String VERIFY_CONTROLLER = "VerifyController";
    private static final String LOGIN = "Login";
    private static final String LOGIN_CONTROLLER = "LoginController";
    private static final String GOOGLE = "Google";
    private static final String GOOGLE_CONTROLLER = "GoogleController";
    private static final String PRODUCT = "Product";
    private static final String PRODUCT_CONTROLLER = "ProductController";
    private static final String LOAD_MORE = "LoadMore";
    private static final String LOAD_MORE_CONTROLLER = "LoadMoreController";
    private static final String CATEGORY = "Category";
    private static final String CATEGORY_CONTROLLER = "CategoryController";
    private static final String DETAIL = "Detail";
    private static final String DETAIL_CONTROLLER = "DetailController";
    private static final String SIZE = "Size";
    private static final String SIZE_CONTROLLER = "SizeController";
    private static final String COLOR = "Color";
    private static final String COLOR_CONTROLLER = "ColorController";
    private static final String ADD_TO_CART = "AddToCart";
    private static final String ADD_TO_CART_CONTROLLER = "AddToCartController";
    private static final String DELETE_CART = "DeleteCart";
    private static final String DELETE_CART_CONTROLLER = "DeleteCartController";
    private static final String UPDATE_CART = "UpdateCart";
    private static final String UPDATE_CART_CONTROLLER = "UpdateCartController";
    private static final String UPDATE_USER = "UpdateUser";
    private static final String UPDATE_USER_CONTROLLER = "UpdateUserController";
    private static final String SET_ADDRESS = "SetAddress";
    private static final String SET_ADDRESS_CONTROLLER = "SetAddressController";
    private static final String UPDATE_DEFAULT_ADDRESS = "UpdateDefaultAddress";
    private static final String UPDATE_DEFAULT_ADDRESS_CONTROLLER = "UpdateDefaultAddressController";
    private static final String DELETE_ADDRESS = "DeleteAddress";
    private static final String DELETE_ADDRESS_CONTROLLER = "DeleteAddressController";
    private static final String LOGOUT = "Logout";
    private static final String LOGOUT_CONTROLLER = "LogoutController";
    private static final String CHANGE_PASSWORD = "ChangePassword";
    private static final String CHANGE_PASSWORD_CONTROLLER = "ChangePasswordController";
    private static final String ADD_ORDER = "AddOrder";
    private static final String ADD_ORDER_CONTROLLER = "AddOrderController";

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
        String url = WELCOME_PAGE;
        request.setCharacterEncoding("UTF-8");

        try {
            String action = request.getParameter("action");

            switch (action) {
                case REGISTER: ;
                    url = REGISTER_CONTROLLER;
                    break;
                case VERIFY:
                    url = VERIFY_CONTROLLER;
                    break;
                case LOGIN:
                    url = LOGIN_CONTROLLER;
                    break;
                case GOOGLE:
                    url = GOOGLE_CONTROLLER;
                    break;
                case PRODUCT:
                    url = PRODUCT_CONTROLLER;
                    break;
                case LOAD_MORE:
                    url = LOAD_MORE_CONTROLLER;
                    break;
                case CATEGORY:
                    url = CATEGORY_CONTROLLER;
                    break;
                case DETAIL:
                    url = DETAIL_CONTROLLER;
                    break;
                case SIZE:
                    url = SIZE_CONTROLLER;
                    break;
                case COLOR:
                    url = COLOR_CONTROLLER;
                    break;
                case ADD_TO_CART:
                    url = ADD_TO_CART_CONTROLLER;
                    break;
                case DELETE_CART:
                    url = DELETE_CART_CONTROLLER;
                    break;
                case UPDATE_CART:
                    url = UPDATE_CART_CONTROLLER;
                    break;
                case UPDATE_USER:
                    url = UPDATE_USER_CONTROLLER;
                    break;
                case SET_ADDRESS:
                    url = SET_ADDRESS_CONTROLLER;
                    break;
                case UPDATE_DEFAULT_ADDRESS:
                    url = UPDATE_DEFAULT_ADDRESS_CONTROLLER;
                    break;
                case DELETE_ADDRESS:
                    url = DELETE_ADDRESS_CONTROLLER;
                    break;
                case LOGOUT:
                    url = LOGOUT_CONTROLLER;
                    break;
                case CHANGE_PASSWORD:
                    url = CHANGE_PASSWORD_CONTROLLER;
                    break;
                case ADD_ORDER:
                    url = ADD_ORDER_CONTROLLER;
                    break;
                default:
                    url = WELCOME_PAGE;
            }
        } catch (Exception e) {
            log("Error at MainController: " + e.toString());
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
