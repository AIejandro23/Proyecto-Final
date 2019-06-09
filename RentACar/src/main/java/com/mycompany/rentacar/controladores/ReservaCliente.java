/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.rentacar.controladores;

import com.mycompany.rentacar.crud.Crud;
import com.mycompany.rentacar.entities.Customer;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Alejandro
 */
@WebServlet(name = "ReservaCliente", urlPatterns = {"/ReservaCliente"})
public class ReservaCliente extends HttpServlet {

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
            throws ServletException, IOException, ParseException {
       
       
        
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
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(ReservaCliente.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try{
        HttpSession httpsession = request.getSession();
        
        String fechaRecogida = (String) httpsession.getAttribute("fechaRecogida");
        String fechaDevolucion = (String) httpsession.getAttribute("fechaVuelta");
        
        String posicionCar = request.getParameter("posicion");
        int posicion = Integer.parseInt(posicionCar);        
        
        String idCar = request.getParameter("idCar");
        int intIdCar = Integer.parseInt(idCar);
        
        String precio = request.getParameter("precio");
        Double precioFinal = Double.parseDouble(precio);
                
        Customer customer = (Customer) httpsession.getAttribute("usuario"); 

        Crud crud = new Crud();
        crud.bookCarCustomer(intIdCar,posicion, customer.getIdCustomer() , fechaRecogida , fechaDevolucion, precioFinal);
        
        RequestDispatcher rs = request.getRequestDispatcher("/WEB-INF/Layout.jsp");
          request.setAttribute("pagina", "mainpage");

          rs.forward(request, response);
        }catch(Exception e){
            System.err.println("Error en la reserva: " + e.getLocalizedMessage());
        }
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
