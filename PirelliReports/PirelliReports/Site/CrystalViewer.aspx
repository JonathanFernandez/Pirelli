﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CrystalViewer.aspx.cs" Inherits="PirelliReports.Site.CrystalViewer" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <script lang="javaScript" type="text/javascript" src="../aspnet_client/system_web/4_0_30319/crystalreportviewers13/js/crviewer/crv.js"></script>
</head>

<body>
    <form id="form1" runat="server">
    <div>
        <CR:CrystalReportViewer ID="crviewer" runat="server" AutoDataBind="true"  />
    
    </div>
    </form>
</body>
</html>
