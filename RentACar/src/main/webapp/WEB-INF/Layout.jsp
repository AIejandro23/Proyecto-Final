<%-- 
    Document   : Layout
    Created on : 07-mar-2019, 21:43:58
    Author     : Alejandro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <title>Rent a Car : Alejandro Garcia</title>
    <meta charset="utf-8">
    <!--Import Google Icon Font-->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!--Import materialize.css-->
    <link type="text/css" rel="stylesheet" href="css/materialize.min.css" media="screen,projection" />
    <script src="js/jquery-3.3.1.min.js"></script>
    <!--Let browser know website is optimized for mobile-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script type="text/javascript" src="js/materialize.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css"
        integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
   
    </head>
    <body>
          
        <ul id="dropdown1" class="dropdown-content">
            <li><%  
            HttpSession httpsession = request.getSession();
            boolean semaforo = false;
            try{
                String nombre = httpsession.getAttribute("nombre").toString();
                if(nombre.equals("admin")){
                    semaforo = true;
                    System.out.println("Nombre: " + nombre);
            %><a href="Admin">Panel de administración</a></li><%}else{%><a href="Perfil">Perfil</a></li><li><a href="EditarPerfil">Editar Perfil</a></li><%}}catch(Exception e){}%>
            <li><a href="Historial">Historial</a></li>
            <li class="divider"></li>
            <li><a href="LogOut">Cerrar Sesión</a></li>
        </ul>
        
     
        <nav>
        <div class="nav-wrapper  teal darken-4">
            <a href="Inicio" class="brand-logo" style="margin-left: 2%;"><i
                    class="medium material-icons">directions_car</i>RentACar</a>
            <ul id="nav-mobile" class="right hide-on-med-and-down">
                <li><a href="Ofertas">Ofertas</a></li>
                <li><a href="Vehiculos">Vehículos</a></li>
                <% if(httpsession.getAttribute("nombre")==null){%><li><a href="SignUp">Sign Up</a></li>
                <li><a href="LogIn">Log In</a></li><%}%>
                <li><a class="dropdown-trigger" href="#!" data-target="dropdown1"><i class="material-icons left">person</i>
                            <% 
                            try{
                              String nombre = httpsession.getAttribute("nombre").toString();

                            if(nombre!=null){
                                  out.println(httpsession.getAttribute("nombre")); 
                                    %>
            <script>
                $(document).ready(function(){
                    $(".dropdown-trigger").dropdown();
                    $('.sidenav').sidenav();
                });
                                       </script><%}
                            }catch(Exception e){
                                System.out.println("Error" + e.getMessage());
                            }
                            %>   
                          </a></li></a></li>

            </ul>
        </div>
    </nav>
        <div>
            <jsp:include page="<%= ((String) request.getAttribute("pagina")) +  ".jsp" %>"/>
        </div>    

            <footer class="page-footer teal darken-4" style="margin-top:5%;">
        <div class="container ">
            <div class="row ">
                <div class="col m6 l6 s12">
                    <h5 class="white-text">Sobre nosotros</h5>
                    <p class="grey-text text-lighten-4">Somos una empresa de alquiler de vehículos que lleva mas de 20
                        años ofreciendo nuestros servicios
                        en las islas Baleares.</p>
                </div>
                <div class="col l4 offset-l2 s12">
                    <h5 class="white-text">Nuestras redes sociales</h5>
                    <ul>
                        <li><a class="grey-text text-lighten-3" href="#!"><i class="fab fa-twitter"></i> Twitter</a>
                        </li>
                        <li><a class="grey-text text-lighten-3" href="#!"><i class="fab fa-instagram"></i> Instagram</a>
                        </li>
                        <li><a class="grey-text text-lighten-3" href="#!"><i class="fab fa-facebook"></i> FaceBook</a>
                        </li>
                        <li><a class="grey-text text-lighten-3" href="#!"><i class="fab fa-blogger"></i> Blogger</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="footer-copyright">
            <div class="container">
                © 2019 Copyright - Todos los derechos reservados.
                <a class="grey-text text-lighten-4 right" href="#!">Pagina web creada única y exclusivamente por
                    Alejandro García Capellá</a>
            </div>
        </div>
    </footer>

    </body>
</html>
