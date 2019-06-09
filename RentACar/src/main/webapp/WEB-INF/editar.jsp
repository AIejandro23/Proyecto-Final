<%-- 
    Document   : editar
    Created on : 12-may-2019, 21:39:05
    Author     : Alejandro
--%>

<%@page import="java.util.List"%>
<%@page import="com.mycompany.rentacar.entities.Car"%>
<%@page import="com.mycompany.rentacar.crud.Crud"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="container">
            <% HttpSession httpsession = request.getSession();
                Crud crud = new Crud();
                List<Car> listaVehiculos = crud.getAllVehiculos();
                String posicion = request.getAttribute("posicion").toString();
                int numPosicion = Integer.parseInt(posicion);
                
                String matricula = listaVehiculos.get(numPosicion).getEnrollment();
                String modelo = listaVehiculos.get(numPosicion).getIdModel().getName();
                String descripcion = listaVehiculos.get(numPosicion).getIdModel().getDescripcion();
                int idVehiculo = listaVehiculos.get(numPosicion).getIdCar();
            %>
            <script>
               $(document).ready(function(){
                    $('select').formSelect();
            $('.datepicker').datepicker();
            $('.carousel.carousel-slider').carousel({
                fullWidth: true
            });
            $('#descripcion').val('');
            M.textareaAutoResize($('#descripcion'));
            setInterval(function () {
                $('.carousel').carousel('next');
            }, 4000);
            
            $("#matricula").val('<%=matricula%>');
            $("#modelo").val('<%=modelo%>');
            $("#descripcion").val('<%=descripcion%>');
            
             // Funcion de control para el registro de vehículos
            $('#submitBoton').click(function(){
                
            var matricula = $('#matricula').val()
            var marca = $('#marca').val();
            var localizacion = $('#localizacion').val();
            var modelo = $('#modelo').val();
            var imagen = $('#imagen').val();
            var descripcion = $('#descripcion').val();
            
            console.log(matricula);
                        console.log(marca);
            console.log(localizacion);
            console.log(modelo);
            console.log(descripcion);
            console.log(imagen);

            if(matricula == "" || marca == null || localizacion == null || modelo == "" || imagen == "" || descripcion == "" ){
                alert("Por favor introduce todos los datos de registro del vehículo");
                return false;
            }else{
                    return true;
            }
            });
});
            </script>
                
        <div class="row" style="margin-bottom:25%;">
            <h3>Editar vehículo</h3>
            <div class="col s12" style="margin-top:2%;">
                <form name="f1" action="EditCar" method="post" enctype="multipart/form-data">
                    <div class=" col s2">
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
                        <select id="localizacion" name="localizacion">
                            <option value="" disabled selected>Localización</option>
                             <option value="1" >Aeropuerto de Palma</option>
                            <option value="2">Aeropuerto de Ibiza</option>
                            <option value="3">Aeropuerto de Menorca</option>
                            <option value="4">Aeropuerto de Formentera</option>
                        </select>
                        <label>Elige la localización</label>
                    </div>
                    <div class="col s2">
                        <input type="text" name="modelo" id="modelo">
                        <label>Modelo</label>
                    </div>
                    <div class="input-field col s2">
                        <input id="imagen" type="file" name="imagen">
                    </div>
                    
              
            </div>
            <div class="col s12" style="margin-top:2%;">
                <div class="col s8">
                    <textarea id="descripcion" name="descripcion" class="materialize-textarea"></textarea>
                    <label for="descripcion">Descripcion</label>
                    </div>
                <div class="input-field col s2">
                        <input name="idVehiculo" id="idVehiculo" type="hidden" value="<%=idVehiculo%>">
                        <button class="btn waves-effect teal darken-4"  id="submitBoton" type="submit" name="action">REGISTRAR
                            <i class="material-icons right">send</i>
                        </button>
                    </div>
            </div>
            </form>
        </div>