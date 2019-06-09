<%-- 
    Document   : vehiculos
    Created on : 12-may-2019, 19:27:56
    Author     : Alejandro
--%>

<%@page import="com.mycompany.rentacar.crud.Crud"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Array"%>
<%@page import="java.util.Collection"%>
<%@page import="com.mycompany.rentacar.entities.Model"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.rentacar.entities.Car"%>
    
    <div class="container">
        <h2 class="center-align">Nuestra flota</h2>
                              <div class="row">

        <%  HttpSession httpsession = request.getSession();
        Crud crud = new Crud();
            List<Car> listaVehiculos = (List<Car>) crud.getAllVehiculos();
            int i = 0;

           while(i < listaVehiculos.size()){

               String imagen = listaVehiculos.get(i).getImageName();
               String modelo = listaVehiculos.get(i).getIdModel().getName();
               String descripcion = listaVehiculos.get(i).getIdModel().getDescripcion();
               
               
                      %> 
                    <div class="col s6 m6 l6">
                    <h4 class="header"><%=listaVehiculos.get(i).getIdBrand().getName()%>  &nbsp<%=listaVehiculos.get(i).getIdModel().getName() %></h4>
                  <div class="card horizontal">
                    <div class="card-image">
                        <img src='imagenes/<%=imagen%>' style="width:292px;height:218px;" >
                    </div>
                    <div class="card-stacked">
                      <div class="card-content">
                        <p><%=descripcion%></p>
                      </div>
                     <!-- <div class="card-action">
                          <form action="Reservar" style="margin:0;width:90px;float:left;">
                          <input name="posicion"  type="hidden" value="<%=i%>">
                          <input type="submit" value="RESERVAR" style="width: 100px;height: 40px;background-color: #004d40;border-radius: 12px;color: white;"></a>
                      </div>-->
                    </div>
                  </div>
                </div> 
        <%
                  
                     
                        i = i + 1;     }
        %></div>
    </div>
