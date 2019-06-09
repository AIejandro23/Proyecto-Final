<%-- 
    Document   : perfil
    Created on : 25-may-2019, 16:35:06
    Author     : Alejandro
--%>

<%@page import="com.mycompany.rentacar.entities.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="container" style="margin-bottom:15%;">
    <div class="row" style="margin-top:2%;">
            <h2 class="center-align">Mi perfil</h2>
    </div>
    <div class="row">
        <%    
              HttpSession httpsession = request.getSession();         
              Customer usuario = (Customer) httpsession.getAttribute("usuario");
              String nombre = usuario.getName();
              String apellidos = usuario.getSurnames();
              String aniversario = usuario.getBirthDate().toString();
              String dni = usuario.getDni();
              String pais = usuario.getCountry();
              String imagen = usuario.getImageName();
         
              if(imagen != null){
        %>
        <div class="col s4 l4 m4">
            <img src='imagenes/<%=imagen%>' style="width:100%;height:100%;" >
        </div><%}else{%>
        <div class="col s4 l4 m4">
            <img src='imagenes/1467646262_522853_1467646344_noticia_normal.jpg' style="width:100%;height:100%;" >
         </div>
<%}%>
        <div class="s8 l8 m8">
            <p><span style="font-weight: bold">Nombre:</span> <%=nombre%></p>
            <p><span style="font-weight: bold">Apellidos:</span> <%=apellidos%></p>
            <p><span style="font-weight: bold">Fecha de cumpleaños:</span> <%=aniversario%></p>
            <p><span style="font-weight: bold">País de nacimiento:</span> <%=pais%></p>
            <p><span style="font-weight: bold">DNI: </span><%=dni%> </p>
        </div>
    </div>
</div>