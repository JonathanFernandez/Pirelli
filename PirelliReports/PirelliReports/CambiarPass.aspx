<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CambiarPass.aspx.cs" Inherits="PirelliReports.CambiarPass" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Pirelli - Cambiar Contraseña</title>

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
      
     
   </script>
</head>
<body>
    <form id="frmCambiarPass" runat="server" >
    <div >
        <div class="login-wrapper">

        <!-- BEGIN # BOOTSNIP INFO -->
        <div class="container">
            <div class="row">
                <div class="row-50 margin-5 background-black">
                    <div class="logo-login">
                        <img class="logo-pirelli" src="Content/img/logo_pirelli.jpg"/>
                    </div>
                    <h2 class="">Para reestablecar su contraseña</h2>
                    <h3> Haga click en el siguiente boton</h3>
                    <p class="">
                        <asp:Button runat="server" Text="Reestablecer Contraseña" id="btnCambiarPass" class="btn btn-warning btn-lg" OnClick="btnCambiarPass_Click" />
                        <%--<asp:Button runat="server" ID="btnLoginInicio" text="Login" class="btn btn-warning btn-lg"  data-toggle="modal" data-target="#login_modal" ></asp:Button>--%>
                    </p>
                    <p class="">
                        <label>
                            <asp:Label runat="server" id="lblMailInexistente" Text="Mail Inexistente" Visible="false"></asp:Label>
                            <asp:Label runat="server" id="lblExito" Text="Se cambio con exito la contraseña, su contraseña es igual a su usuario" Visible="false"></asp:Label>
                        </label>
                    </p>
                    <p class="">
                      <asp:Button runat="server" ID="btnLoginVolver" text="Ir a Login" class="btn btn-warning btn-lg" visible="false" data-toggle="modal" data-target="#login_modal" OnClick="btnLoginVolver_Click"></asp:Button>
                    </p>
                </div>
            </div>
        </div>
   </div>
        <!-- END # BOOTSNIP INFO -->

    </div>
    </form>
    <%--</form>--%>
     <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="Content/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="Content/js/bootstrap.min.js"></script>

    <!-- login -->
    <script src="Content/js/login.js"></script>    
</body>
</html>

