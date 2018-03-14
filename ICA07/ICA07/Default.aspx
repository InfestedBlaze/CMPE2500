<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ICA 07</title>
    <link href="style.css" rel="stylesheet" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="RedLabelUpdate.js"></script>
</head>
<body>
    <div class="header">ICA 07 - Basic Controls</div>

    <form id="form1" runat="server">
        <div class="container">
            <div class="contItem">
                <div class="embeddedCont">
                    <asp:Label ID="redLabel" CssClass="Center" runat="server" Text="Red:"></asp:Label>
                    <asp:TextBox ID="redAmount" CssClass="FullWidth" runat="server" type="range" value="128" min="0" max="255"></asp:TextBox>
                </div>

                <div class="embeddedCont">
                    <asp:Label ID="greenLabel" CssClass="Center" runat="server" Text="Green:"></asp:Label>
                    <div>
                        <asp:RadioButtonList ID="greenAmount" CssClass="FullWidth" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                            
                        </asp:RadioButtonList>
                    </div>
                </div>

                <div class="embeddedCont">
                    <asp:Label ID="blueLabel" CssClass="Center" runat="server" Text="Blue:"></asp:Label>
                    <asp:DropDownList ID="blueAmount" runat="server">
                        <asp:ListItem Value="0" Selected="True">Nada</asp:ListItem>
                        <asp:ListItem Value="64">Just A Bit</asp:ListItem>
                        <asp:ListItem Value="128">About Half</asp:ListItem>
                        <asp:ListItem Value="192">Most of It</asp:ListItem>
                        <asp:ListItem Value="255">Every Bit</asp:ListItem>
                    </asp:DropDownList>
                </div>

                <div class="embeddedCont">
                    <asp:CheckBox CssClass="Center" ID="grayscale" runat="server" Text="Gray scale" />
                </div>


                <div class="embeddedCont">
                    <asp:Label ID="ColourName" CssClass="Center" runat="server" Text="Name:"></asp:Label>
                    <asp:TextBox ID="ColourNameInput" runat="server"></asp:TextBox>
                </div>

                <asp:Button ID="ButtonPreviewColour" CssClass="FullWidth" runat="server" Text="Preview Colour" OnClick="ButtonPreviewColour_Click" /><br />
                <asp:Label ID="PreviewColor" CssClass="FullWidth" runat="server" Text="&nbsp;" BorderStyle="Inset"></asp:Label><br />
                <asp:Button ID="ButtonSaveColour" CssClass="FullWidth" runat="server" Text="Save Colour" OnClick="ButtonSaveColour_Click" /><br />
                <asp:ListBox ID="SavedColours" CssClass="FullWidth" runat="server" size="6" OnSelectedIndexChanged="SavedColours_SelectedIndexChanged" AutoPostBack="True"></asp:ListBox><br />
                <asp:Label ID="StatusBar" CssClass="FullWidth" runat="server" Text="&nbsp;"></asp:Label>
            </div>
        </div>
    </form>

    <div class="footer">&COPY; of Nic Wasylyshyn</div>
</body>
</html>
