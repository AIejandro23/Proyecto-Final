<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        .card .card-content{
            min-height: 132px;
        }
    </style>
    <!-- NAVBAR -->
   
    <div class="container">
        <div class="row" style="margin-top:2%;">
            <h2 class="center-align">CONSULTA NUESTROS VEHÍCULOS</h1>
            <div class="col s12 m12 l12">
                <div class="input-field col s2">
                    <input type="text" class="datepicker">
                    <label>Fecha de recogida</label>
                </div>
                <div class="input-field col s2">
                    <input type="text" class="datepicker">
                    <label>Fecha de vuelta</label>
                </div>
                <div class="input-field col s4">
                    <select>
                        <option value="" disabled selected>Recogida y devolución</option>
                        <option value="0">Aeropuerto de Palma de Mallorca</option>
                        <option value="1">5</option>
                        <option value="2">7</option>
                        <option value="3">9</option>
                    </select>
                    <label>Lugar de recogida y devolución</label>
                </div>
                <div class="input-field col s2">
                    <select>
                        <option value="" disabled selected>Marca</option>
                        <option value="0">Cualquiera</option>
                        <option value="1">Renault</option>
                        <option value="2">Fiat</option>
                        <option value="3">Opel</option>
                        <option value="4">Nissan</option>
                    </select>
                    <label>Elige la marca</label>
                </div>
              
                <div class="input-field col s2">
                    <button class="btn waves-effect teal darken-4" type="submit" name="action">BUSCAR
                        <i class="material-icons right">send</i>
                    </button>
                </div>
            </div>
        </div>
        <!-- CARTAS DE VEHÍCULOS -->
        <div class="row">
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
                        <img src="imagenes/coche3.png">
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
                    <a class="carousel-item" href="#one!"><img src="imagenes/carretera1.jpg" height="100%"></a>
                    <a class="carousel-item" href="#two!"><img src="imagenes/carretera2.jpg" height="100%"></a>
                    <a class="carousel-item" href="#two!"><img src="imagenes/carretera3.jpg" height="100%"></a>
                    <a class="carousel-item" href="#two!"><img src="imagenes/carretera4.jpg" height="100%"></a>
                </div>
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
