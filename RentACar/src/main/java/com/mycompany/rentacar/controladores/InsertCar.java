/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.rentacar.controladores;

import com.mycompany.rentacar.datamodel.HibernateUtil;
import com.mycompany.rentacar.entities.Brand;
import com.mycompany.rentacar.entities.Car;
import com.mycompany.rentacar.entities.Location;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import com.mycompany.rentacar.crud.Crud;
import java.io.File;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Part;

/**
 *
 * @author Alejandro
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 50,
        location="C:\\Users\\Alejandro\\Documents\\NetBeansProjects\\RentACar\\src\\main\\webapp\\imagenes")
public class InsertCar extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        HttpSession httpsession = request.getSession();
        
        String matricula = request.getParameter("matricula");
        String marca = request.getParameter("marca");
        String localizacion = request.getParameter("localizacion");
        String modelo = request.getParameter("modelo");
        String descripcion = request.getParameter("descripcion");
        String precioDia = request.getParameter("precioDia");
        
        Part imagen = request.getPart("imagen");
        String nombreImagen = extractFileName(imagen);

        String savePath = "C:\\Users\\Alejandro\\Documents\\NetBeansProjects\\RentACar\\src\\main\\webapp\\imagenes" + File.separator + nombreImagen;
        File fileSave = new File(savePath);
        
        imagen.write(File.separator + nombreImagen);
        
        Crud crud = new Crud();
        
        crud.insertCar(nombreImagen,savePath,matricula,marca,localizacion,modelo,descripcion,precioDia);
        
        List<Car> listaCoches = crud.getAllVehiculos();
        httpsession.setAttribute("listaVehiculos",listaCoches);

        RequestDispatcher rs = request.getRequestDispatcher("/Admin");
                
        rs.forward(request, response);
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

    private String extractFileName(Part part){
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for(String s : items){
            if(s.trim().startsWith("filename")){
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }
}
