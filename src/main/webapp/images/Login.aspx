<%@ Page Language="vb" AutoEventWireup="false" Codebehind="Login.aspx.vb" Inherits="ReportWriter.Login"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>Webtime.NET Login Page</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="Styles.css" type="text/css" rel="stylesheet">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<div style="Z-INDEX: 101; LEFT: 27%; POSITION: absolute" align="left"><asp:image id="imgLogo" runat="server" Visible="False"></asp:image></div>
			<div style="Z-INDEX: 102; LEFT: 18%; POSITION: absolute; TOP: 27%"><IMG src="images/welcomeScreen.jpg">
				<asp:textbox id="txtUsername" style="Z-INDEX: 100; LEFT: 205px; POSITION: absolute; TOP: 162px"
					runat="server" MaxLength="50" Columns="30"></asp:textbox><asp:textbox id="txtPassword" style="Z-INDEX: 101; LEFT: 205px; POSITION: absolute; TOP: 195px"
					runat="server" MaxLength="50" Columns="30" TextMode="Password"></asp:textbox><asp:button id="btnSubmit" style="Z-INDEX: 102; LEFT: 380px; POSITION: absolute; TOP: 240px"
					runat="server" Text="Submit"></asp:button><br>
				<p align="center">
					© 2004 Resource Navigation Inc.</p>
			</div>
		</form>
		<script language="javascript" type="text/javascript">
		
			document.getElementById('txtUsername').focus();
		
		</script>
	</body>
</HTML>
