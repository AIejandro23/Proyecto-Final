
    <script>
        $(document).ready(function () {
            $('select').formSelect();
        });
    </script>


        <div class="container">

        <div class="row" style="margin-top:3%;">
            <div class="col l4"></div>
            <div class="col l4 m12 s12">
                <form class="col s12 m12 l12" action="Loguear">
                    <div class="row">
                        <div class="input-field col s12 m12 l12">
                            <i class="material-icons prefix">email</i>
                            <input id="nombre" type="text" class="validate" name="email">
                            <label for="nombre">Email</label>
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
                        <div class="col s4 m4 l4"></div>
                        <div class="col s4 m4 l4">
                            <button class="btn waves-effect teal darken-4" type="submit" name="action">Entrar
                                <i class="material-icons right">send</i>
                            </button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="col l4"></div>

        </div>
    </div>

    <footer class="page-footer teal darken-4" style="margin-top:18%;">
        <div class="container ">
            <div class="row ">
                <div class="col m6 l6 s12">
                    <h5 class="white-text">Sobre nosotros</h5>
                    <p class="grey-text text-lighten-4">Somos una empresa de alquiler de vehículos que lleva mas de 20
                        años ofreciendo nuestros servicios
                        en las Islas Baleares.</p>
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
