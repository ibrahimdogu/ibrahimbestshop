﻿<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="productwhole.ascx.vb" Inherits="ASPNetPortal.productwhole" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="AjaxControls" Namespace="AjaxControls" TagPrefix="asp" %>

<script src="<% =getThemePath() %>/js/jquery.timers.min.js" type="text/javascript"></script>
<%  If ConfigurationManager.AppSettings("UseZoomOnImages") = "True" Then%>
<link href="<% =getThemePath() %>/css/jquery.jqzoom.css" type="text/css" rel="stylesheet" />
<script src="<% =getThemePath() %>/js/jquery.jqzoom.min.js" type="text/javascript"></script>
<script type="text/javascript">
    $(document).ready(function () {

        $('.jqzoom').jqzoom({
            zoomType: 'standard',
            lens: true,
            preloadImages: false,
            alwaysOn: false,
            title: false
        });
    });
</script>
<% End If%>
<link href="<% =getThemePath() %>/css/imageslider.css" type="text/css" rel="stylesheet" />
<script src="<% =getThemePath() %>/js/imageslider.min.js" type="text/javascript"></script>

<script type="text/javascript">
    var VariantValue = "<%=VariantValue %>"
</script>

<div id="product-detail" class="module">
    <div id="module_content">
        <% If HeaderVisible Then%>
        <div id="module_title">
            <span>
                <span id="module_title_icon"></span><%=ModuleTitle%>
                <asp:Repeater ID="Navigation" runat="server">
                    <HeaderTemplate>
                        <span><a href="<%= Baseurl %>"><%=GetGlobalResourceObject("lang", "MainPage")%></a></span><a> /</a>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <span><a href='<%# string.format(BaseUrl & "{0}" & ".aspx",container.dataitem("Url").tostring.Remove(container.dataitem("Url").tostring.Length - 1, 1) ) & iif(Request.QueryString.Item("tabId")="","","?tabId=" & Request.QueryString.Item("tabId")) %>'>
                            <%#Container.DataItem("CatName")%>
                        </a></span>
                    </ItemTemplate>
                    <SeparatorTemplate>
                        <separatortemplate><a>/</a></separatortemplate>
                    </SeparatorTemplate>
                </asp:Repeater>
                <% If IsEditable Then%>
                <a href="<%=EditNavigateUrl %>" id="module_title_edit"><%=EditText %></a>
                <% End If%>
            </span>
        </div>
        <% End If%>

        <div>
            <div id="alert" visible="false" runat="server" class="alert"><%=GetGlobalResourceObject("lang", "ProductRemoved")%></div>

            <div id="TblUrunDetayModul" runat="server" class="TblUrunDetayModul">
                <label>
                    <h1>
                        <asp:Label ID="lblProductName" runat="server"></asp:Label></h1>
                    <asp:Label ID="lblProductCode" runat="server" Visible="False"><%=GetGlobalResourceObject("lang", "ProductCode")%>: <%= ProductCode %></asp:Label>
                </label>

                <div id="left">
                    <div id="imageTabContainer" style='width: <%= (ImageSize+30) & "px;"%>'>
                        <ul>
                            <li><a href="#tab_images"><%=GetGlobalResourceObject("lang", "Images")%></a></li>
                            <li id="tab_videos_link" runat="server"><a href="#tab_videos"><%=GetGlobalResourceObject("lang", "Video")%></a></li>
                            <li id="tab_3dPicture_link" runat="server"><a href="#tab_3dPicture">3d <%=GetGlobalResourceObject("lang", "Images")%></a></li>
                        </ul>
                        <div id="tab_images">
                            <div id="slider_container" class="slidercontainer" runat="server">
                                <div id="fix"></div>
                                <div class="clear"></div>
                            </div>
                        </div>
                        <div id="tab_videos">
                            <asp:Label runat="server" ID="pnlvideo"></asp:Label>
                        </div>
                        <div id="tab_3dPicture">
                            <asp:Label runat="server" ID="lbl3dPicture"></asp:Label>
                            <asp:Label runat="server" ID="lbl3dFrame"></asp:Label>
                        </div>
                    </div>
                    <div id="Price_container">
                        <table width="100%" cellspacing="0" cellpadding="0" border="0">
                            <% If (ConfigurationManager.AppSettings("OnlyUsersCanSeePrice") = "True" And HttpContext.Current.User.Identity.IsAuthenticated()) Or ConfigurationManager.AppSettings("OnlyUsersCanSeePrice") <> "True" Then%>
                            <tr>
                                <td>
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <table id="FiyatPanel" cellspacing="0" cellpadding="5" width="100%" border="0">
                                                <%If MarkName <> "" Then%>
                                                <tr>
                                                    <td><%=GetGlobalResourceObject("lang", "ProductMark")%></td>
                                                    <td>:</td>
                                                    <td align="right"><a href="<%= string.format(BaseUrl & "/marka/{0}" & ".aspx", dourl(MarkName)) %>"><%=MarkName%></a></td>
                                                    <td></td>
                                                </tr>
                                                <%End If%>
                                                <%If AuthorName <> "" Then%>
                                                <tr>
                                                    <td><%=GetGlobalResourceObject("lang", "Author")%></td>
                                                    <td>:</td>
                                                    <td colspan="2"><a href="<%=AuthorUrl %>"><%=AuthorName%></a></td>
                                                </tr>
                                                <%End If%>
                                                <%If PublisherName <> "" Then%>
                                                <tr>
                                                    <td><%=GetGlobalResourceObject("lang", "Publisher")%></td>
                                                    <td>:</td>
                                                    <td colspan="2"><a href="<%=PublisherUrl %>"><%=PublisherName%></a></td>
                                                </tr>
                                                <%End If%>
                                                <%If ChkEmptyDateString(StartDate, "dd.MM.yyy") <> "" Then%>
                                                <tr>
                                                    <td><%=GetGlobalResourceObject("lang", "StartDate")%></td>
                                                    <td>:</td>
                                                    <td colspan="2"><%=ChkEmptyDateString(StartDate, "dd.MM.yyy")%></td>
                                                </tr>
                                                <%End If%>
                                                <%If ChkEmptyDateString(EndDate, "dd.MM.yyy") <> "" Then%>
                                                <tr>
                                                    <td><%=GetGlobalResourceObject("lang", "EndDate")%></td>
                                                    <td>:</td>
                                                    <td colspan="2"><%=ChkEmptyDateString(EndDate, "dd.MM.yyy") %></td>
                                                </tr>
                                                <%End If%>
                                                <% If _portalsettings.PointsIsActive And _portalsettings.PointsValue > 0 Then%>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblPuanl" runat="server"><%=GetGlobalResourceObject("lang", "Point")%></asp:Label></td>
                                                    <td>:</td>
                                                    <td align="right">
                                                        <asp:Label ID="lblPuant" runat="server"><%=formatNumberEx(CalcRate(SatisFiyati, _portalsettings.PointsValue))%></asp:Label></td>
                                                    <td></td>
                                                </tr>
                                                <%End If%>
                                                <%If PiyasaFiyati > 0 Then%>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label3" runat="server"><%=GetGlobalResourceObject("lang", "PriceMarket")%></asp:Label></td>
                                                    <td>:</td>
                                                    <td align="right">
                                                        <asp:Label ID="Label7" runat="server"><%= CurrencySymbolLeft & " " &  formatCurDoviz(PiyasaFiyati * RateP / CurrencyRate) & "  " & CurrencySymbolRight%></asp:Label>
                                                    </td>
                                                    <td><%=GetGlobalResourceObject("lang", "PlusTax")%></td>
                                                </tr>
                                                <% End If%>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblMainPriceLabel" runat="server"><%=IIf(StokIskActive Or UserIndirim > 0 Or StokIsk > 1, GetGlobalResourceObject("lang", "PriceForYou"), GetGlobalResourceObject("lang", "Price"))%></asp:Label></td>
                                                    <td>:</td>
                                                    <td align="right">
                                                        <asp:Label ID="lblMainPrice" runat="server"><%=CurrencySymbolLeft & " " &   formatCurDoviz(MainPrice)& "  " & CurrencySymbolRight%></asp:Label>
                                                    </td>
                                                    <td></td>
                                                </tr>
                                                <%If (TransferDiscount > 0 Or (TransferPrice > 0 And Rate > 0)) Then%>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblh1" runat="server"><%=GetGlobalResourceObject("lang", "PriceTrasfer")%></asp:Label></td>
                                                    <td>:</td>
                                                    <td align="right">
                                                        <asp:Label ID="lblTransferFiyat" runat="server"><%= CurrencySymbolLeft & " " & formatCurDoviz(TransferPrice) & "  " & CurrencySymbolRight%></asp:Label>
                                                    </td>
                                                    <td>
                                                        <b>
                                                            <asp:Label ID="lblTransferDiscount" runat="server">% <%=formatCurDoviz(TransferDisCount)%></asp:Label>
                                                            <asp:Label ID="lblTy01" runat="server">&nbsp;<%=GetGlobalResourceObject("lang", "Discount")%></asp:Label>
                                                        </b>
                                                    </td>
                                                </tr>
                                                <% End If%>


                                                <%If CreditCardDisCount > 0 Then%>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblk1" runat="server"><%=GetGlobalResourceObject("lang", "PriceCreditCard")%></asp:Label></td>
                                                    <td>:</td>
                                                    <td align="right">
                                                        <asp:Label ID="lblKrediKartiFiyat" runat="server"><%=CurrencySymbolLeft & " " & formatNumberEx(CreditCardPrice)& "  " & CurrencySymbolRight%></asp:Label>
                                                        <asp:Label ID="lblky" Visible="false" runat="server"> TL</asp:Label>
                                                    </td>
                                                    <td>
                                                        <b>
                                                            <asp:Label ID="lblKrediKartiDiscount" runat="server">% <%=formatNumberEx(CreditCardDisCount)%></asp:Label>
                                                            <asp:Label ID="lblky01" runat="server">&nbsp;<%=GetGlobalResourceObject("lang", "Discount")%></asp:Label>
                                                        </b>
                                                    </td>
                                                </tr>
                                                <% End If%>
                                                <%If CreditCardMaxTaksit > 0 Then%>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label15" runat="server"><%=GetGlobalResourceObject("lang", "PriceCreditInstalment")%></asp:Label></td>
                                                    <td>:</td>
                                                    <td align="right">
                                                        <asp:Label ID="Label17" runat="server"><%=CurrencySymbolLeft & " " &   formatCurDoviz(CalcKdvDahil(formatCurDoviz(CalcKdvDahil(CalcIndirim(CalcIndirim(SatisFiyati * (Rate/ CurrencyRate), UserIndirim), Indirim), KdvRate)), CreditCardMinRate) / CreditCardMaxTaksit)& "  " & CurrencySymbolRight%></asp:Label></td>
                                                    <td>
                                                        <b>
                                                            <span><%=GetGlobalResourceObject("lang", "InstalmentCount")%></span>
                                                            <asp:Label ID="Label17x" runat="server">&nbsp;<%=CreditCardMaxTaksit%></asp:Label>
                                                        </b>
                                                    </td>
                                                </tr>
                                                <% End If%>
                                            </table>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                            <% End If%>
                            <tr>
                                <td>
                                    <%If Code14 <> "" Then%>
                                    <label><%=Code14%></label>
                                    <%End If%>
                                    <%If Code15 <> "" Then%>
                                    <label><%=Code15%></label>
                                    <%End If%>
                                    <%If Description <> "" Then%>
                                    <label><%=Description%></label>
                                    <%End If%>
                                </td>
                            </tr>
                        </table>
                        <div id="labels">
                            <ul>
                                <li id="HizliKargo" style="display: <%= iif(HizliKargo,"block;","none;") %>"></li>
                                <li id="EnUcuzUrun" style="display: <%= iif(EnUcuzUrun,"block;","none;") %>"></li>
                                <li id="AyniGunTeslim" style="display: <%= iif(AyniGunTeslim,"block;","none;") %>"></li>
                                <li id="OzelUrun" style="display: <%= iif(OzelUrun,"block;","none;") %>"></li>
                                <li id="IndirimliUrun" style="display: <%= iif(IndirimliUrun,"block;","none;") %>"></li>
                                <li id="SinirliSayidaUrun" style="display: <%= iif(SinirliSayidaUrun,"block;","none;") %>"></li>
                                <li id="FirsatUrunu" style="display: <%= iif(FirsatUrunu,"block;","none;") %>"></li>
                                <li id="YeniUrun" style="display: <%= iif(YeniUrun,"block;","none;") %>"></li>
                                <li id="SokFiyatliUrun" style="display: <%= iif(SokFiyatliUrun,"block;","none;") %>"></li>
                                <li id="HediyeliUrun" style="display: <%= iif(HediyeliUrun,"block;","none;") %>"></li>
                                <div class="clear"></div>
                            </ul>
                        </div>
                    </div>
                </div>
                <div id="right">
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <% If (ConfigurationManager.AppSettings("OnlyUsersCanSeePrice") = "True" And HttpContext.Current.User.Identity.IsAuthenticated()) Or ConfigurationManager.AppSettings("OnlyUsersCanSeePrice") <> "True" Then%>
                            <div id="divVariantStockOut" class="alert" style="display: none;">
                                <asp:Label ID="lblVariantStockOut" runat="server"><%=GetGlobalResourceObject("lang", "OutOfStockMsg")%></asp:Label>
                            </div>
                            <div id="divVariantNotSelected" class="alert" style="display: none;">
                                <asp:Label ID="lblVariantNotSelected" runat="server"><%=GetGlobalResourceObject("lang", "SelectVariantMsg")%></asp:Label>
                            </div>

                            <%  If Not (StockQty > 0 Or SellNoneStock) Then%>
                            <div class="alert">
                                <asp:Label ID="lblStockOut" runat="server"><%=GetGlobalResourceObject("lang", "OutOfStockMsg")%></asp:Label>
                            </div>
                            <%End If%>
                            <%  If StockQty <= StockAlarmLimit And StockQty > 0 Then%>
                            <div class="alert">
                                <asp:Label ID="lblStockLimit" runat="server"><%=GetGlobalResourceObject("lang", "StockLimitMsg")%></asp:Label>
                            </div>
                            <% End If%>

                            <%  If StockQty > 0 Or SellNoneStock Then%>
                            <table id="tblUnits" runat="server" border="0" cellpadding="2" cellspacing="0" width="100%">
                                <tr>
                                    <td width="50">
                                        <asp:Label ID="Label11" runat="server"><%=GetGlobalResourceObject("lang", "Unit")%></asp:Label></td>
                                    <td>:
                                        
                                        <asp:DropDownList ID="ddlUnits" runat="server" DataTextField="CartType" DataValueField="ShoppingCartDefId" AutoPostBack="True" OnSelectedIndexChanged="ddlUnits_SelectedIndexChanged" Width="96"></asp:DropDownList></td>
                                </tr>
                            </table>
                            <asp:Repeater ID="rptVaryants" runat="server" OnItemDataBound="rptVaryants_ItemDataBound">
                                <HeaderTemplate>
                                    <table id="tblVariants" border="0" cellpadding="2" cellspacing="0" width="100%">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr>
                                        <td nowrap="nowrap">
                                            <asp:Label ID="lblQuestionId" runat="server" Visible="false" Text="0"></asp:Label>
                                            <asp:Label ID="lblQuestion" runat="server"></asp:Label>
                                            <asp:Label ID="lblType" Visible="true" Style="display: none" runat="server" Text='<%# container.dataitem("ProductOptionsTypesId") %>'></asp:Label>
                                        </td>
                                        <td>: 
	                                        <asp:TextBox ID="tbQuestion" runat="Server" Width="100px" Height="20px" MaxLength="50" TextMode="MultiLine" OnTextChanged="ddlQuestion_SelectedIndexChanged" AutoPostBack="true"></asp:TextBox>
                                            <asp:TextBox ID="tbQuestion1" Width="200px" Height="80px" runat="Server" TextMode="MultiLine" OnTextChanged="ddlQuestion_SelectedIndexChanged" AutoPostBack="true" MaxLength="100"></asp:TextBox>
                                            <asp:CheckBox ID="cbQuestion" runat="server" OnCheckedChanged="ddlQuestion_SelectedIndexChanged" AutoPostBack="true" />
                                            <asp:CheckBoxList ID="cblQuestion" runat="server" OnSelectedIndexChanged="ddlQuestion_SelectedIndexChanged" AutoPostBack="true"></asp:CheckBoxList>
                                            <asp:DropDownList ID="ddlMail" runat="Server"></asp:DropDownList>
                                            <asp:DropDownList ID="ddlQuestion" runat="Server" OnSelectedIndexChanged="ddlQuestion_SelectedIndexChanged" AutoPostBack="true" Width="96"></asp:DropDownList>
                                            <asp:RadioButtonList ID="rblQuestion" runat="Server" OnSelectedIndexChanged="ddlQuestion_SelectedIndexChanged" AutoPostBack="true"></asp:RadioButtonList>
                                            <asp:CheckBox ID="cbfile" Text="ResimEkle" runat="server" OnCheckedChanged="ddlQuestion_SelectedIndexChanged" AutoPostBack="true" />
                                            <asp:HyperLink ID="btnfile" runat="server" CssClass="button"></asp:HyperLink>
                                            <asp:Label ID="lblfile" runat="server" Style="display: none"></asp:Label>
                                            <asp:FileUpload ID="oFile" runat="server" size="20" />
                                            <asp:CompareValidator ValidationGroup="addtocart" ID="cvForQuestion" runat="server" ValueToCompare="0" ControlToValidate="ddlQuestion" Operator="NotEqual" ErrorMessage="Zorunlu Alan">*</asp:CompareValidator>
                                            <asp:RequiredFieldValidator ValidationGroup="addtocart" ID="rfvForQuestion" runat="server" ErrorMessage="Zorunlu Alan">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                                <FooterTemplate></table></FooterTemplate>
                            </asp:Repeater>
                            <table id="tblSepet" runat="server" border="0" cellpadding="2" cellspacing="0" width="100%">
                                <tr>
                                    <td width="72">
                                        <asp:Label ID="Label10" runat="server"><%=GetGlobalResourceObject("lang", "ShoppingCart")%></asp:Label></td>
                                    <td>:
                                        <asp:DropDownList ID="ddlSepet" runat="server" DataTextField="CartType" DataValueField="ShoppingCartDefId" Width="96"></asp:DropDownList></td>
                                </tr>
                            </table>
                            <asp:ValidationSummary ValidationGroup="addtocart" ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False"></asp:ValidationSummary>
                            <% End If%>
                            <%End If%>
                        </ContentTemplate>

                    </asp:UpdatePanel>
                    <%  If StockQty > 0 Or SellNoneStock Then%>
                    <% If ProductSizeOptionId > 0 Then%>
                    <div class="module_box">
                        <table id="tblvariant" cellpadding="5" width="100%">
                            <tr>
                                <td colspan="2" align="right">

                                    <asp:Repeater runat="server" ID="ColorAndSizeAndQty" EnableViewState="False">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblColorId" Visible="False"></asp:Label>
                                            <asp:Label runat="server" ID="lblBedenId" Visible="False"></asp:Label>
                                            <asp:Label runat="server" ID="lblSizeId" Visible="False"></asp:Label>
                                            <div style="width: 200px; margin: auto 0;">
                                                <div style="float: left; margin-right: 2px;">
                                                    <asp:Label runat="server" ID="lblColor"></asp:Label>
                                                </div>
                                                <div style="float: left; margin-right: 2px;">
                                                    <asp:Label runat="server" ID="lblSize"></asp:Label>
                                                </div>
                                                <div style="float: right; margin-right: 5px;">
                                                    <asp:TextBox runat="server" ID="txtQtyWhole" Width="30"></asp:TextBox>
                                                </div>
                                                <div class="clear"></div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </td>
                            </tr>
                            <tr>
                                <td style="vertical-align: top; width: 120px;"></td>
                                <td style="vertical-align: top;"></td>
                            </tr>
                            <tr>
                                <td colspan="2" align="right"></td>
                            </tr>
                        </table>
                    </div>
                    <%End If%>


                    <% If (ConfigurationManager.AppSettings("OnlyUsersCanSeePrice") = "True" And HttpContext.Current.User.Identity.IsAuthenticated()) Or ConfigurationManager.AppSettings("OnlyUsersCanSeePrice") <> "True" Then%>

                    <%If (StokTip <> 4) Then%>
                    <div class="product-quantity module_box">
                        <div id="quantity">
                            <span id="QtyText">Adet: </span>
                            <input id="txtQty" type="text" value="1" runat="server" style="width: 20px;" onchange="SetQuantity();" />
                            <div id="quantityArrow">
                                <a id="btnQtyPlus" onclick="IncQuantity();"></a>
                                <div class="clear"></div>
                                <a id="btnQtyMinus" onclick="DecQuantity();"></a>
                            </div>
                        </div>
                        <div id="cart-button">
                            <asp:Button ID="btnAddToCart" runat="server" Text="Sepete Ekle" />
                            <%--<a id="btnAddToCart2" runat="server" class="addlightbox cartbutton2" onclick="AddToCart()"><%=GetGlobalResourceObject("lang", "AddToCart")%></a>--%>
                        </div>
                        <div class="clear"></div>
                    </div>
                    <% End If%>
                    <% End If%>
                    <%End If%>
                    <div id="SatinalPanel" runat="server" class="SatinalPanel">
                        <ul>

                            <li>
                                <asp:HyperLink ID="hypPoster" runat="server" Visible="false" CssClass="addbutton"><%=GetGlobalResourceObject("lang", "ShowInFrame")%></asp:HyperLink></li>

                            <li><a id="lnkCompare" class="lightbox minibutton" href='<%= BaseUrl & "/store/comparepopup.aspx?ProductId=" & Request.Params("ProductId") %>'><%=GetGlobalResourceObject("lang", "AddToCompareProductList")%></a></li>
                            <% If StockQty > 0 Or SellNoneStock Then%>
                            <li><a id="lnkPricealarm" class="lightbox minibutton" href='<%= BaseUrl & "/store/pricealarmpopup.aspx?ProductId=" & Request.Params("ProductId") %>'><%=GetGlobalResourceObject("lang", "AddToPriceAlarmList")%></a></li>
                            <% Else%>
                            <li><a id="lnkStockAlarm" class="lightbox minibutton" href='<%= BaseUrl & "/store/stockalarmpopup.aspx?ProductId=" & Request.Params("ProductId") %>'><%=GetGlobalResourceObject("lang", "AddToStockAlarmList")%></a></li>
                            <% End If%>
                            <li><a id="lnksuggesttofriend" class="lightbox minibutton" href='<%= BaseUrl & "/store/suggesttofriend.aspx?Url=" & BaseUrl & Request.RawUrl %>'><%=GetGlobalResourceObject("lang", "SuggestToFriend")%></a></li>
                            <li><a id="lnkprint" href="javascript:window.print()" class="minibutton"><%=GetGlobalResourceObject("lang", "Print")%></a></li>
                            <li><a id="lnkBilgi" class="lightbox minibutton" href='<%= BaseUrl & "/store/requestproductinfo.aspx?Url=" & BaseUrl & Request.RawUrl %>'><%=GetGlobalResourceObject("lang", "RequestProductInfo")%></a></li>
                        </ul>
                    </div>
                    <div id="share" style="text-align: center; padding: 5px;">
                        <script runat="server" type="text/VB"> 
                            'post bilgileri
                            Private AffiliateUrl As String = IIf(PortalSecurity.IsInRole("Satış Ortakları"), IIf(System.Web.HttpContext.Current.Request.RawUrl.Contains("?"), "&AffiliateId=" & GetShoppingCartId(), IIf(System.Web.HttpContext.Current.Request.RawUrl.EndsWith(".aspx"), "?AffiliateId=" & GetShoppingCartId(), "/?AffiliateId=" & GetShoppingCartId())), "")
                            Private strPostURL As String = System.Web.HttpUtility.UrlEncode("http://" & System.Web.HttpContext.Current.Request.Url.DnsSafeHost & System.Web.HttpContext.Current.Request.RawUrl & AffiliateUrl)
                            Private strPostTitle As String = System.Web.HttpUtility.UrlEncode(IIf(_portalsettings.ActiveTab.title = "", BaseUrl, _portalsettings.ActiveTab.title))
                            'kullanılanlar
                            Private strFacebookLink As String = "<a rel=""nofollow"" href=""http://www.facebook.com/sharer.php?t=" & strPostTitle & "&amp;u=" & strPostURL & """ target=""_blank""><img width=""24"" src=""" & getThemePath() & "/images/social/facebook_24.png"" style=""border: 0;"" alt=""facebook'ta paylaş"" /></a>"
                            Private strGoogleLink As String = "<a rel=""nofollow"" href=""http://www.google.com/bookmarks/mark?op=edit&amp;bkmk=" & strPostURL & "&amp;title=" & strPostTitle & """ target=""_blank""><img width=""24"" src=""" & getThemePath() & "/images/social/google_24.jpg"" style=""border: 0;"" alt=""google favorilerime ekle"" /></a>"
                            Private strTwitterLink As String = "<a rel=""nofollow"" href=""http://twitter.com/home?status=" & strPostTitle & " " & strPostURL & """ target=""_blank""><img width=""24"" src=""" & getThemePath() & "/images/social/twitter_24.png"" style=""border: 0;"" alt=""twitter'da paylaş"" /></a>"
                            Private strFriendfeedLink As String = "<a rel=""nofollow"" href=""http://friendfeed.com/?url=" & strPostURL & "&amp;title=" & strPostTitle & """ target=""_blank""><img width=""24"" src=""" & getThemePath() & "/images/social/friendfeed_24.png"" style=""border: 0;"" alt=""friendfeed'de paylaş"" /></a>"
                            Private strMyspaceLink As String = "<a rel=""nofollow"" href=""http://www.myspace.com/Modules/PostTo/Pages/?u=" & strPostURL & "&amp;t=" & strPostTitle & """ target=""_blank""><img width=""24"" src=""" & getThemePath() & "/images/social/myspace_24.png"" style=""border: 0;"" alt=""myspace'te paylaş"" /></a>"
                            Private strDiggLink As String = "<a rel=""nofollow"" href=""http://digg.com/submit?phase=2&amp;url=" & strPostURL & """ target=""_blank""><img width=""24"" src=""" & getThemePath() & "/images/social/digg_24.png"" style=""border: 0;"" alt=""Digg'e ekle"" /></a>"
                            Private strDeliciousLink As String = "<a rel=""nofollow"" href=""http://del.icio.us/post?url=" & strPostURL & "&amp;title=" + strPostTitle & """ target=""_blank""><img width=""24"" src=""" & getThemePath() & "/images/social/delicious_24.png"" style=""border: 0;""  alt=""Delicious'a ekle"" /></a>"
                            Private strStumbleuponLink As String = "<a rel=""nofollow"" href=""http://www.stumbleupon.com/submit?url=" & strPostURL & """ target=""_blank""><img width=""24"" src=""" & getThemePath() & "/images/social/stumbleupon_24.png"" style=""border: 0;""  alt=""Stumbleupon'da paylaş"" /></a>"
                            Private strRedditLink As String = "<a rel=""nofollow"" href=""http://reddit.com/submit?url=" & strPostURL & "&amp;title=" + strPostTitle & """ target=""_blank""><img width=""24"" src=""" & getThemePath() & "/images/social/reddit_24.png"" style=""border: 0;""  alt=""reddit'e ekle"" /></a>"
                        </script>
                        <div id="share-content">
                            <script type="text/javascript" src="http://apis.google.com/js/plusone.js">{ lang: 'tr' }</script>
                            <g:plusone size="Standard" count="false"></g:plusone>
                            <%=strFacebookLink%>
                            <%=strTwitterLink %>
                            <%=strFriendfeedLink %>
                        </div>
                    </div>
                    <div class="clear"></div>
                    <% If (ConfigurationManager.AppSettings("OnlyUsersCanSeePrice") = "True" And HttpContext.Current.User.Identity.IsAuthenticated()) Or ConfigurationManager.AppSettings("OnlyUsersCanSeePrice") <> "True" Then%>
                    <%If CargoList.Items.Count > 0 Then%>
                    <div id="kargo" class="ui-corner-all">
                        <asp:Repeater runat="server" ID="CargoList">
                            <HeaderTemplate>
                                <ul>
                                    <asp:Label ID="lblCargoHeader" runat="server" CssClass="title"><%=GetGlobalResourceObject("lang", "ShippingPrice")%></asp:Label>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <li>
                                    <asp:Label ID="lblCargoName" runat="server" Text='<%# container.dataitem("CargoName") %>'></asp:Label>:
				<asp:Label ID="lblCargoText" runat="server" Text='<%# CurrencySymbolLeft & " " & formatCurDoviz(container.dataitem("CargoPrice") * (DefaultCurrencyRate / CurrencyRate))& " " & CurrencySymbolRight %>'></asp:Label>
                                </li>
                            </ItemTemplate>
                            <FooterTemplate>
                                <div class="clear"></div>
                                </ul>
                            </FooterTemplate>
                        </asp:Repeater>
                    </div>
                    <% End If%>
                    <% End If%>
                </div>
                <div class="clear"></div>
            </div>

            <div id="alternatives" class="module_box extraTab">
                <script type="text/javascript" src="<% =getThemePath() %>/js/alternatives/lib/jquery.jcarousel.min.js"></script>
                <link rel="stylesheet" type="text/css" href="<% =getThemePath() %>/js/alternatives/skins/tango/skin.css" />
                <label class="extraTabTitle"><%=GetGlobalResourceObject("lang", "ProductAlternatives")%></label>
                <asp:Panel ID="Content" runat="server">
                    <asp:Repeater ID="rptAlternatives" runat="server">
                        <HeaderTemplate>
                            <ul class="alternativesList jcarousel-skin-tango" id="mycarousel">
                        </HeaderTemplate>
                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                        <ItemTemplate>
                            <li id="product">
                                <span class="alternatives">
                                    <a href='<%# string.format(BaseUrl & "{0}" & ".aspx",container.dataitem("Url").tostring.Remove(container.dataitem("Url").tostring.Length - 1, 1)) %>'>
                                        <img alt="" src='<%# BaseUrl & "/store/makethumb.aspx?file=" + container.dataitem("Path") & "&intSize=85" %>' />
                                    </a>
                                </span>
                                <a href='<%# string.format(BaseUrl & "{0}" & ".aspx",container.dataitem("Url").tostring.Remove(container.dataitem("Url").tostring.Length - 1, 1)) %>'><%# container.dataitem("ProductName") %></a>
                                <asp:Label ID="lblFiyat3al" runat="server" Text='<%# CurrencySymbolLeft & " " & formatCurDoviz(container.dataitem("SatisFiyati")* container.dataitem("Rate") / CurrencyRate) + " " + CurrencySymbolRight + GetGlobalResourceObject("lang", "PlusTax") %>'>
                                </asp:Label>
                                <div class="clear"></div>
                                <asp:Label ID="Label7a" runat="server" Text='<%# FormatCurDoviz(CalcIndirim(CalcIndirim(container.dataitem("SatisFiyati"),container.dataitem("Indirim")),UserIndirim)) & " " & container.dataitem("CurrencyName")  %>'>
                                </asp:Label>
                                <asp:HyperLink ID="lnkAddtoCart3" runat="server" CssClass="button" NavigateUrl='<%# "javascript:window.top.location.href=""/store/AddToCart.aspx?ProductId=" & container.dataitem("ProductId") & """;" %>'><%=GetGlobalResourceObject("lang", "AddToCart")%></asp:HyperLink>
                                <script type="text/javascript">
                                    jQuery(document).ready(function () {
                                        jQuery('#mycarousel').jcarousel({
                                            visible: 3,
                                            animation: 1000,
                                            auto: 0,
                                            wrap: 'last',
                                            scroll: 1,
                                            itemFallbackDimension: 75
                                        });
                                    });
                                </script>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                </asp:Panel>
            </div>
            <div id="nonAlternatives" class="module_box extraTab">
                <label class="extraTabTitle"><%=GetGlobalResourceObject("lang", "ProductNonAlternatives")%></label>
                <asp:Panel ID="Panel1" runat="server">
                    <asp:Repeater ID="rptNonAlternatives" runat="server">
                        <HeaderTemplate>
                            <ul class="nonAlternativesList jcarousel-skin-tango" id="nonAlternativesjs">
                        </HeaderTemplate>
                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                        <ItemTemplate>
                            <li id="product">
                                <span class="thumb"><a href='<%# string.format(BaseUrl & "{0}" & ".aspx",container.dataitem("Url").tostring.Remove(container.dataitem("Url").tostring.Length - 1, 1)) %>'>
                                    <img alt="" src='<%# BaseUrl & "/store/makethumb.aspx?file=" + container.dataitem("Path") & "&intSize=85" %>' /></a></span>
                                <a href='<%# string.format(BaseUrl & "{0}" & ".aspx",container.dataitem("Url").tostring.Remove(container.dataitem("Url").tostring.Length - 1, 1)) %>'><%# container.dataitem("ProductName") %></a>
                                <asp:Label ID="Label1" runat="server" Text='<%# CurrencySymbolLeft & " " & formatCurDoviz(container.dataitem("SatisFiyati")* container.dataitem("Rate") / CurrencyRate) + " " + CurrencySymbolRight + GetGlobalResourceObject("lang", "PlusTax") %>'>
                                </asp:Label>
                                <div class="clear"></div>
                                <asp:Label ID="Label2" runat="server" Text='<%# FormatCurDoviz(CalcIndirim(CalcIndirim(container.dataitem("SatisFiyati"),container.dataitem("Indirim")),UserIndirim)) & " " & container.dataitem("CurrencyName")  %>'>
                                </asp:Label>
                                <asp:HyperLink ID="HyperLink1" runat="server" CssClass="button" NavigateUrl='<%# "javascript:window.top.location.href=""/store/AddToCart.aspx?ProductId=" & container.dataitem("ProductId") & """;" %>'><%=GetGlobalResourceObject("lang", "AddToCart")%></asp:HyperLink>
                                <script type="text/javascript">
                                    jQuery(document).ready(function () {
                                        jQuery('#nonAlternativesjs').jcarousel({
                                            visible: 3,
                                            animation: 1000,
                                            auto: 0,
                                            wrap: 'last',
                                            scroll: 1,
                                            itemFallbackDimension: 75
                                        });
                                    });
                                </script>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                </asp:Panel>
            </div>
            <div id="ProductUsages" class="module_box extraTab">
                <label class="extraTabTitle"><%=GetGlobalResourceObject("lang", "ProductUsages")%></label>
                <asp:Panel ID="Panel2" runat="server">
                    <asp:Repeater ID="rptUseges" runat="server">
                        <HeaderTemplate>
                            <ul class="ProductUsages jcarousel-skin-tango" id="ProductUsagesjs">
                        </HeaderTemplate>
                        <FooterTemplate></ul></FooterTemplate>
                        <ItemTemplate>
                            <li id="product">
                                <span class="thumb"><a href='<%# string.format(BaseUrl & "{0}" & ".aspx",container.dataitem("Url").tostring.Remove(container.dataitem("Url").tostring.Length - 1, 1)) %>'>
                                    <img alt="" src='<%# BaseUrl & "/store/makethumb.aspx?file=" + container.dataitem("Path") & "&intSize=85" %>' /></a></span>
                                <a href='<%# string.format(BaseUrl & "{0}" & ".aspx",container.dataitem("Url").tostring.Remove(container.dataitem("Url").tostring.Length - 1, 1)) %>'><%# container.dataitem("ProductName") %></a>
                                <asp:Label ID="Label4" runat="server" Text='<%# CurrencySymbolLeft & " " & formatCurDoviz(container.dataitem("SatisFiyati")* container.dataitem("Rate") / CurrencyRate) + " " + CurrencySymbolRight + GetGlobalResourceObject("lang", "PlusTax") %>'>
                                </asp:Label>
                                <div class="clear"></div>
                                <asp:Label ID="Label5" runat="server" Text='<%# FormatCurDoviz(CalcIndirim(CalcIndirim(container.dataitem("SatisFiyati"),container.dataitem("Indirim")),UserIndirim)) & " " & container.dataitem("CurrencyName")  %>'>
                                </asp:Label>
                                <asp:HyperLink ID="HyperLink2" runat="server" CssClass="button" NavigateUrl='<%# "javascript:window.top.location.href=""/store/AddToCart.aspx?ProductId=" & container.dataitem("ProductId") & """;" %>'><%=GetGlobalResourceObject("lang", "AddToCart")%></asp:HyperLink>
                                <script type="text/javascript">
                                    jQuery(document).ready(function () {
                                        jQuery('#ProductUsagesjs').jcarousel({
                                            visible: 3,
                                            animation: 1000,
                                            auto: 0,
                                            wrap: 'last',
                                            scroll: 1,
                                            itemFallbackDimension: 75
                                        });
                                    });
                                </script>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                </asp:Panel>
            </div>
            <div class="clear"></div>
            <div id="detailsTabContainer" runat="server" class="detailsTabContainer">
                <ul id="detailsTabHeader" runat="server">
                    <li><a href="#tab_details_content">
                        <asp:PlaceHolder ID="Placeholder1" runat="server"><%=GetGlobalResourceObject("lang", "ProductProperties")%></asp:PlaceHolder>
                    </a></li>
                    <li id="tab_images_link" runat="server"><a href="#tab_details_images">
                        <asp:PlaceHolder ID="Placeholder2" runat="server"><%=GetGlobalResourceObject("lang", "ProductImages")%></asp:PlaceHolder>
                    </a></li>
                    <li id="tab_files_link" runat="server"><a href="#tab_details_files">
                        <asp:PlaceHolder ID="Placeholder3" runat="server"><%=GetGlobalResourceObject("lang", "ProductFiles")%></asp:PlaceHolder>
                    </a></li>

                    <li id="tab_alternative_link" runat="server">
                        <a href="#tab_details_alternatives">
                            <asp:PlaceHolder ID="Placeholder4" runat="server"><%=GetGlobalResourceObject("lang", "ProductAlternatives")%></asp:PlaceHolder>
                        </a>
                    </li>
                    <li id="tab_nonalternative_link" runat="server">
                        <a href="#tab_details_nonalternatives">
                            <asp:PlaceHolder ID="Placeholder8" runat="server"><%=GetGlobalResourceObject("lang", "ProductNonAlternatives")%>
                            </asp:PlaceHolder>
                        </a>
                    </li>
                    <li id="tab_usage_link" runat="server"><a href="#tab_details_usages">
                        <asp:PlaceHolder ID="Placeholder5" runat="server"><%=GetGlobalResourceObject("lang", "ProductUsages")%></asp:PlaceHolder>
                    </a></li>
                    <li id="tab_review_link" runat="server"><a href="#tab_details_review">
                        <asp:PlaceHolder ID="Placeholder6" runat="server"><%=GetGlobalResourceObject("lang", "ProductReviews")%></asp:PlaceHolder>
                    </a></li>
                    <li id="tab_installment_link" runat="server"><a href="#tab_details_installment">
                        <asp:PlaceHolder ID="Placeholder7" runat="server"><%=GetGlobalResourceObject("lang", "ProductInstallments")%></asp:PlaceHolder>
                    </a></li>
                </ul>

                <div id="tab_details_content">
                    <asp:Label ID="lblDetails" runat="server"></asp:Label>
                    <br />
                    <asp:Repeater ID="rptWizard" runat="server">
                        <ItemTemplate>
                            <asp:Label Style="visibility: hidden" ID="lblSurveyGroupId" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "WizardGroupId")  %>' Width="0">
                            </asp:Label>
                            <fieldset>
                                <legend><%# DataBinder.Eval(Container.DataItem, "WizardGroupName")  %></legend>
                                <table>
                                    <tr>
                                        <td id="tdSectionQuestions" runat="server">
                                            <asp:Repeater DataSource='<%# GetQuestions(DataBinder.Eval(Container.DataItem,"WizardGroupId")) %>' ID="rptWizardItems" runat="server" OnItemDataBound="rptWizardItems_ItemDataBound">
                                                <HeaderTemplate>
                                                    <table border="0" cellpadding="5" cellspacing="0">
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <tr class="TeknikTablo_Satir">
                                                        <td style="white-space: nowrap; width: 200" valign="top">
                                                            <asp:Label Style="visibility: hidden" ID="Label6" runat="server" Text="0" Width="20"></asp:Label>
                                                            <asp:Label ID="Label8" runat="server"></asp:Label>
                                                            <asp:Image ID="qimg" Style="cursor: hand" Visible="false" ImageUrl="../images/icon_info.png" runat="server" />
                                                            <cc1:PopupControlExtender ID="PopEx" runat="server" TargetControlID="qimg" PopupControlID="poppanel" Position="Bottom" />
                                                            <asp:UpdatePanel ID="poppanel" runat="server">
                                                                <ContentTemplate>
                                                                    <asp:Label runat="server" ID="poplabel"></asp:Label>
                                                                </ContentTemplate>
                                                            </asp:UpdatePanel>
                                                        </td>
                                                        <td>:</td>
                                                        <td style="white-space: nowrap; width: 400" valign="top">
                                                            <asp:Label ID="lblAnsver" runat="server"></asp:Label></td>
                                                    </tr>
                                                </ItemTemplate>
                                                <AlternatingItemTemplate>
                                                    <tr>
                                                        <td style="white-space: nowrap; width: 200" valign="top">
                                                            <asp:Label Style="visibility: hidden" ID="Label9" runat="server" Text="0" Width="20"></asp:Label>
                                                            <asp:Label ID="Label12" runat="server"></asp:Label>
                                                            <asp:Image ID="Image1" Style="cursor: hand" Visible="false" ImageUrl="../images/icon_info.png" runat="server" />
                                                            <cc1:PopupControlExtender ID="PopupControlExtender1" runat="server" TargetControlID="qimg" PopupControlID="poppanel" Position="Bottom" />
                                                            <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                                                <ContentTemplate>
                                                                    <asp:Label runat="server" ID="poplabel1"></asp:Label>
                                                                </ContentTemplate>
                                                            </asp:UpdatePanel>
                                                        </td>
                                                        <td>:</td>
                                                        <td style="white-space: nowrap; width: 400" valign="top">
                                                            <asp:Label ID="Label13" runat="server"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </AlternatingItemTemplate>
                                                <FooterTemplate>
                                                    </table>
                                                </FooterTemplate>
                                            </asp:Repeater>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>

                <div id="tab_details_images">
                    <asp:UpdatePanel ID="updPnlImages" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <input id="TabButton1" causesvalidation="false" runat="server" type="button" style="display: none" onserverclick="TabButton_Click" />
                            <asp:Panel ID="TabContent1" Visible="false" runat="server">
                                <asp:Repeater ID="dgImages" runat="server">
                                    <HeaderTemplate>
                                        <ul>
                                    </HeaderTemplate>
                                    <FooterTemplate>
                                        <div class="clear"></div>
                                        </ul>
                                    </FooterTemplate>
                                    <ItemTemplate>
                                        <li><a target="_blank" rel="lightbox2" title='<%# Container.dataitem("Description") %>' href='<%# BaseUrl & "/store/makethumb.aspx?file=" + container.dataitem("Path") + "&intSize=" & ImageSizeBig %>'>
                                            <asp:Image ID="Imagesc" runat="server" BorderStyle="None" ImageUrl='<%# "/store/makethumb.aspx?file=" + container.dataitem("Path") + "&intSize=125" %>' ToolTip='<%# Container.dataitem("Description") %>'></asp:Image></a></li>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </asp:Panel>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>

                <div id="tab_details_alternatives">
                    <asp:UpdatePanel ID="updPnlAlternatives" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <input id="TabButton3" causesvalidation="false" runat="server" type="button" style="display: none" onserverclick="TabButton_Click" />
                            <asp:Panel ID="TabContent3" Visible="false" runat="server">
                                <asp:DataGrid ID="dgAlternatives" runat="server" AutoGenerateColumns="false" CellPadding="5" Width="100%" CssClass="datalist" HeaderStyle-CssClass="title" GridLines="none" ItemStyle-CssClass="row">
                                    <Columns>
                                        <asp:TemplateColumn HeaderText="<%$ Resources:lang, Image%>" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="95px">
                                            <ItemTemplate>
                                                <a href='<%# "javascript:window.top.location.href=""" & string.format(BaseUrl & "{0}" & ".aspx",container.dataitem("Url").tostring.Remove(container.dataitem("Url").tostring.Length - 1, 1)) & """;"  %>'>
                                                    <img alt="" class="thumb" src="<%# BaseUrl & "/store/makethumb.aspx?file=" & container.dataitem("Path") & "&intSize=" & intSize %>" /><br />
                                                </a>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:TemplateColumn HeaderText="<%$ Resources:lang, ProductName%>">
                                            <ItemTemplate>
                                                <asp:HyperLink ID="hlProdName3b" runat="server" Text='<%# container.dataitem("ProductName") %>'
                                                    NavigateUrl='<%# "javascript:window.top.location.href=""" & string.format(BaseUrl & "{0}" & ".aspx",container.dataitem("Url").tostring.Remove(container.dataitem("Url").tostring.Length - 1, 1)) & """;"  %>'>
                                                </asp:HyperLink>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:TemplateColumn HeaderText="<%$ Resources:lang, PriceWithoutTax%>" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                            <HeaderStyle HorizontalAlign="Right" Width="100px"></HeaderStyle>
                                            <ItemStyle HorizontalAlign="Right"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:Label ID="Label14" runat="server" Text='<%# CurrencySymbolLeft & " " & formatCurDoviz(container.dataitem("SatisFiyati")* container.dataitem("Rate") / CurrencyRate) + " " + CurrencySymbolRight + GetGlobalResourceObject("lang", "PlusTax") %>'>
                                                </asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:TemplateColumn HeaderText="<%$ Resources:lang, PriceForYou%>" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:Label ID="Label16" runat="server" Text='<%# FormatCurDoviz(CalcIndirim(CalcIndirim(container.dataitem("SatisFiyati"),container.dataitem("Indirim")),UserIndirim)) &amp; " " &amp; container.dataitem("CurrencyName")  %>'>
                                                </asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:TemplateColumn ItemStyle-HorizontalAlign="Right">
                                            <ItemTemplate>
                                                <asp:HyperLink ID="HyperLink3" runat="server" CssClass="button" NavigateUrl='<%# "javascript:window.top.location.href=""/store/AddToCart.aspx?ProductId=" &amp; container.dataitem("ProductId") &amp; """;" %>'><%=GetGlobalResourceObject("lang", "AddToCart")%></asp:HyperLink>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                    </Columns>
                                </asp:DataGrid>
                            </asp:Panel>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>

                <div id="tab_details_files">
                    <asp:UpdatePanel ID="updPnlFiles" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <input id="TabButton2" causesvalidation="false" runat="server" type="button" style="display: none" onserverclick="TabButton_Click" />
                            <asp:Panel ID="TabContent2" Visible="false" runat="server">
                                <asp:DataGrid ID="dgFiles" runat="server" AutoGenerateColumns="False" Width="100%" CellPadding="5" CssClass="datalist" HeaderStyle-CssClass="title" GridLines="none" ItemStyle-CssClass="row">
                                    <HeaderStyle CssClass="title" />
                                    <FooterStyle CssClass="footer" />
                                    <Columns>
                                        <asp:TemplateColumn HeaderText="<%$ Resources:lang, Description%>">
                                            <ItemTemplate>
                                                <asp:Label ID="Label18" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Description") %>'>
                                                </asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:TemplateColumn HeaderText="<%$ Resources:lang, Format%>">
                                            <HeaderStyle HorizontalAlign="center"></HeaderStyle>
                                            <ItemStyle HorizontalAlign="center"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:Label runat="server" Text='<%# container.dataitem("Path").tostring.Substring(container.dataitem("Path").tostring.LastIndexOf(".")+1) %>'
                                                    ID="Label19" name="Label1">
                                                </asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:TemplateColumn Visible="false" HeaderText="<%$ Resources:lang, Icon%>">
                                            <HeaderStyle HorizontalAlign="center"></HeaderStyle>
                                            <ItemStyle HorizontalAlign="center"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:Image Height="15" ID="Image2" runat="server" ImageUrl='<%# getimage(container.dataitem("Path"))%>'></asp:Image>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:TemplateColumn>
                                            <HeaderStyle Width="40px"></HeaderStyle>
                                            <ItemTemplate>
                                                <asp:HyperLink ID="hlFile" CssClass="button" runat="server" NavigateUrl='<%# ("/Uploads/ProductsFiles/") + (container.dataitem("Path")) %>' Target="_blank"><%=GetGlobalResourceObject("lang", "Download")%></asp:HyperLink>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                    </Columns>
                                </asp:DataGrid>
                            </asp:Panel>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>

                <div id="tab_details_nonalternatives">
                    <asp:UpdatePanel ID="updPnlNonAlternatives" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <input id="TabButton7" causesvalidation="false" runat="server" type="button" style="display: none" onserverclick="TabButton_Click" />
                            <asp:Panel ID="TabContent7" Visible="false" runat="server">
                                <asp:DataGrid ID="dgNonAlternatives" runat="server" AutoGenerateColumns="false" CellPadding="5" Width="100%" CssClass="datalist" HeaderStyle-CssClass="title" GridLines="none" ItemStyle-CssClass="row">
                                    <Columns>
                                        <asp:TemplateColumn HeaderText="<%$ Resources:lang, Image%>" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="95px">
                                            <ItemTemplate>
                                                <a href='<%# "javascript:window.top.location.href=""" & string.format(BaseUrl & "{0}" & ".aspx",container.dataitem("Url").tostring.Remove(container.dataitem("Url").tostring.Length - 1, 1)) & """;"  %>'>
                                                    <img alt="" class="thumb" src="<%# BaseUrl & "/store/makethumb.aspx?file=" & container.dataitem("Path") & "&intSize=" & intSize %>" /><br />
                                                </a>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:TemplateColumn HeaderText="<%$ Resources:lang, ProductName%>">
                                            <ItemTemplate>
                                                <asp:HyperLink ID="HyperLink4" runat="server" Text='<%# container.dataitem("ProductName") %>'
                                                    NavigateUrl='<%# "javascript:window.top.location.href=""" & string.format(BaseUrl & "{0}" & ".aspx",container.dataitem("Url").tostring.Remove(container.dataitem("Url").tostring.Length - 1, 1)) & """;"  %>'>
                                                </asp:HyperLink>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:TemplateColumn HeaderText="<%$ Resources:lang, PriceWithoutTax%>" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                            <HeaderStyle HorizontalAlign="Right" Width="100px"></HeaderStyle>
                                            <ItemStyle HorizontalAlign="Right"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:Label ID="Label20" runat="server" Text='<%# CurrencySymbolLeft & " " & formatCurDoviz(container.dataitem("SatisFiyati")* container.dataitem("Rate") / CurrencyRate) + " " + CurrencySymbolRight + GetGlobalResourceObject("lang", "PlusTax") %>'>
                                                </asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:TemplateColumn HeaderText="<%$ Resources:lang, PriceForYou%>" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:Label ID="Label21" runat="server" Text='<%# FormatCurDoviz(CalcIndirim(CalcIndirim(container.dataitem("SatisFiyati"),container.dataitem("Indirim")),UserIndirim)) &amp; " " &amp; container.dataitem("CurrencyName")  %>'>
                                                </asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:TemplateColumn ItemStyle-HorizontalAlign="Right">
                                            <ItemTemplate>
                                                <asp:HyperLink ID="HyperLink5" runat="server" CssClass="button" NavigateUrl='<%# "javascript:window.top.location.href=""/store/AddToCart.aspx?ProductId=" &amp; container.dataitem("ProductId") &amp; """;" %>'><%=GetGlobalResourceObject("lang", "AddToCart")%></asp:HyperLink>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                    </Columns>
                                </asp:DataGrid>
                            </asp:Panel>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>

                <div id="tab_details_usages">
                    <asp:UpdatePanel ID="updPnlUsages" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <input id="TabButton4" causesvalidation="false" runat="server" type="button" style="display: none" onserverclick="TabButton_Click" />
                            <asp:Panel ID="TabContent4" Visible="false" runat="server">
                                <asp:DataGrid ID="dgUsages" runat="server" AutoGenerateColumns="False" CellPadding="5" Width="100%" CssClass="datalist" HeaderStyle-CssClass="title" GridLines="none" ItemStyle-CssClass="row">
                                    <HeaderStyle CssClass="title" />
                                    <FooterStyle CssClass="footer" />
                                    <Columns>
                                        <asp:TemplateColumn HeaderText="<%$ Resources:lang, Image%>" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="95px">
                                            <ItemTemplate>
                                                <a href='<%# "javascript:window.top.location.href=""" & string.format(BaseUrl & "{0}" & ".aspx",container.dataitem("Url").tostring.Remove(container.dataitem("Url").tostring.Length - 1, 1)) & """;"  %>'>
                                                    <img alt="" class="thumb" src="<%# BaseUrl & "/store/makethumb.aspx?file=" & container.dataitem("Path") & "&intSize=" & intSize %>" /><br />
                                                </a>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:TemplateColumn HeaderText="<%$ Resources:lang, ProductName%>">
                                            <ItemTemplate>
                                                <asp:HyperLink ID="hlProdName3a" runat="server" Text='<%# container.dataitem("ProductName") %>'
                                                    NavigateUrl='<%# "javascript:window.top.location.href=""" & string.format(BaseUrl & "{0}" & ".aspx",container.dataitem("Url").tostring.Remove(container.dataitem("Url").tostring.Length - 1, 1)) & """;"  %>'>
                                                </asp:HyperLink>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:TemplateColumn HeaderText="<%$ Resources:lang, PriceWithoutTax%>" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                            <HeaderStyle HorizontalAlign="Right" Width="100px"></HeaderStyle>
                                            <ItemStyle HorizontalAlign="Right"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:Label ID="lblFiyat3bc" runat="server" Text='<%# CurrencySymbolLeft & " " & formatCurDoviz(container.dataitem("SatisFiyati")* container.dataitem("Rate") / CurrencyRate) + " " + CurrencySymbolRight + GetGlobalResourceObject("lang", "PlusTax") %>'>
                                                </asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:TemplateColumn HeaderText="<%$ Resources:lang, PriceForYou%>" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:Label ID="Label7b" runat="server" Text='<%# FormatCurDoviz(CalcIndirim(CalcIndirim(container.dataitem("SatisFiyati"),container.dataitem("Indirim")),UserIndirim)) &amp; " " &amp; container.dataitem("CurrencyName")  %>'>
                                                </asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:TemplateColumn ItemStyle-HorizontalAlign="Right">
                                            <ItemTemplate>
                                                <asp:HyperLink ID="lnkAddtoCart3a" runat="server" CssClass="button" NavigateUrl='<%# "javascript:window.top.location.href=""/store/AddToCart.aspx?ProductId=" &amp; container.dataitem("ProductId") &amp; """;" %>'><%=GetGlobalResourceObject("lang", "AddToCart")%></asp:HyperLink>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                    </Columns>
                                </asp:DataGrid>
                            </asp:Panel>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>

                <div id="tab_details_review">
                    <asp:UpdatePanel ID="updPnlReview" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <input id="TabButton5" causesvalidation="false" runat="server" type="button" style="display: none" onserverclick="TabButton_Click" />
                            <asp:Panel ID="TabContent5" Visible="false" runat="server">
                                <p>
                                    <% If HttpContext.Current.User.Identity.IsAuthenticated() Then%>
                                    <%--<%=GetGlobalResourceObject("lang", "ReviewMsg4")%>--%>
                                    <a id="lnkaddreview" class="lightbox button" href='<%= BaseUrl & "/store/addreview.aspx?productID=" & Request.Params("ProductId") %>'><%=GetGlobalResourceObject("lang", "AddReview")%></a>
                                    <% Else%>
                                    <a id="lnklogin" href='/login.aspx?ReturnUrl=<%= Request.Url.AbsoluteUri %>'><%=GetGlobalResourceObject("lang", "ReviewMsg3")%></a>
                                    <% End If%>
                                </p>
                                <div id="ortPanel" runat="server">
                                    <asp:Label ID="lblOrtalama" Visible="false" runat="server"><%=GetGlobalResourceObject("lang", "ReviewAverage")%>:</asp:Label>
                                    <asp:Image ID="imgOrt" Visible="false" runat="server" AlternateText=""></asp:Image>
                                </div>
                                <asp:DataGrid ID="dgReview" runat="server" PageSize="20" AutoGenerateColumns="False" CellPadding="5" Width="100%" CssClass="datalist" HeaderStyle-CssClass="title" GridLines="none" ItemStyle-CssClass="row">
                                    <Columns>
                                        <asp:TemplateColumn HeaderText="<%$ Resources:lang, ReviewPoint%>">
                                            <ItemTemplate>
                                                <asp:Image ID="img" runat="server" AlternateText="" ImageUrl='<%# "../images/rating_" & DataBinder.Eval(Container.DataItem, "Rating") & ".gif" %>'></asp:Image>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:BoundColumn DataField="CreatedDate" DataFormatString="{0:d}" HeaderText="<%$ Resources:lang, Date1%>"></asp:BoundColumn>
                                        <asp:BoundColumn DataField="Comments" HeaderText="<%$ Resources:lang, Review%>"></asp:BoundColumn>
                                        <asp:BoundColumn DataField="Name" HeaderText="<%$ Resources:lang, User%>"></asp:BoundColumn>
                                        <asp:TemplateColumn HeaderText="<%$ Resources:lang, ReviewAgree%>">
                                            <HeaderStyle HorizontalAlign="center"></HeaderStyle>
                                            <ItemStyle HorizontalAlign="center" Width="150"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LinkButton1" CssClass="button" CausesValidation="false" runat="server" CommandName="yes" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ReviewId") %>'><%=GetGlobalResourceObject("lang", "Yes")%></asp:LinkButton>
                                                &nbsp;
                                                <asp:LinkButton ID="LinkButton2" CausesValidation="false"
                                                    runat="server" CommandName="no" CssClass="button" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ReviewId") %>'><%=GetGlobalResourceObject("lang", "No")%></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:BoundColumn DataField="YesCount" HeaderText="<%$ Resources:lang, Yes%>">
                                            <HeaderStyle HorizontalAlign="center"></HeaderStyle>
                                            <ItemStyle HorizontalAlign="center"></ItemStyle>
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="NoCount" HeaderText="<%$ Resources:lang, No%>">
                                            <HeaderStyle HorizontalAlign="center"></HeaderStyle>
                                            <ItemStyle HorizontalAlign="center"></ItemStyle>
                                        </asp:BoundColumn>
                                    </Columns>
                                </asp:DataGrid>
                            </asp:Panel>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>

                <div id="tab_details_installment">
                    <asp:UpdatePanel ID="updPnlTaksitList" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <input id="TabButton6" causesvalidation="false" runat="server" type="button" style="display: none" onserverclick="TabButton_Click" />
                            <asp:Panel ID="TabContent6" Visible="false" runat="server">
                                <asp:DataList ID="dgTaksitList" runat="server" RepeatDirection="Horizontal" RepeatColumns="4" CellPadding="5">
                                    <ItemStyle VerticalAlign="Top" />
                                    <ItemTemplate>
                                        <asp:Label ID="LblBankId" runat="server" Visible="False" Text='<%# container.dataitem("BankId") %>'></asp:Label>
                                        <p>
                                            <asp:Image runat="server" ID="imgLogo" AlternateText='<%# ChkNullString( container.dataitem("BankDesc"),container.dataitem("BankName")) %>' ImageUrl='<%# container.dataitem("logo") %>' />
                                        </p>
                                        <p>
                                            <asp:Label ID="lblName" runat="server" Text='<%# ChkNullString( container.dataitem("BankDesc"),container.dataitem("BankName")) %>'></asp:Label>
                                        </p>
                                        <asp:DataGrid ID="TaksitList" runat="server" AutoGenerateColumns="False" CellPadding="4" Width="100%">
                                            <ItemStyle CssClass="row1" />
                                            <AlternatingItemStyle CssClass="row2" />
                                            <Columns>
                                                <asp:TemplateColumn HeaderText="<%$ Resources:lang, Installment%>">
                                                    <HeaderStyle HorizontalAlign="center"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="center"></ItemStyle>
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblTaksitl" runat="server" Text='<%# iif(ChkNullString(container.dataitem("Description"))="",container.dataitem("Taksit"),container.dataitem("Description")) %>' Font-Bold='<%# IIf (container.dataitem("Rate") = 0,"TRUE","FALSE")  %>'>
                                                        </asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="<%$ Resources:lang, Cost%>">
                                                    <HeaderStyle HorizontalAlign="Right"></HeaderStyle>
                                                    <ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label22" runat="server" Text='<%# CurrencySymbolLeft & " " &  formatCurDoviz(CalcKdvDahil(Price1, DataBinder.Eval(Container, "DataItem.Rate")/ CurrencyRate)/container.dataitem("Taksit"))& "  " & CurrencySymbolRight   %>' Font-Bold='<%# IIf (container.dataitem("Rate") = 0,"TRUE","FALSE")  %>'>
                                                        </asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="<%$ Resources:lang, Total%>">
                                                    <HeaderStyle HorizontalAlign="Right"></HeaderStyle>
                                                    <ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" Text='<%# CurrencySymbolLeft & " " &  formatCurDoviz(CalcKdvDahil(Price1, DataBinder.Eval(Container, "DataItem.Rate")/ CurrencyRate))  & "  " & CurrencySymbolRight %>' ID="Label23" Font-Bold='<%# IIf (container.dataitem("Rate") = 0,"TRUE","FALSE")  %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                            </Columns>
                                        </asp:DataGrid>
                                    </ItemTemplate>
                                </asp:DataList>
                            </asp:Panel>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>

            </div>

            <asp:Label ID="lblKampanya" runat="server"></asp:Label>
            <asp:ModalUpdateProgress ID="mup" runat="server" DisplayAfter="0" BackgroundCssClass="modalBackground">
                <ProgressTemplate>
                    <div class="modalPopup">
                        <p>
                            <%=GetGlobalResourceObject("lang", "Loading")%>
                            <img alt="Yükleniyor" src="<% =getThemePath() %>/images/loading.gif" align="middle" />
                        </p>
                        <p>
                            <%=GetGlobalResourceObject("lang", "PleaseWait")%>
                        </p>
                    </div>
                </ProgressTemplate>
            </asp:ModalUpdateProgress>

        </div>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function () {
        $("a[rel='lightbox']").colorbox({ photo: true, current: "resim {current} / {total}" });
        $("a[rel='lightbox2']").colorbox({ photo: true, current: "resim {current} / {total}" });
        $(".lightbox").colorbox({ width: "600", height: "400", iframe: true, scrolling: false });
        //$("div.sliderimages").slideViewerPro({thumbs: 5, autoslide: false, asTimer: 3500, typo: false,galBorderWidth: 0,thumbsBorderOpacity: 0.5, buttonsTextColor: "",buttonsWidth: 30,thumbsActiveBorderOpacity: 0.5,thumbsActiveBorderColor: "black",shuffle: false,thumbsVis:true,pictWidth:"<%= ImageSize %>",pictHeight:"<%= ImageSize %>"});
        $("#<%= slider_container.controls(0).ClientId %>").cycle({
            timeout: 0,
            fit: true,
            pause: true,
            pauseOnPagerHover: true,
            pager: '#<%= slider_container.controls(1).ClientId %>',
            fit: true,
            pagerAnchorBuilder: function (idx, slide) {
                return '#<%= slider_container.controls(1).ClientId %> li:eq(' + (idx) + ') a';
            }
        });

        $(".TblUrunDetayModul #right").addClass('ui-widget-content ui-corner-all');
        $("#imageTabContainer").tabs({ selected: 0 });
        $("#<%= detailsTabContainer.ClientId %>").tabs({ selected: 0 });

    });


    $('#<%= detailsTabContainer.ClientId %>').bind('tabsselect', function (event, ui) {

        var str = String(ui.tab);
        var tabNo = "";
        if (str.indexOf("tab_details_images") > 0) {
            tabNo = "1";
        }
        else if (str.indexOf("tab_details_files") > 0) {
            tabNo = "2";
        }
        else if (str.indexOf("tab_details_alternatives") > 0) {
            tabNo = "3";
        }
        else if (str.indexOf("tab_details_usages") > 0) {
            tabNo = "4";
        }
        else if (str.indexOf("tab_details_review") > 0) {
            tabNo = "5";
        }
        else if (str.indexOf("tab_details_installment") > 0) {

            tabNo = "6";
        }
        else if (str.indexOf("tab_details_nonalternatives") > 0) {
            tabNo = "7";
        }

        var updateControl = $get('<%= detailsTabContainer.Parent.ClientId %>' + '_TabButton' + tabNo);
        if ($get('<%= detailsTabContainer.Parent.ClientId %>' + '_TabContent' + tabNo)) return;

        if (updateControl) {
            updateControl.click();
        }

    });

    function pageLoad(sender, args) {
        if (args.get_isPartialLoad()) {
            $("a[rel='lightbox']").colorbox({ photo: true, current: "resim {current} / {total}" });
            $("a[rel='lightbox2']").colorbox({ photo: true, current: "resim {current} / {total}" });
            $(".lightbox").colorbox({ width: "600", height: "400", iframe: true, scrolling: false });
            //$("div.sliderimages").slideViewerPro({thumbs: 5, autoslide: false, asTimer: 3500, typo: false,galBorderWidth: 0,thumbsBorderOpacity: 0.5, buttonsTextColor: "",buttonsWidth: 30,thumbsActiveBorderOpacity: 0.5,thumbsActiveBorderColor: "black",shuffle: false,thumbsVis:true,pictWidth:"<%= ImageSize %>",pictHeight:"<%= ImageSize %>"});
        }
    }

    function LoadReview() {
        var updateControl = $get(DetailsTabContainer + '_tabReview_lblYorumlar');
        if (updateControl) {
            updateControl.click();
            window.location = '#eYorum';
        }
    }

  

    var Qty = 1;
    function SetQuantity() {
        Qty = $("#ctl03_txtQty").val();
    }
    function DecQuantity() {
        if (parseInt($("#ctl03_txtQty").val()) > 1) {
            $("#ctl03_txtQty").val(parseInt($("#ctl03_txtQty").val()) - 1);
            Qty = $("#ctl03_txtQty").val();
        }
    }
    function IncQuantity() {
        $("#ctl03_txtQty").val(parseInt($("#ctl03_txtQty").val()) + 1);
        Qty = $("#ctl03_txtQty").val();
    }
</script>
