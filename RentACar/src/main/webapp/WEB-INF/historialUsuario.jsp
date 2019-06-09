<%-- 
    Document   : historialUsuario
    Created on : 25-may-2019, 16:02:33
    Author     : Alejandro
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.mycompany.rentacar.entities.Reservation"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.rentacar.entities.Car"%>
<%@page import="com.mycompany.rentacar.entities.Car"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

 <div class="container" style="margin-bottom: 25%;">
        <div class="row" style="margin-top:2%;">
            <h2 class="center-align">Historial de reservas</h2>
        </div>
     <div class="row">
        <div class="s12 m12 l12">
            
      <table>
        <thead>
          <tr>
              <th>Marca</th>
              <th>Modelo</th>
              <th>Fecha de la reserva</th>
              <th>Fecha de la devolución</th>
              <th>Precio final</th>
          </tr>
        </thead>
        <tbody>
        
            <%  HttpSession httpsession = request.getSession();
            List<Reservation> historialUsuario = (List<Reservation>) httpsession.getAttribute("historialUsuario");
            DecimalFormat df = new DecimalFormat("#.00");

           int i = 0;
           while(i < historialUsuario.size()){
                  String fechaReserva = historialUsuario.get(i).getReservationDate().toString();
                  String fechaDevolucion = historialUsuario.get(i).getCollectionDate().toString();
                  Double precioFinal = historialUsuario.get(i).getFinalPrice();
                  String marca = historialUsuario.get(i).getIdCar().getIdBrand().getName();
                  String modelo = historialUsuario.get(i).getIdCar().getIdModel().getName();

                  %>
            <tr>
                <td><%=marca%></td>
                <td><%=modelo%></td>
                <td><%=fechaReserva%></td>
                <td><%=fechaDevolucion%></td>
                <td><% out.println(df.format(precioFinal)); %>€</td>
            </tr>
                <%i++;}%>
        </tbody>
      </table>
     </div>
     </div>
 </div>