/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.rentacar.controladores;

import com.mycompany.rentacar.crud.Crud;
import com.mycompany.rentacar.entities.Car;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Alejandro
 */
public class Consultar extends HttpServlet {

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

        String lugar = request.getParameter("localizacion");
        String marca = request.getParameter("marca");
        String fechaRecogida = request.getParameter("ida");
        String fechaVuelta = request.getParameter("vuelta");

        int idLugar = Integer.parseInt(lugar);
        int idMarca = Integer.parseInt(marca);
        
        HttpSession httpsession = request.getSession();

        Crud crud = new Crud();
        
        List<Car> listaVehiculos = crud.consultaVehiculo(idLugar, idMarca);
        if(listaVehiculos == null){
            RequestDispatcher rs = request.getRequestDispatcher("/WEB-INF/Layout.jsp");
            httpsession.setAttribute("disponibles","false");
            request.setAttribute("pagina", "mainpage");
            rs.forward(request, response);
        }else{
        
        httpsession.setAttribute("disponibles",null);
        httpsession.setAttribute("listaVehiculos",listaVehiculos);
        httpsession.setAttribute("fechaRecogida", fechaRecogida);
        httpsession.setAttribute("fechaVuelta", fechaVuelta);
        
         RequestDispatcher rs = request.getRequestDispatcher("/WEB-INF/Layout.jsp");
         request.setAttribute("pagina", "../busquedaVehiculos");

          rs.forward(request, response);
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
