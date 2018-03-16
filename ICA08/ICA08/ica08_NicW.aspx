<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ica08_NicW.aspx.cs" Inherits="ica08_NicW" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="style.css" rel="stylesheet" />
    <title>ICA 8 - Home</title>
</head>
<body>
    <div class="header">
        ICA 8 - ASP Imgur
    </div>

    <form id="form1" runat="server">

        <asp:HiddenField ID="LastUploadedPic" runat="server" />

        <div class="container">
            <div class="contItem">
                <asp:MultiView ID="MultiView" runat="server" ActiveViewIndex="0">
                    <%-- Login page --%>
                    <asp:View ID="View1" runat="server">
                        <div class="embeddedCont">
                            <div>Username:<asp:TextBox ID="UsernameInput" runat="server"></asp:TextBox></div>
                            <div>Password:<asp:TextBox ID="PasswordInput" TextMode="Password" runat="server"></asp:TextBox></div>
                        </div>
                        <asp:Button ID="Nextv1" CssClass="FullWidth" runat="server" Text="Next" OnClick="Nextv1_Click" />
                    </asp:View>
                    <%-- Add picture page --%>
                    <asp:View ID="View2" runat="server" OnActivate="View2_Activate">
                        <asp:Label ID="ThankYou" runat="server" Text="Thank you --, select a picture to upload:"></asp:Label><br />
                        <asp:FileUpload ID="FileUpload_Image" Text="No file selected." runat="server" />
                        <asp:Button ID="Nextv2" CssClass="FullWidth" runat="server" Text="Next" OnClick="Nextv2_Click" />
                    </asp:View>
                    <%-- Status page --%>
                    <asp:View ID="View3" runat="server">
                        <%-- Empty View --%>
                    </asp:View>
                </asp:MultiView>
                <%-- Always on the page items --%>
                <asp:Label ID="Status" CssClass="FullWidth" runat="server" BorderStyle="Inset" BackColor="#99FFCC" Text="&nbsp;"></asp:Label>
                <asp:Button ID="GoToAlbum" CssClass="FullWidth" runat="server" Text="Go to Album" PostBackUrl="~/Album.aspx"/>
                <asp:Button ID="Logout" CssClass="FullWidth" runat="server" Text="Logout" OnClick="Logout_Click"/>
            </div>
        </div>
    </form>

    <div class="footer">
        &COPY; of Nic Wasylyshyn
    </div>
</body>
</html>
