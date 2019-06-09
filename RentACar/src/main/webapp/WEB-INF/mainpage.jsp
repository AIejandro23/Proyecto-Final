<%@page import="java.util.List"%>
<%@page import="com.mycompany.rentacar.entities.Car"%>
<%@page import="com.mycompany.rentacar.entities.Car"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script>
      
          
            
          function comprobarFechas(){
          var idaValor = $('#ida').val();
          var fechaIda = new Date(idaValor);
          
          var idaVuelta = $('#vuelta').val();
          var fechaVuelta = new Date(idaVuelta);
                    
          if(fechaVuelta.getTime() > fechaIda.getTime()){
              alert("Introduzca las fechas correctamente");
              return false;
          }else{
              return true;
          }
          }
        
        $(document).ready(function () {

            $('#submitBoton').click(function(){
                var idaValor = $('#ida').val();
                var fechaIda = new Date(idaValor);

                var idaVuelta = $('#vuelta').val();
                var fechaVuelta = new Date(idaVuelta);
                
                var recogida = $('#localizacion').val();
                
                 console.log("Recogida: "+  recogida);

                if(new Date(idaValor).getTime() > new Date(idaVuelta).getTime() || idaValor == "" || idaVuelta == "" && recogida == "0"){
                    if(recogida == "0"){
                        alert("Introduzca una localización");
                        return false;
                    }else{
                        alert("Introduzca las fechas correctamente");
                    return false;
                    }
                    
                }else{
                    return true;
               
                }
            });

            $('select').formSelect();
            $('#ida').datepicker({
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
      
          
           $('#vuelta').datepicker({
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
             
            
            var ida = $('#ida').val();
            var vuelta = $('#vuelta').val();
            var fechaDeHoy = new Date();
            
            console.log(ida);
            
            $('.carousel.carousel-slider').carousel({
                fullWidth: true
            });
            
           /* $("#formulario").on("submit", function(){
            console.log(ida);
            console.log(vuelta);
            if(ida === "" || vuelta == ""){
                    alert("Introduzca las fechas correctamente");
                    return false;
                }
                if(fechaDeHoy <= ida || fechaDeHoy <= vuelta){
                    console.log("FECHA MENOR");
                }
          })*/
            setInterval(function () {
                $('.carousel').carousel('next');
            }, 4000);
        });
        
     
    </script>
    <style>
        .card .card-content{
            min-height: 132px;
        }
    </style>
   
    <div class="container">
        <div class="row" style="margin-top:2%;">
            <h2 class="center-align">CONSULTA NUESTROS VEHÍCULOS</h2>
             <%
        HttpSession httpsession = request.getSession();
        String disponibles = (String) httpsession.getAttribute("disponibles");    
        
        if(disponibles!=null){
            out.println("<h6 style='color:red;'>No hay vehículos disponibles en esas fechas</h6>");
            }%>
            <div class="col s12 m12 l12">
                <form id="formulario" action="Consultar">
                <div class="input-field col s12 l2 m2">
                    <input id="ida" name="ida" type="text" class="datepicker">
                    <label>Fecha de recogida</label>
                </div>
                <div class="input-field col s12 l2 m2">
                    <input onclick="cambiarFecha()" id="vuelta" name="vuelta" type="text" class="datepicker">
                    <label>Fecha de vuelta</label>
                </div>
                    <div class="input-field col s12 l4 m4">
                    <select id="localizacion" name="localizacion">
                        <option value="0" selected>Recogida y devolución</option>
                        <option value="1">Aeropuerto de Palma de Mallorca</option>
                        <option value="2">Aeropuerto de Ibiza</option>
                        <option value="3">Aeropuerto de Menorca</option>
                        <option value="4">Aeropuerto de Formentera</option>-->
                   </select>
                    <label>Lugar de recogida y devolución</label>
                </div>
              
                
                <div class="input-field col s12 l2 m2">
                    <select id="marca" name="marca">
                        <option value="0" selected>Marca</option>
                        <option value="0">Cualquiera</option>
                        <option value="1">Renault</option>
                        <option value="2">Fiat</option>
                        <option value="3">Opel</option>
                        <option value="4">Nissan</option>
                    </select>
                    <label>Elige la marca</label>
                </div>
              
                <div class="input-field col s12 l2 m2">
                    <button class="btn waves-effect teal darken-4" id="submitBoton" type="submit" name="action">BUSCAR
                        <i class="material-icons right">send</i>
                    </button>
                </div>
              </form>
            </div>
        </div>
        
        <!-- CARTAS DE VEHÍCULOS -->
        <div class="row">
            <h4>Nuestros coches más reservados</h4>
            <div class="col s12 m4 l4">
                <div class="card">
                    <div class="card-image waves-effect waves-block waves-light">
                        <img src="imagenes/fiat.jpg">
                    </div>
                    <div class="card-content">
                        <span class="card-title activator grey-text text-darken-4">Fiat 500</span>
                        <p>Uno de los coches más iconicos de Fiat, pequeño rapido y funcional.</p>
                    </div>
                    
                </div>
            </div>
            <div class="col s12 m4 l4">
                <div class="card">
                    <div class="card-image waves-effect waves-block waves-light">
                        <img src="imagenes/megane.jpg">
                    </div>
                    <div class="card-content">
                        <span class="card-title activator grey-text text-darken-4">Renault Megane</span>
                        <p>Elegante y con estilo, descubre más sobre este coche.</p>
                    </div>
                   
                </div>
            </div>
            <div class="col s12 m4 l4">
                <div class="card">
                  <div class="card-image waves-effect waves-block waves-light">
                        <img src="imagenes/coche3.png"></a>
                    </div>
                    <div class="card-content">
                        <span class="card-title activator grey-text text-darken-4">BMW X4 AUTOMATIC</span> 
                        <p>Conducir un CrossOver nunca fué tan divertido.</p>
                    </div>
                
                </div>
            </div>
        </div>
        <!-- ROW DE PROMOCIÓN -->
        <div class="row">
            <div class="col s12 l3 m3">
                <div class="center">
                    <i class="medium material-icons">attach_money</i>
                    <h5>Mejores precios garantizados</h5>
                    <p>Ofrecemos los precios más ajustados del mercado</p>
                </div>
            </div>
            <div class="col s12 l3 m3">
                <div class="center">
                    <i class="medium material-icons">autorenew</i>
                    <h5>Coches siempre nuevos</h5>
                    <p>El 90% de nuestra flota no supera los 6 meses de antigüedad</p>
                </div>
            </div>
            <div class="col s12 l3 m3">
                <div class="center">
                    <i class="medium material-icons">check</i>
                    <h5>Categoría garantizada</h5>
                    <p>Te aseguramos que tendrás la categoría elegida… ¡o una superior!</p>
                </div>
            </div>
            <div class="col s12 l3 m3">
                <div class="center">
                    <i class="medium material-icons">sentiment_very_satisfied</i>
                    <h5>Equipamiento Premium</h5>
                    <p>Vehículos completamente equipados para tu seguridad y confort</p>
                </div>
            </div>
        </div>

        <!-- CAROUSEL DE IMAGENES -->
        <div class="row">
            <div class="col s12 m12 l12">
                <h4 class="center-align">Descubre las mejores rutas de Palma de Mallorca</h4>
                <div class="carousel carousel-slider" data-indicators="true">
                    <a class="carousel-item" href="Rutas"><img src="imagenes/carretera1.jpg" height="100%"></a>
                    <a class="carousel-item" href="Rutas"><img src="imagenes/carretera2.jpg" height="100%"></a>
                    <a class="carousel-item" href="Rutas"><img src="imagenes/carretera3.jpg" height="100%"></a>
                    <a class="carousel-item" href="Rutas"><img src="imagenes/carretera4.jpg" height="100%"></a>
                </div>
            </div>
        </div>

    </div>

