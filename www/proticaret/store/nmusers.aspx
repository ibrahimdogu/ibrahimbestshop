﻿<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="nmusers.aspx.vb" Inherits="ASPNetPortal.nmusers" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
    <div id="container">
        <form id="Form1" runat="server">
            <div id="header" runat="server"></div>
            <div id="main">
                <table width="100%" cellpadding="0" cellspacing="0" border="0">
                    <tr>
                        <td id="left" runat="server" visible="false" valign="top"><a class="middleLeftButton"></a></td>
                        <td id="center" valign="top">
                            <div id="center_top">
                                <table width="100%" cellpadding="0" cellspacing="0" border="0">
                                    <tr>
                                        <td id="top_left" runat="server" visible="false" valign="top"></td>
                                        <td id="top_center" runat="server" visible="false" valign="top"></td>
                                        <td id="top_right" runat="server" visible="false" valign="top"></td>
                                    </tr>
                                </table>
                            </div>
                            <div id="center_middle">
                                <table width="100%" cellpadding="0" cellspacing="0" border="0">
                                    <tr>
                                        <td id="middle_left" runat="server" valign="top"><a class="middleLeftButton"></a></td>
                                        <td id="middle_center" runat="server" valign="top"></td>
                                        <td id="middle_right" runat="server" visible="false" valign="top"></td>
                                    </tr>
                                </table>
                            </div>
                            <div id="center_bottom">
                                <table width="100%" cellpadding="0" cellspacing="0" border="0">
                                    <tr>
                                        <td id="bottom_left" runat="server" visible="false" valign="top"></td>
                                        <td id="bottom_center" runat="server" visible="false" valign="top"></td>
                                        <td id="bottom_right" runat="server" visible="false" valign="top"></td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                        <td id="right" runat="server" visible="false" valign="top"></td>
                    </tr>
                </table>
            </div>
            <div id="footer" runat="server"></div>
        </form>
    </div>
</body>
</html>
