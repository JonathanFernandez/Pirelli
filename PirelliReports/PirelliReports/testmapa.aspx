<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="testmapa.aspx.cs" Inherits="PirelliReports.testmapa" %>
<%@ Register Assembly="GMaps" Namespace="Subgurim.Controles" TagPrefix="cc" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="width:660px; height:560px;">
      <cc:GMap ID="GMap1" runat="server" />
    </div>
    </form>
</body>
</html>
