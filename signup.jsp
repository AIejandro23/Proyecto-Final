<!DOCTYPE html>
<html>

<head>
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
    <script>
        $(document).ready(function () {
            $('select').formSelect();
        });
    </script>
</head>

<body>
        <!-- NAVBAR -->
        <nav>
            <div class="nav-wrapper  teal darken-4">
                <a href="index.html" class="brand-logo" style="margin-left: 2%;"><i
                        class="medium material-icons">directions_car</i>RentACar</a>
                <ul id="nav-mobile" class="right hide-on-med-and-down">
                    <li><a href="#">Ofertas</a></li>
                    <li><a href="#">Vehículos</a></li>
                    <li><a href="login.html">Log In</a></li>
                </ul>
            </div>
        </nav>
        <div class="container">

        <div class="row" style="margin-top:2%;">
            <div class="col l4"></div>
            <div class="col l4 m12 s12">
                <form class="col s12 m12 l12">
                    <div class="row">
                        <div class="input-field col s6 m6 l6">
                            <i class="material-icons prefix">person</i>
                            <input id="nombre" type="text" class="validate">
                            <label for="nombre">Nombre</label>
                        </div>
                        <div class="input-field col s6 m6 l6">
                            <input id="apellidos" type="text" class="validate">
                            <label for="apellidos">Apellidos</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12">
                            <i class="material-icons prefix">email</i>
                            <input id="email" type="text" class="validate">
                            <label for="email">Email</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12">
                            <i class="material-icons prefix">lock</i>
                            <input id="contrasenya" type="password" class="validate">
                            <label for="contrasenya">Contraseña</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12">
                            <i class="material-icons prefix">local_airport</i>
                            <select>
                                <option value="" disabled selected>Elige tu pais de residencia</option>
                                <option value="1">España</option>
                                <option value="3">Andorra</option>
                                <option value="2">Reino Unido</option>
                                <option value="3">Francia</option>
                                <option value="3">Italia</option>
                                <option value="3">Hungría</option>
                                <option value="3">Irlanda</option>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s6">
                            <i class="material-icons prefix">phone</i>
                            <input id="icon_telephone" type="tel" class="validate">
                            <label for="icon_telephone">Telefono</label>
                        </div>
                        <div class="input-field col s6">
                            <i class="material-icons prefix">cake</i>
                            <input type="date" class="datepicker" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col s4 m4 l4"></div>
                        <div class="col s4 m4 l4">
                            <button class="btn waves-effect teal darken-4" type="submit" name="action">Regístrame
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
                    Alejandro García Capellás</a>
            </div>
        </div>
    </footer>
</body>