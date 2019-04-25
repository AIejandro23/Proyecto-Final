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
    <script src="jquery-3.3.1.min.js"></script>
    <!--Let browser know website is optimized for mobile-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script type="text/javascript" src="js/materialize.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css"
        integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
   
    </head>
    <body>
        
        <ul id="dropdown1" class="dropdown-content">
            <li><a href="#!">Perfil</a></li>
            <li><a href="#!">Historial</a></li>
            <li class="divider"></li>
            <li><a href="LogOut">Cerrar Sesión</a></li>
        </ul>
        
        <nav>
        <div class="nav-wrapper  teal darken-4">
            <a href="Inicio" class="brand-logo" style="margin-left: 2%;"><i
                    class="medium material-icons">directions_car</i>RentACar</a>
            <ul id="nav-mobile" class="right hide-on-med-and-down">
                <li><a href="Ofertas">Ofertas</a></li>
                <li><a href="#">Vehículos</a></li>
                <li><a href="SignUp">Sign Up</a></li>
                <li><a href="LogIn">Log In</a></li>
                <li><a class="dropdown-trigger" href="#!" data-target="dropdown1"><i class="material-icons left">person</i>
                            <%  HttpSession httpsession = request.getSession();
                            try{
                            String nombre = httpsession.getAttribute("nombre").toString();
                            if(nombre!=null){
                                  out.println(httpsession.getAttribute("nombre")); 
                                    %><script>
                                           $(document).ready(function(){
                                                   $(".dropdown-trigger").dropdown();

                                           });
                                       </script><%
                            } 
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
    </body>
</html>
