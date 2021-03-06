﻿<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="supportdetail.ascx.vb" Inherits=".supportdetail5" %>
<link href="/admin/assets/css/style.css" rel="stylesheet" type="text/css" />
<div id="module" class="pagePopup">
    <div class="boxToggle" runat="server">
        <div class="toggleTitle">
            <div class="titleText"><%=ModuleTitle%></div>
        </div>
    
        <div class="toggleContent">
        	<div class="dataForm">
                <div class="alert row" runat="server" id="divAlert" visible="false"><label class="colOne"><asp:Label ID="lblMessage" runat="server"></asp:Label></label></div>
                <div runat="server" id="divContent">
                	<div class="row">
                    	<div class="colOne">
                        	<asp:Label runat="server" ID="lblTitle"></asp:Label>
                        </div>
                    </div>
                    <div class="row">
                    	<div class="colTwo">
                        	Konu : <asp:Label runat="server" ID="lblSubject"></asp:Label>
                        </div>
                    </div>
                    <div class="row">
                    	<div class="colOne">
                        	Konuyu Açan : <asp:Label runat="server" ID="lblUserMail"></asp:Label>
                        </div>
                    </div>
                    <asp:Panel CssClass="row" runat="server" ID="pnlCevap" Visible="false">
                        <asp:TextBox runat="server" TextMode="MultiLine" Rows="10" ID="txtCevap" CssClass="colOne" ValidationGroup="1" Width="100%"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" CssClass="colOne" ControlToValidate="txtCevap" ErrorMessage="Boş Bırakılamaz" ValidationGroup="1"></asp:RequiredFieldValidator>
                       <div class="colOne">
                       <label> Dosya Yükle</label>
                       </div>
                       <div class="row">
                           <div class="colTwo">
                                <asp:FileUpload ID="FileUpload1" runat="server" />
                           </div>
                           <div class="colTwo"><asp:LinkButton ID="btnCevapYaz" runat="server" CssClass="button" Text="Cevap Yaz" ValidationGroup="1"></asp:LinkButton></div>
                       </div>
                        
                        <asp:Label ID="lblAssignedUserId" runat="server" Text="" Visible="false" />
                        <br>
                    </asp:Panel>
                     <div class="row">
                    	<div class="colOne">
                        	<asp:Repeater runat="server" ID="rptComment">
                                <ItemTemplate>
                                    <div class='<%# iif(Eval("IsAnswer"),"information","alert") %>'>
                                        <asp:Label runat="server" ID="lblMail"></asp:Label><br />
                                        <asp:Label runat="server" ID="lblDate" Text='<%# Eval("Date") %>'></asp:Label><br />
                                        <asp:Literal runat="server" ID="lblBody" Text='<%# Eval("Message") %>'></asp:Literal><br />
                                        <asp:Label runat="server" ID="lblAssignedUserDetail" ToolTip='<%# Eval("assignedUserDetail") %>' Text='<%# Eval("IsAnswer") %>' Visible="false"></asp:Label>
                                        <asp:Label runat="server" ID="lblUserDetail" ToolTip='<%# Eval("UserDetail") %>' Text='<%# Eval("IsAnswer") %>' Visible="false"></asp:Label>
                                    </div>
                                </ItemTemplate>
                                <SeparatorTemplate>
                                </SeparatorTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                    
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="<% =getThemePath() %>/js/rendermodules.js"></script>
<%--<script type="text/javascript">
    var newwindow;
    function popup(url) {
        newwindow = window.open(url, 'name', 'width=900,height=800,scrollbars=1,toolbar=0,status=1,resizable=1');
        if (window.focus) { newwindow.focus() }
    }
</script>--%>
