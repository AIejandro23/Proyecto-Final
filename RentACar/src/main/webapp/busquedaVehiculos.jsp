<%-- 
    Document   : busquedaVehiculos
    Created on : 11-may-2019, 19:04:29
    Author     : Alejandro
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Array"%>
<%@page import="java.util.Collection"%>
<%@page import="com.mycompany.rentacar.entities.Model"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.rentacar.entities.Car"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="container">
        <h2 class="center-align">Vehículos disponibles</h1>
        <%  HttpSession httpsession = request.getSession();
            List<Car> listaVehiculos = (List<Car>) httpsession.getAttribute("listaVehiculos");
             boolean semaforo = false;
             
          String fechaRecogida = (String) httpsession.getAttribute("fechaRecogida");
          if(fechaRecogida == null){
               semaforo = true;
          }
          int i = 0;

           while(i < listaVehiculos.size()){
                                       
               String imagen = listaVehiculos.get(i).getImageName();
               String descripcion = listaVehiculos.get(i).getIdModel().getDescripcion();
               Double precio = listaVehiculos.get(i).getPricePerDay();
               int idVehiculo = listaVehiculos.get(i).getIdCar();

               %>
                <div class="col s12 m7">
                    <h4 class="header"><%=listaVehiculos.get(i).getIdBrand().getName()%>  &nbsp<%=listaVehiculos.get(i).getIdModel().getName() %></h4>
                  <div class="card horizontal">
                    <div class="card-image">
                        <img src='imagenes/<%=imagen%>' style="width:400px;height:213px;" >
                    </div>
                    <div class="card-stacked">
                      <div class="card-content">
                        <p><%=descripcion%></p>
                      </div>
                      <div class="card-action">
                          <form action="Reservar" style="margin:0;width:90px;float:left;">
                          <input name="idVehiculo"  type="hidden" value="<%=idVehiculo%>" >
                          <input name="posicion"  type="hidden" value="<%=i%>" >
                          <% if(!semaforo){%>
                          <a><input type="submit" value="RESERVAR" style="width: 100px;height: 40px;background-color: #004d40;border-radius: 12px;color: white;"></a>
                          <%}%>
                          </form>
                          <p style="float: right;color: #004d40;font-size: 25px;margin-top: 0px;margin-bottom: 0px;"><%=precio%>€ / día</p>
                      </div>
                    </div>
                  </div>
                </div><%
                        i++;     }
                      %> 
</div>

