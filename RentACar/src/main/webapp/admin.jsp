
<%@page import="com.mycompany.rentacar.crud.Crud"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.rentacar.entities.Car"%>
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
    <script>
        // CAROUSEL SCRIPT
        $(document).ready(function () {
            $('select').formSelect();
            $('.datepicker').datepicker({
                autoClose: true,
                minDate: new Date(),
                 i18n: {
                months: ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"],
                monthsShort: ["Ene", "Feb", "Mar", "Abr", "May", "Jun", "Jul", "Ago", "Set", "Oct", "Nov", "Dic"],
                weekdays: ["Domingo","Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado"],
                weekdaysShort: ["Dom","Lun", "Mar", "Mie", "Jue", "Vie", "Sab"],
                weekdaysAbbrev: ["D","L", "M", "M", "J", "V", "S"]
            }
            });
          
            
            // Funcion de control para el registro de vehículos
            $('#submitBoton').click(function(){
                
            var matricula = $('#matricula').val()
            var marca = $('#marca').val();
            var localizacion = $('#localizacion').val();
            var modelo = $('#modelo').val();
            var imagen = $('#imagen').val();
            var descripcion = $('#descripcion').val();
            var precio = $('#precio').val();
            
            if(matricula == "" || marca == null || localizacion == null || modelo == "" || imagen == "" || descripcion == "" || precio == ""){
                alert("Por favor introduce todos los datos de registro del vehículo");
                return false;
            }else{
                    return true;
            }
            });
            
            console.log(matricula);
            console.log(marca);
            $('.carousel.carousel-slider').carousel({
                fullWidth: true
            });
            $('#textarea1').val('');
            M.textareaAutoResize($('#textarea1'));
            setInterval(function () {
                $('.carousel').carousel('next');
            }, 4000);
        });
    </script>
    <style>
        .card .card-content {
            min-height: 132px;
        }
    </style>
 
        <ul id="dropdown1" class="dropdown-content">
            <li><a href="Admin">Panel de administración</a></li>
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
    <div class="container">

        <div class="row">
            <h3>Registrar vehículo</h3>
            <div class="col s12" style="margin-top:2%;">
                <form action="InsertCar" method="post" enctype="multipart/form-data">
                    <div class="input-field col s2">
                        <input type="text" name="matricula" id="matricula">
                        <label>Matricula</label>
                    </div>
                    <div class="input-field col s2">
                        <select name="marca" id="marca">
                            <option value="" disabled selected>Marca</option>
                            <option value="Renault">Renault</option>
                            <option value="Fiat">Fiat</option>
                            <option value="Opel">Opel</option>
                            <option value="Nissan">Nissan</option>
                        </select>
                        <label>Elige la marca</label>
                    </div>
                    <div class="input-field col s2">
                        <select name="localizacion" id="localizacion">
                            <option value="" disabled selected>Localización</option>
                            <option value="1" >Aeropuerto de Palma</option>
                            <option value="2">Aeropuerto de Ibiza</option>
                            <option value="3">Aeropuerto de Menorca</option>
                            <option value="4">Aeropuerto de Formentera</option>
                        </select>
                        <label>Elige la localización</label>
                    </div>
                    <div class="input-field col s2">
                        <input type="text" name="modelo" id="modelo">
                        <label>Modelo</label>
                    </div>
                    <div class="input-field col s2">
                        <input type="file" name="imagen" id="imagen">
                    </div>
                    
              
            </div>
            <div class="col s12" style="margin-top:2%;">
                <div class="input-field col s8">
                    <textarea id="textarea1" name="descripcion" id="descripcion" class="materialize-textarea"></textarea>
                    <label for="textarea1">Descripcion</label>
                </div>
                <div class="input-field col s2">
                        <input type="number" name="precioDia" id="precio">
                        <label>Precio por día</label>                     
                </div>
                <div class="input-field col s2">
                        <button class="btn waves-effect teal darken-4" id="submitBoton" type="submit" name="action">REGISTRAR
                            <i class="material-icons right">send</i>
                        </button>
                </div>
            </div>
            </form>
        </div>
        
        <div class="row">
            <h3>Buscar vehículo</h3>
            <div class="col s12" style="margin-top:2%;">
                <form action="Buscar" method="post" >
                    <div class="input-field col s2">
                        <input type="text" name="matricula">
                        <label>Matrícula</label>
                    </div>
                    <div class="input-field col s2">
                        <select name="marca">
                            <option value="">Marca</option>
                            <option value="1">Renault</option>
                            <option value="2">Fiat</option>
                            <option value="3">Opel</option>
                            <option value="4">Nissan</option>
                        </select>
                        <label>Elige la marca</label>
                    </div>
                    <div class="input-field col s2">
                        <select id="localizacion" name="localizacion">
                            <option value="" >Localización</option>
                            <option value="1" >Aeropuerto de Palma</option>
                            <option value="2">Aeropuerto de Ibiza</option>
                            <option value="3">Aeropuerto de Menorca</option>
                            <option value="4">Aeropuerto de Formentera</option>

                        </select>
                        <label>Elige la localización</label>
                    </div>
                     <div class="input-field col s2">
                        <select id="reservado" name="reservado">
                            <option value="" >Reservado/Sin Reservar</option>
                            <option value="1" >Reservado</option>
                            <option value="0">Sin Reservar</option>
                        </select>
                        <label>Reservado/Sin Reservar</label>
                    </div>
                      <div class="input-field col s2">
                        <button class="btn waves-effect teal darken-4" type="submit" name="action">BUSCAR
                            <i class="material-icons right">send</i>
                        </button>
                    </div>
                </form>
            </div>
        </div>
       

        <%  
            Crud crud = new Crud();

                List<Car> listaVehiculos = crud.getAllVehiculos();
    
            int i = 0;       
            
           while(i < listaVehiculos.size()){

               String imagen = listaVehiculos.get(i).getImageName();
               String modelo = listaVehiculos.get(i).getIdModel().getName();
               String descripcion = listaVehiculos.get(i).getIdModel().getDescripcion();
               String matricula = listaVehiculos.get(i).getEnrollment();
               int idCar = listaVehiculos.get(i).getIdCar();
               int idModel = listaVehiculos.get(i).getIdModel().getIdModelo();
               int posicion = i;
               int reservado = listaVehiculos.get(i).getReservado();

        %>
             <div class="col s12 m7">
                    <h4 class="header"><%=listaVehiculos.get(i).getIdBrand().getName()%>  &nbsp<%=listaVehiculos.get(i).getIdModel().getName() %> &nbsp <%=matricula%></h4>
                  <div class="card horizontal">
                    <div class="card-image">
                        <img src='imagenes/<%=imagen%>' style="width:292px;height:218px;" >
                    </div>
                    <div class="card-stacked">
                      <div class="card-content">
                        <p><%=descripcion%></p>
                      </div>
                      <div class="card-action">
                          <form action="Reservado" style="margin-right:8%;width:90px;float:left;">
                          <input name="idCar"  type="hidden" value="<%=idCar%>">
                          <input type="submit" value="<% if(reservado == 1){out.println("DESBLOQUEAR");}else{out.println("BLOQUEAR");} %>" style="width: 120px;height: 40px;background-color: #004d40;border-radius: 12px;color: white;"></a>
                        </form>
                          <form action="Edit" style="margin-right:5%;width:90px;float:left;">
                          <input name="posicion"  type="hidden" value="<%=posicion%>">
                          <input type="submit" value="EDITAR" style="width: 100px;height: 40px;background-color: #004d40;border-radius: 12px;color: white;"></a>
                        </form>
                        <form action="DeleteCar" style="margin-right:5%;width:110px;float:left;">
                          <input name="idCar"  type="hidden" value="<%=idCar%>">
                          <input name="idModel"  type="hidden" value="<%=idModel%>">
                          <a href="#"><input type="submit" value="ELIMINAR" style="width: 100px;height: 40px;background-color: #004d40;border-radius: 12px;color: white;"></a>
                        </form>
                      </div>
                    </div>
                  </div>
                </div> <%
                  
                     
                        i++;     }
%>
    </div>

        <!-- FOOTER -->
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