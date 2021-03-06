﻿<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="n11categoryrelationlist.ascx.vb" Inherits="ASPNetPortal.n11categoryrelationlist" %>
<div class="pageN11CategoriesRelations">
	<asp:Label ID="lblerr" runat="server"></asp:Label> 
	<div class="buttonGroup">
		<asp:HyperLink ID="lnkAddNew" runat="server" NavigateUrl="/admin/default.aspx?MNID=158" CssClass="btnDefault"><i class="fa fa-plus"></i> <%=GetGlobalResourceObject("admin","AddNew") %></asp:HyperLink>
	</div>
	<div class="dataFilter boxToggle">
		<div class="toggleTitle toggleMini">
			<div class="titleTab">
				<ul class="tabMenu">
					<li><a href="#"><%= GetGlobalResourceObject("admin","Filter") %></a></li>
				</ul>
			</div>
			<div class="titleToggle"></div>
		</div>
		<div class="toggleContent">
			<div class="tabContent">
				<div class="tab">
					<div class="colGroup">
						<div class="col col2">
							<label><%= GetGlobalResourceObject("admin","N11CategoryName") %></label>
							<asp:TextBox ID="txtN11CatName" runat="server"></asp:TextBox>
							<asp:DropDownList ID="ddlN11CategoryName" runat="server">
							<asp:ListItem Text="<%$ Resources:admin,Contains %>" Value="like '%[]%'"></asp:ListItem>
							<asp:ListItem Text="<%$ Resources:admin,Starts %>" Value="like '[]%'"></asp:ListItem>
							<asp:ListItem Text="<%$ Resources:admin,Ends %>" Value="like '%[]'"></asp:ListItem>
							<asp:ListItem Text="<%$ Resources:admin,Equalss %>" Value="='[]'"></asp:ListItem>
							</asp:DropDownList>
						</div>
						<div class="col col2">
							<label><%= GetGlobalResourceObject("admin","TemplateName") %></label>
							<asp:TextBox ID="txtTemplateName" runat="server"></asp:TextBox>
							<asp:DropDownList ID="ddlTemplateName" runat="server">
							<asp:ListItem Text="<%$ Resources:admin,Contains %>" Value="like '%[]%'"></asp:ListItem>
							<asp:ListItem Text="<%$ Resources:admin,Starts %>" Value="like '[]%'"></asp:ListItem>
							<asp:ListItem Text="<%$ Resources:admin,Ends %>" Value="like '%[]'"></asp:ListItem>
							<asp:ListItem Text="<%$ Resources:admin,Equalss %>" Value="='[]'"></asp:ListItem>
							</asp:DropDownList>
						</div>
						<div class="col col2">
							<label><%= GetGlobalResourceObject("admin","PCategoryName") %></label>
							<asp:TextBox ID="txtProticaretCatName" runat="server"></asp:TextBox>
							<asp:DropDownList ID="ddlProticaretCategoryName" runat="server">
							<asp:ListItem Text="<%$ Resources:admin,Contains %>" Value="like '%[]%'"></asp:ListItem>
							<asp:ListItem Text="<%$ Resources:admin,Starts %>" Value="like '[]%'"></asp:ListItem>
							<asp:ListItem Text="<%$ Resources:admin,Ends %>" Value="like '%[]'"></asp:ListItem>
							<asp:ListItem Text="<%$ Resources:admin,Equalss %>" Value="='[]'"></asp:ListItem>
							</asp:DropDownList>
						</div>
						<div class="col">
							<label>&nbsp;</label>
							<asp:LinkButton ID="btnSearch" runat="server" CssClass="btnDefault"><i class="fa fa-search"></i> <%=GetGlobalResourceObject("admin","Search") %></asp:LinkButton>
						</div>
						<div class="col"></div>
						<div class="col"></div>
					</div>
				</div> 
			</div>
		</div>
	</div>
	<div class="dataTable">
		<asp:DataGrid ID="stList" runat="server" GridLines="None" AutoGenerateColumns="False" HeaderStyle-CssClass="title">
			<Columns>
				<asp:BoundColumn DataField="IND" Visible="false" SortExpression="IND" HeaderText="IND"></asp:BoundColumn>
				<asp:BoundColumn DataField="n11CatName" HeaderText="<%$ Resources:admin,N11CategoryName %>"></asp:BoundColumn>
				<asp:BoundColumn DataField="n11CatId"  HeaderText="<%$ Resources:admin,N11CategoryId %>"></asp:BoundColumn>
				<asp:BoundColumn DataField="proCatName" HeaderText="<%$ Resources:admin,PCategoryName %>"></asp:BoundColumn>
				<asp:BoundColumn DataField="proCatId" HeaderText="<%$ Resources:admin,proCatId %>"></asp:BoundColumn>
				<asp:TemplateColumn HeaderText="<%$ Resources:admin,N11IntegrationTemplate %>">
					<ItemTemplate>
						<asp:HyperLink ID="HyperLink2" CssClass="btnLink fancyContent" runat="Server" NavigateUrl='<%# "/admin/n11/editCatTemplate.aspx?IND=" & DataBinder.Eval(Container.DataItem, "IND") & "&MID=" & 0 %> '>                                
							<%#(DataBinder.Eval(Container.DataItem, "ShippingTemplate"))%>
						</asp:HyperLink>
					</ItemTemplate>
				</asp:TemplateColumn>                    
				<asp:TemplateColumn HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderText="<%$ Resources:admin,GGRemoveRelation %>">
					<ItemTemplate>
						<asp:LinkButton ID="lnkbtnDelete" runat="server" CausesValidation="false" CommandName="Delete" CssClass="btnIcon"  ><i class="fa fa-times"></i></asp:LinkButton>
					</ItemTemplate>
				</asp:TemplateColumn>
			</Columns>
		</asp:DataGrid>
	</div>
</div>
<script type="text/javascript">
    var newwindow;
    function popup(url) {
        newwindow = window.open(url, 'name', 'width=550,height=380,scrollbars=1,toolbar=0,status=1,resizable=1');
        if (window.focus) { newwindow.focus() }
    }
</script>