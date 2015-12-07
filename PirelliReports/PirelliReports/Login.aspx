<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="PirelliReports.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Pirelli - Login</title>

    <!-- jQuery -->
    <script src="Content/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="Content/js/bootstrap.min.js"></script>

    <!-- login -->
    <script src="Content/js/login.js"></script>    

    <!-- Bootstrap Core CSS -->
    <link href="Content/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="Content/css/sb-admin.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="Content/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
   <script >
       
       function openModal() {
          
           $('#login_modal').modal('show');
       }
       function btnLogin_OnClientClick() {
           //debugger;
           //document.getElementById("loginform").action = "About.aspx";
           //  document.getElementById("loginform").submit();
       }
       function btn_enviar_OnClientClick() {
           //document.getElementById("loginform").action = "Default.aspx";
           //document.getElementById("loginform").submit();
       }
       function lost_login_btn_OnClientClick() {

       }
       function darClick() {

           $('.modal-lost-password').css('display', 'block');
           $('.modal-login').css('display', 'none');
           $('#login_username').prop('disabled', true);
           $('#login_password').prop('disabled', true);
           $('#lost_email').prop('disabled', false);

       }
 
       //if (document.getElementById("HDModoModal").value == "MAIL")
       //{
       //    darClick();
       //}
 
   </script>
</head>
<body>
    <form id="loginform" runat="server" >
    <div >
        <div class="login-wrapper">

        <!-- BEGIN # BOOTSNIP INFO -->
        <div class="container">
            <div class="row">
                <div class="row-50 margin-5 background-black">
                    <div class="logo-login">
                        <img class="logo-pirelli" src="Content/img/logo_pirelli.jpg"/>
                    </div>
                    <h2 class="">Bienvenido a Pirelli Promotions & Reports</h2>
                    <h3> Haga click para ingresar</h3>
                    <p class="">
                        <a href="#" class="btn btn-warning btn-lg" id="login-btn" role="button" data-toggle="modal" data-target="#login_modal">Login</a>
                        <%--<asp:Button runat="server" ID="btnLoginInicio" text="Login" class="btn btn-warning btn-lg"  data-toggle="modal" data-target="#login_modal" ></asp:Button>--%>
                    </p>
                    <%--<p class="">
                        <label>
                            <asp:Label runat="server" id="lblPassIncorrecta" Text="Contraseña incorrecta" Visible="false"></asp:Label>
                        </label>
                    </p>
                    <p class="">
                        <label>
                            <asp:Label runat="server" id="lblMailIncorrecto" Text="E-mail incorrecto" Visible="false"></asp:Label>
                        </label>
                    </p>--%>
                </div>
            </div>
        </div>
   </div>
        <!-- END # BOOTSNIP INFO -->

        <!-- BEGIN # MODAL LOGIN -->
        <div class="modal fade" id="login_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header" align="center">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
                                <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                            </button>
                            <img id="img_logo" src="Content/img/logo_pirelli_small.svg"/>                            
                        </div>
                        
                        <!-- Begin # DIV Form -->
                       
                        
                            <!-- Begin # Login Form -->
                            
                                
                                <div id="login-backup"></div>
                                <div class="modal-login">
                                    <div class="modal-body">
                                        <div id="div-login-msg">
                                            <div id="icon-login-msg" class="glyphicon glyphicon-chevron-right"></div>
                                            <span id="text-login-msg">Ingrese su nombre y contraseña.</span>
                                        </div>
                                        <asp:TextBox runat="server" id="login_username" class="form-control"  placeholder="Usuario" required/>
                                        <asp:TextBox runat="server" TextMode="Password" class="form-control" id="login_password" placeholder="Contraseña" required/>
                                       <%--<div class="checkbox">
                                            <label>
                                                <asp:Label runat="server" id="lblPassIncorrecta" Text="Contraseña incorrecta" Visible="false"></asp:Label
                                            </label>
                                        </div>--%>
                                        <p>
                                            <label>
                                                <asp:Label runat="server" id="lblPassIncorrecta" Text="Contraseña incorrecta" Visible="false"></asp:Label>
                                            </label>
                                        </p>
                                        
                                    </div>
                                    <div class="modal-footer">
                                        <div>
                                            <asp:Button runat="server" Text="Login" id="btnLogin" class="btn btn-warning btn-lg btn-block"  OnClick="btnLogin_Click" OnClientClick="btnLogin_OnClientClick()" />
                     
                                        </div>
                                        <div>
                                            <asp:Button runat="server" id="login_lost_btn" class="btn btn-link" Text="¿Olvidaste tu contraseña?" OnClientClick="return false;"/>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="modal-lost-password">
                                     <div class="modal-body">
                                        <div id="div-lost-msg">
                                            <div id="icon-lost-msg" class="glyphicon glyphicon-chevron-right"></div>
                                            <span id="text-lost-msg">Ingrese su e-mail.</span>
                                        </div>
                                        <%--<input id="lost_email" class="form-control" type="text" placeholder="E-mail" required>--%>
                                        <asp:TextBox runat="server" id="lost_email" class="form-control" placeholder="E-mail" required />
                                        <p>
                                                <label>
                                                    <asp:Label runat="server" id="lblMailIncorrecto" Text="E-mail incorrecto" Visible="false"></asp:Label>
                                                </label>
                                        </p>
                                    </div>
                                    <div class="modal-footer">
                                        <div>
                                            <%--<button type="submit" class="btn btn-warning btn-lg btn-block">Enviar</button>--%>
                                            <asp:Button runat="server" id="btn_enviar" class="btn btn-warning btn-lg btn-block" Text="Enviar" OnClick="btn_enviar_Click" OnClientClick="btn_enviar_OnClientClick()"  />
                                        </div>
                                        <div>
                                            <%--<button id="lost_login_btn" type="button" class="btn btn-link">Login</button>--%>
                                            <asp:Button runat="server" id="lost_login_btn" class="btn btn-link" Text="Login"  OnClientClick="return false;"/>
                                        </div>
                                    </div>
                                  </div>
                            
                            <!-- End # Login Form -->                
                            
                       
                        <!-- End # DIV Form -->
                        
                    </div>
                </div>
            </div>
            <!-- END # MODAL LOGIN -->

    </div>
   
    </form>
    <%--</form>--%>
     <!-- /#wrapper -->

    
</body>
    
</html>
