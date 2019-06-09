    <%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%-- 
    Document   : reservar
    Created on : 18-may-2019, 0:06:41
    Author     : Alejandro
--%>

<%@page import="com.mycompany.rentacar.entities.Customer"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.rentacar.entities.Car"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% HttpSession httpsession = request.getSession(); 
    String idVehiculo = request.getParameter("idVehiculo");
    Customer customer = (Customer) httpsession.getAttribute("usuario"); 
    String posicion = request.getParameter("posicion");
    
    int idVehiculo2 = Integer.parseInt(idVehiculo);
    int numPosicion = Integer.parseInt(posicion);
    
    List<Car> listaVehiculos = (List<Car>) httpsession.getAttribute("listaVehiculos");
                String fechaRecogida = (String) httpsession.getAttribute("fechaRecogida");
                String fechaVuelta = (String) httpsession.getAttribute("fechaVuelta");
                String imagen = listaVehiculos.get(numPosicion).getImageName();
                Double precio = listaVehiculos.get(numPosicion).getPricePerDay();
                Double precioFinal = 0.1;
                
                  SimpleDateFormat formatter1=new SimpleDateFormat("MMM dd, yyyy");  
                    Date fechaInicial = formatter1.parse(fechaRecogida);
                    Date fechaFinal = formatter1.parse(fechaVuelta);
                    double dias=(double) ((fechaFinal.getTime()-fechaInicial.getTime())/86400000);
                   customer.getPhone();
                    precioFinal = precio * dias;
                    DecimalFormat df = new DecimalFormat("#.00");
                    httpsession.setAttribute("precioFinal", precioFinal);
                    
%>
<div class="container">
    <div class="row">
        <h1 style="text-align:center;">Informe de la reserva</h1>
    </div>
    <div class="row" style="margin-top: 5%;">
        <div class="col s4 m4 l4">
           <img src='imagenes/<%=imagen%>' style="width:100%;height:100%;" >
        </div>
        <div class="col s4 m4 l4" style="margin-top:0;">
            <h3 style="margin-top:0;">Cliente</h3>
            <p>Nombre: <%= customer.getName()%> </p>
            <p>Apellidos: <%= customer.getSurnames()%> </p>
            <p>Email: <%= customer.getEmail()%></p>
            <p>Dni: <%= customer.getDni() %></p>
            <p>Teléfono: <%= customer.getPhone()%></p>
            <p>País de residencia: <%= customer.getCountry()%></p>
            <p>Fecha de nacimiento: <%= customer.getBirthDate() %></p>
        </div>
        <div class="col s4 m4 l4" style="margin-top:0;">
            <h3 style="margin-top:0;">Contrato</h3>
        <p>Fecha de recogida del vehículo: <%= fechaRecogida %></p>
        <p>Fecha de entrega del vehículo: <%= fechaVuelta %></p>
        <p>Localización de la entrega: <%= listaVehiculos.get(numPosicion).getIdLocation().getName() %></p>
        <p>Marca: <%= listaVehiculos.get(numPosicion).getIdBrand().getName() %></p>
        <p>Modelo: <%= listaVehiculos.get(numPosicion).getIdModel().getName() %></p>
        </div>
    </div>   
        <div class="row">
            <div class="col s12 m4 l4">
                <div class="card-panel ">
                    <h3 style="margin-top:0;">Basic</h3>
                  <span> 
                      <ul>
                          <li style="color:green"><i class="material-icons">check</i>Lleno-lleno</li>
                        <li style="color:green"><i class="material-icons">check</i>Kilometraje Ilimitado</li>
                        <li style="color:red"><i class="material-icons">error</i>Seguro con franquicia</li>
                        <li style="color:red"><i class="material-icons">error</i>Depósito obligatorio</li>
                      </ul> 
                      <p style="font-size:25px;"> Precio final: <%= df.format(precioFinal) %> € </p>
                  </span>
                  <form action="ReservaCliente" method="post" class="center-align" style="margin:0;width:90px;">
                        <input name="precio" type="hidden" value="<%= precioFinal %>">
                        <input name="posicion"  type="hidden" value="<%=numPosicion%>">
                        <input name="idCar" type="hidden" value="<%=idVehiculo2%>">
                       <input type="submit" value="CONFIRMAR RESERVA"  style="width: 200px;height: 40px;background-color: #004d40;border-radius: 12px;color: white;">
                  </form>
                </div>
            </div>
                  <div class="col s12 m4 l4">
                <div class="card-panel ">
                    <h3 style="margin-top:0;">Comfort</h3>
                  <span> 
                      <ul>
                        <li  style="color:green"><i class="material-icons">check</i>Conductor adicional gratis</li>
                        <li  style="color:green"><i class="material-icons">check</i>Kilometraje Ilimitado</li>
                        <li  style="color:red"><i class="material-icons">error</i>Seguro con franquicia</li>
                        <li  style="color:red"><i class="material-icons">error</i>Depósito obligatorio</li>
                      </ul> 
                      <p style="font-size:25px;"> Precio final: <% out.println(df.format(precioFinal * 1.2)); %> € </p>
                  </span>
                  <form action="ReservaCliente" method="post" class="center-align" style="margin:0;width:90px;">
                        <input name="precio" type="hidden" value="<% out.println(precioFinal * 1.2); %>">
                        <input name="posicion"  type="hidden" value="<%=numPosicion%>">
                        <input name="idCar" type="hidden" value="<%=idVehiculo2%>">
                       <input type="submit" value="CONFIRMAR RESERVA"  style="width: 200px;height: 40px;background-color: #004d40;border-radius: 12px;color: white;">
                  </form>
                </div>
            </div>
                  <div class="col s12 m4 l4">
                <div class="card-panel ">
                    <h3  style="margin-top:0;">Premium</h3>
                  <span> 
                      <ul>
                        <li  style="color:green"><i class="material-icons">check</i>Lleno-lleno</li>
                        <li  style="color:green"><i class="material-icons">check</i>Kilometraje Ilimitado</li>
                        <li  style="color:green"><i class="material-icons">check</i>Cobertura todo riesgo sin franquicia</li>
                        <li  style="color:green"><i class="material-icons">check</i>Sin deposito</li>
                        <li  style="color:green"><i class="material-icons">check</i>Conductor adicional</li>
                        <li  style="color:green"><i class="material-icons">check</i>Recogida sin esperas</li>

                      </ul> 
                      <p style="font-size:25px;"> Precio final: <% out.println(df.format(precioFinal * 1.4)); %> € </p>
                  </span>
                  <form action="ReservaCliente" method="post" class="center-align" style="margin:0;width:90px;">
                    <input name="precio" type="hidden" value="<% out.println(precioFinal * 1.4); %>">
                    <input name="posicion"  type="hidden" value="<%=numPosicion%>">
                    <input name="idCar" type="hidden" value="<%=idVehiculo2%>">
                   <input type="submit" value="CONFIRMAR RESERVA"  style="width: 200px;height: 40px;background-color: #004d40;border-radius: 12px;color: white;">
                </form>
              
                </div>
            </div>
        </div>
    </div>
        
        </div>
       
    </div>
</div>
