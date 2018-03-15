<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Album.aspx.cs" Inherits="Album" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="style.css" rel="stylesheet" />
    <link href="AlbumStyle.css" rel="stylesheet" />
    <title>ICA 8 - Album</title>
</head>
<body>
    <div class="header">
        -- Album of [-]
    </div>

    <form id="form1" runat="server">
        <div class="container">
            <div class="contItem">
                <div class="albumSorting">
                    <asp:PlaceHolder ID="PlaceHolderImages" runat="server">
                        
                    </asp:PlaceHolder>
                </div>
                
                <asp:Button ID="UploadAgain" CssClass="FullWidth" runat="server" Text="Add Again" />
            </div>
        </div>
    </form>

    <div class="footer">
        &COPY; of Nic Wasylyshyn
    </div>
</body>
</html>
