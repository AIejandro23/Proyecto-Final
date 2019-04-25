
    <script>
        $(document).ready(function () {
            $('select').formSelect();
      
        });
    </script>

        
        <div class="container">

        <div class="row" style="margin-top:2%;">
            <div class="col l4"></div>
            <div class="col l4 m12 s12">
                <form action="InsertUser">
                    <div class="row">
                        <div class="input-field col s6 m6 l6">
                            <i class="material-icons prefix">person</i>
                            <input id="nombre" type="text" class="validate" name="nombre">
                            <label for="nombre">Nombre</label>
                        </div>
                        <div class="input-field col s6 m6 l6">
                            <input id="apellidos" type="text" class="validate" name="apellidos">
                            <label for="apellidos">Apellidos</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12">
                            <i class="material-icons prefix">email</i>
                            <input id="email" type="text" class="validate" name="email">
                            <label for="email">Email</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12">
                            <i class="material-icons prefix">lock</i>
                            <input id="contrasenya" type="password" class="validate" name="password">
                            <label for="contrasenya">Contraseña</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12">
                            <i class="material-icons prefix">local_airport</i>
                            <select name="pais">
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
                            <input id="icon_telephone" type="tel" class="validate" name="phone">
                            <label for="icon_telephone">Telefono</label>
                        </div>
                        <div class="input-field col s6">
                            <i class="material-icons prefix">cake</i>
                            <input type="date" class="datepicker" name="birthday"/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col s4 m4 l4"></div>
                        <div class="col s4 m4 l4">
                            <button class="btn waves-effect teal darken-4" type="submit" name="action">Registrame
                                <i class="material-icons right">send</i>
                            </button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="col l4"></div>

        </div>
    </div>

    <footer class="page-footer teal darken-4" style="margin-top:5%;">
        <div class="container ">
            <div class="row ">
                <div class="col m6 l6 s12">
                    <h5 class="white-text">Sobre nosotros</h5>
                    <p class="grey-text text-lighten-4">Somos una empresa de alquiler de vehÃ­culos que lleva mas de 20
                        aÃ±os ofreciendo nuestros servicios
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
                Â© 2019 Copyright - Todos los derechos reservados.
                <a class="grey-text text-lighten-4 right" href="#!">Pagina web creada Ãºnica y exclusivamente por
                    Alejandro GarcÃ­a CapellÃ¡</a>
            </div>
        </div>
  