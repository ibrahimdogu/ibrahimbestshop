﻿<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="offertypelist.ascx.vb" Inherits="offertypelist" %>
<%@ Register Assembly="AjaxControls" Namespace="AjaxControls" TagPrefix="asp" %>
<div id="module" class="pagePopup">

    <div class="buttonGroup">
        <asp:HyperLink ID="Linkaddnewoffertype" runat="server" CssClass="btnDefault fancyContent"><i class="fa fa-plus"></i> Yeni Teklif Türü Ekle</asp:HyperLink>
    </div>
    <div class="dataForm">
        <asp:UpdatePanel ID="uPanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <asp:Label ID="lblmsg" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="msg" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="lblSort" runat="server" Visible="False" Text=""></asp:Label>
                <asp:Label ID="lbl" runat="server" Visible="False"></asp:Label>
                <div class="dataTable">
                    <asp:GridView ID="gvOfferTypeList" runat="server" GridLines="None" AutoGenerateColumns="False" DataKeyNames="id" EnableModelValidation="True" HeaderStyle-CssClass="title" HeaderStyle-HorizontalAlign="Left">
                        <Columns>
                            <asp:BoundField DataField="id" HeaderText="IND" SortExpression="id" ReadOnly="True" Visible="false" />
                            <asp:TemplateField HeaderText="Teklif Türü Kodu">
                                <ItemTemplate>
                                    <asp:HyperLink ID="HyperLink1" runat="Server" CssClass="btnLink fancyContent" NavigateUrl='<%# "/admin/offer/editoffertype.aspx?IND=" & DataBinder.Eval(Container.DataItem, "id")%> '> <%# DataBinder.Eval(Container.DataItem, "OfferTypeCode")%></asp:HyperLink>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="OfferTypeName" HeaderText="Teklif Türü Adı" ReadOnly="True" SortExpression="OfferTypeName" />
                            <asp:BoundField DataField="OfferTypeDesc" HeaderText="Teklif Türü Açıklaması" ReadOnly="True" SortExpression="OfferTypeDesc" />

                            <asp:TemplateField HeaderText="Sil" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" >
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkbtnDelete" runat="server" Enabled="<%# IsAllowedOnDemo() %>" CausesValidation="False" CommandName="Delete" CssClass="btnIcon" OnClientClick="return confirm('Silmek istediğinizden emin misiniz?');"><i class="fa fa-trash-o"></i></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
                <div class="dataCount">
                    <ul>
                        <li>Toplam Kayıt :<asp:Label ID="lblTotalRecord" runat="server"></asp:Label></li>
                        <li>Toplam Sayfa :<asp:Label ID="lblPageCount" runat="server"></asp:Label></li>
                        <li>Geçerli Sayfa :<asp:Label ID="lblCurrentIndex" runat="server"></asp:Label></li>
                    </ul>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</div>
<script type="text/javascript">
    var newwindow;
    function popup(url) {
        newwindow = window.open(url, 'name', 'width=600,height=600,scrollbars=1,toolbar=0,status=1,resizable=1');
        if (window.focus) { newwindow.focus() }
    }
</script>