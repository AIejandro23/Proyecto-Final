
    <script>
        $(document).ready(function () {
            $('select').formSelect();
        });
    </script>


        <div class="container">

        <div class="row" style="margin-top:3%;margin-bottom:325px;">
            <div class="col l4"></div>
            <div class="col l4 m12 s12">
                <h2 class="center-align">Inicia sesión</h2>
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
                    <div class="row">
                         <%  HttpSession httpsession = request.getSession();
                            Boolean error = (Boolean) httpsession.getAttribute("error");    
                            if(error != null){%>
                            <p style="text-align:center; color:red;"> Error su usuario o contraseña no son correctos </p>
                       <% }%>
                    </div>
                </form>
            </div>
            <div class="col l4"></div>

        </div>
    </div>
