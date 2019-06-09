<%-- 
    Document   : editarperfil
    Created on : 09-jun-2019, 13:20:54
    Author     : Alejandro
--%>

<%@page import="com.mycompany.rentacar.entities.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <script>
     $(document).ready(function () {
            $('select').formSelect();
            $('.datepicker').datepicker({
                selectMonths: true, // Creates a dropdown to control month
                selectYears: 30,
                yearRange: 30,
                maxDate: new Date(1999,12,12),
                defaultDate: new Date(1970,8,2),
                
        });

            $('#submitBoton').click(function(){
                var nombre = $('#nombre').val();
                var apellidos = $('#apellidos').val();
                var contrasenya = $('#contrasenya').val();
                var dni = $('#dni').val();
                var pais = $('#pais').val();
                var telefono = $('#icon_telephone').val();
                var cumpleanyos = $('#cumpleanyos').val();
                var imagen = $('#imagen').val();

                console.log(pais);
                if(nombre.length < 3 || apellidos.length < 5 || contrasenya.length  < 5 || dni.length  < 9 || pais == null ||telefono.length < 5 
                   || cumpleanyos.length < 4 || imagen == ""){
                    alert("Introduzca sus datos correctamente ");
                    return false;
                }
            });
                    });
    </script>
    <% 
      
               HttpSession httpsession = request.getSession();           
               Customer usuario = (Customer) httpsession.getAttribute("usuario");
               
    %>
        <div class="row" style="margin-bottom:25%;">
            <div class="col l3"></div>
            <div class="col l6 m12 s12">
                <h3 style="text-align:center;">Editar perfil</h3>            
                <form name="f1" action="EditProfile" method="post" enctype="multipart/form-data">
                     <div class="row">
                        <div class="input-field col s6 m6 l6">
                            <i class="material-icons prefix">person</i>
                            <input id="nombre" type="text" class="validate" name="nombre" value="<% out.println(usuario.getName()); %>">
                            <label for="nombre">Nombre</label>
                        </div>
                        <div class="input-field col s6 m6 l6">
                            <input id="apellidos" type="text" class="validate" name="apellidos" value="<% out.println(usuario.getSurnames()); %>">
                            <label for="apellidos">Apellidos</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12 l12 m12">
                            <i class="material-icons prefix">email</i>
                            <input id="email" type="email" class="validate" name="email"  value="<% out.println(usuario.getEmail()); %>">
                            <label for="email">Email</label>
                        </div>                    
                    </div>
                    <div class="row">
                        <div class="input-field col s6">
                            <i class="material-icons prefix">lock</i>
                            <input id="contrasenya" type="password" class="validate" name="password" >
                            <label for="contrasenya">Contraseña</label>
                        </div> 
                        <div class="input-field col s6">
                            <i class="material-icons prefix">pan_tool</i>
                            <input id="dni" type="text" class="validate" name="dni"  value="<% out.println(usuario.getDni()); %>">
                            <label for="dni">DNI</label>
                        </div> 
                    </div>
                    <div class="row">
                        <div class="input-field col s12">
                            <i class="material-icons prefix">local_airport</i>
                            <select id="pais" name="pais">
                                <option value="" disabled selected>Elige tu pais de residencia</option>
                                <option value="España">España</option>
                                <option value="Andorra">Andorra</option>
                                <option value="Reino Unido">Reino Unido</option>
                                <option value="Francia">Francia</option>
                                <option value="Italia">Italia</option>
                                <option value="Hungría">Hungría</option>
                                <option value="Irlanda">Irlanda</option>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s6">
                            <i class="material-icons prefix">phone</i>
                            <input id="icon_telephone" type="tel" class="validate" name="phone"  value="<% out.println(usuario.getPhone()); %>">
                            <label for="icon_telephone">Telefono</label>
                        </div>
                       <div class="input-field col s12 l6 m6">
                            <p style="float:left;margin-top:0">Foto de perfil:</p><input id="imagen" type="file" name="imagen" style="float:right;" >
                        </div>                
                    </div>

                    <div class="row">
                        <div class="col s4 m4 l4"></div>
                        <div class="col s4 m4 l4">
                            <button id="submitBoton" class="btn waves-effect teal darken-4" type="submit" name="action">Editar
                                <i class="material-icons right">send</i>
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
