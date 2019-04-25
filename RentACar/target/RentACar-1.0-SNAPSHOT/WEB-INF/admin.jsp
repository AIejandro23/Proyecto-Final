


    <script>
        // CAROUSEL SCRIPT
        $(document).ready(function () {
            $('select').formSelect();
            $('.datepicker').datepicker();
            $('.carousel.carousel-slider').carousel({
                fullWidth: true
            });

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

    <div class="container">

        <div class="row">
            <h3>Registrar vehículo</h3>
            <div class="col s12" style="margin-top:2%;">
                <form action="InsertCar">
                    <div class="input-field col s2">
                        <input type="text" name="matricula">
                        <label>Matricula</label>
                    </div>
                    <div class="input-field col s2">
                        <select name="marca">
                            <option value="" disabled selected>Marca</option>
                            <option value="Renault">Renault</option>
                            <option value="Fiat">Fiat</option>
                            <option value="Opel">Opel</option>
                            <option value="Nissan">Nissan</option>
                        </select>
                        <label>Elige la marca</label>
                    </div>
                    <div class="input-field col s2">
                        <select name="localizacion">
                            <option value="" disabled selected>Localización</option>
                            <option value="Palma" >Palma</option>
                            <option value="Ibiza">Ibiza</option>
                        </select>
                        <label>Elige la localización</label>
                    </div>
                    <div class="input-field col s2">
                        <input type="text" name="modelo">
                        <label>Modelo</label>
                    </div>
                    <div class="input-field col s2">
                        <button class="btn waves-effect teal darken-4" type="submit" name="action">BUSCAR
                            <i class="material-icons right">send</i>
                        </button>
                    </div>
                </form>
            </div>

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

