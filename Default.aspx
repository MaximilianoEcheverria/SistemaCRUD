<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Default.aspx.vb" Inherits="Sistema._Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Exolgan</title>
    <style type="text/css">
        #form1
        {
            width:767px;
            height:auto 886px;
            margin: auto auto;
            margin-top: auto;
            margin-bottom: auto;
        }
        .auto-style2 {
            height: 24px;
        }
        .auto-style3 {
            height: 76px;
        }
        .auto-style4 {
            height: 24px;
            width: 138px;
        }
        .auto-style5 {
            width: 113px;
        }
        .auto-style6 {
            width: 126px;
        }
        .auto-style7 {
            height: 160px;
        }
        .auto-style8 {
            height: 74px;
        }
        .auto-style9 {
            height: 45px;
        }
        .auto-style10 {
            height: 35px;
        }
        </style>
</head>
<body bgcolor="3ffffff">
    <form id="form1" runat="server">
        <asp:Panel ID="pPortada" runat="server" Height="350px" Width="765px">
        <asp:ImageButton ID="bPortada" runat="server" ImageAlign="Middle" ImageUrl="~/imagenes/portada.jpg" /></asp:Panel>

         <br /><br />

        <!--Panel de Loguin-->

        <asp:Panel ID="pLoguin" runat="server" BorderStyle="Solid" ForeColor="#003366" visible="false">
            <!--tabla-->
            <table style="width:100%">
                <tr>
                    <td colspan="5" class="auto-style3" align="Center">
                        <h2 > Ingresa tu Usuario y Clave , y luego oprima ENTRAR!! <br /><br /></h2> 
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4"><h2>Usuario :</h2></td>
                    <td class="auto-style2" align="Center">
                        <asp:TextBox ID="tUsuario" runat="server" Height="25px" MaxLength="10" ForeColor="#33CCFF"  BackColor="#003366"></asp:TextBox>
                    </td>

                    <td class="auto-style2"><h2>Clave :</h2></td>
                    <td class="auto-style2" align="Center">
                        <asp:TextBox ID="tClave" runat="server" Height="25px" TextMode="Password" MaxLength="10" ForeColor="#33CCFF" BackColor="#003366"></asp:TextBox>
                    </td>

                    <td class="auto-style2" align="Center">
                        <asp:ImageButton ID="ImageButton1" runat="server" Height="40px" ImageUrl="~/imagenes/entrar.png" />
                    </td>
                </tr>
                <tr>
                    <td colspan="5" align="Center">
                        <asp:Label ID="lErrorLoguin" runat="server" ForeColor="Red" Font-Size="Medium" Visible="false" ></asp:Label>
                    </td>
                </tr>
            </table>

            <!-- cierre de tabala-->
              <br />
            <!-- tabla -->

            <table style="Width:100%">
                <tr>
                    <td >
                        <asp:ImageButton ID="bRecuperarClave" runat="server" ImageUrl="~/imagenes/reenviarclave.png" ImageAlign="Middle" />
                    </td>
                    <td >
                        <asp:Label ID="lReenviarClave" runat="server" ForeColor="Red" Font-Size="Medium" Visible="false"></asp:Label>
                    </td>
                </tr>
            </table>  <!-- cierre de tabla -->

            <br /> <br />

            <table width="765px">
                <tr>
                    <td align="Center">
                        <asp:ImageButton ID="bVolverLoguin" runat="server" ImageUrl="~/imagenes/terminarvolver.png" ImageAlign="Middle" />
                    </td>
                </tr>
            </table>
           

        </asp:Panel>

        <br /><br />

        <!-- Panel de pLoguin Menu-->

        <asp:Panel ID="pLoguinMenu" runat="server" Height="392px" Font-Bold="true" Width="765px" ForeColor="Blue" Font-Size="Large" BorderStyle="Solid" Visible="false">
           
            <!-- tabla -->

            <table >
                <tr>
                    <td width="750px" align="Center" >
                        <asp:Image runat="server" ImageUrl="~/imagenes/registrate.png" Height="55px" />
                    </td>
                </tr>
                <tr>
                    <td width="750px" align="Center">
                        <asp:ImageButton runat="server" ImageUrl="~/imagenes/registrateaqui.png" ImageAlign="Middle" ID="bRegistrase" />
                    </td>
                </tr>
                <tr>
                    <td width="750px" align="Center">
                        <asp:ImageButton runat="server" ImageUrl="~/imagenes/yaregistrado.png" ImageAlign="Middle" ID="bEntrarAqui" />
                    </td>
                </tr>
                <tr>
                    <td width="750px" align="Center">
                        <asp:ImageButton runat="server" ImageUrl="~/imagenes/terminarvolver.png" ImageAlign="Middle" Height="70px" ID="bRegistrarseVolverLoguinU13" />
                    </td>
                </tr>

            </table>

            <!-- cierre de tabla -->

        </asp:Panel>
        
        <br /> <br />

        <!-- Panel de Registrarse -->

        <asp:Panel ID="pRegistrarse" runat="server" BorderColor="#66CCFF" Height="900px" Visible="false" ForeColor="#372C57" style="margin-right:0px" Font-Size="Large">

            <!-- tabla -->
             
            <table style="width:100%;">
                <tr>
                    <td width="765px" align="Center">
                        <asp:Image runat="server" ImageUrl="~/imagenes/registrarsetitulo.png" ImageAlign="Middle" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <h3>Para poder registrarse debe ser mayor de 18 años, residir en Argentina y contar con documentos válido en Argentina que acredite tu identidad.<br/>
                            Solo se puede hacer un registro por docmento. Los datos deben ser reales, correctos y vigentes.<br />
                            Todos los datos a continuación(menos Origen) son obligatorios:</h3>
                    </td>
                </tr>

            </table> <!-- Cierre de tabla -->

            <br />

            <table width="765px"  > <!-- Inicio de Tabla -->
                <tr>   <!-- --------------------------------- Nombre ----------------------------------- -->
                    <td width="255px"  colspan="2"><h3>Tu/s Nombre/s :</h3></td>

                    <td width="315px">
                        <asp:TextBox ID="tNombreU" runat="server" MaxLength="20" ForeColor="#33CCFF" BackColor="#003366" Width="305px" Height="28px" Font-Size="X-Large"></asp:TextBox>
                    </td>

                    <td align="Center">
                        <asp:Label ID="lENombreU" runat="server" ForeColor="Red" Font-Size="Medium" Visible="false"></asp:Label>
                    </td>
                </tr>
                <tr> <!-- ---------------------------------- Apellido -------------------------------------- -->
                    <td width="255px" height="35px" colspan="2"><h3>Apellido/s : </h3></td>

                    <td width="315px">
                        <asp:TextBox ID="tApellidoU" runat="server" MaxLength="20" ForeColor="#33CCFF" BackColor="#003366" Width="305px" Height="28px" Font-Size="X-Large"></asp:TextBox>
                    </td>

                    <td align="Center">
                        <asp:Label ID="lEApellidoU" runat="server" ForeColor="Red" Font-Size="Medium" Visible="false"></asp:Label>
                    </td>
                </tr>
                <tr > <!-- ------------------------------------ Tipo de Documento ------------------------------------ -->
                    <td width="255px" height="35px" colspan="2"><h3>Tipo de Doc :</h3></td>
                    <td>
                        <asp:DropDownList ID="dTDocU" runat="server" ForeColor="#33CCFF" BackColor="#003366" Width="305px" Height="28px" Font-Size="X-Large">
                            <asp:ListItem Value="DNI">Doc. Nacional de Identidad</asp:ListItem>
                            <asp:ListItem Value="LC">Libreta Civica</asp:ListItem>
                            <asp:ListItem Value="LE">Libreta de Enrolamiento</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>&nbsp</td>
                </tr>
                <tr> <!-- ------------------------------- N° de doc ----------------------------- -->
                    <td height="35px" class="auto-style5"><h3 class="auto-style6">N° de Doc:</h3></td>

                    <td height="35px" style="width: 127px" width="255px"><h6>(Sin puntos ni espacios)</h6></td>

                    <td width="315">
                        <asp:TextBox ID="tDocU" runat="server" ForeColor="#33CCFF" BackColor="#003366" Width="305px" Height="28px" Font-Size="X-Large"></asp:TextBox>
                    </td>
                    <td align="Center">
                        <asp:Label ID="lEDocU" runat="server" ForeColor="Red"  Font-Size="Medium" Visible="false"></asp:Label>
                    </td>
                </tr>
                <tr> <!-- ------------------------- Fecha de Nacimiento ------------------------ -->
                    <td width="255px" height="35px" colspan="2"><h3>Fecha Nac : ddmmaa</h3></td>
                    <td>
                         <asp:TextBox ID="tF_Nac" runat="server" ForeColor="#33CCFF" BackColor="#003366" Width="140px" Height="28px" Font-Size="X-Large"></asp:TextBox>
                         &nbsp;
                         <asp:Label ID="lEdadU" runat="server" BackColor="#3FFFFF" Font-Size="X-Large" ForeColor="#003366" Text="0"></asp:Label>
                         &nbsp;&nbsp;&nbsp;&nbsp; AÑOS</td>
                    <td  align="Center">
                        <asp:Label ID="lEEdadU" runat="server" ForeColor="Red" Font-Size="Medium" Visible="false"></asp:Label>
                    </td>
                </tr>
                <tr> <!-- ---------------------- Email --------------------------- -->
                    <td width="255px" height="35px" colspan="2"><h3>Email :</h3></td>
                    <td>
                        <asp:TextBox ID="tEmailU" runat="server" MaxLength="70" Rows="2" TextMode="MultiLine" Width="305px" Height="28px" ForeColor="#33CCFF" BackColor="#003366" Font-Size="X-Large"></asp:TextBox>
                    </td>
                    <td align="Center">
                        <asp:Label ID="lEEmailU" runat="server" ForeColor="Red" Font-Size="Medium" Visible="false"></asp:Label>
                    </td>
                </tr>
                <tr> <!-- ----------------------------- Provincia ----------------------------------- -->
                    <td width="255px" height="35px" colspan="2"><h3>Provincia :</h3></td>
                    <td width="315px">
                        <asp:DropDownList ID="dProvinciaU" runat="server" ForeColor="#33CCFF" BackColor="#003366" Width="305px" Height="30px" Font-Size="X-Large">
                            <asp:ListItem Value="1">Buenos Aires</asp:ListItem>
                            <asp:ListItem Value="2">CABA</asp:ListItem>
                            <asp:ListItem Value="3">Catamarca</asp:ListItem>   
                            <asp:ListItem Value="4">Chaco</asp:ListItem>
                            <asp:ListItem Value="5">Chubut</asp:ListItem>
                            <asp:ListItem Value="6">Córdoba</asp:ListItem>
                            <asp:ListItem Value="7">Corrientes</asp:ListItem>
                            <asp:ListItem Value="8">Entre Rios</asp:ListItem>
                            <asp:ListItem Value="9">Formosa</asp:ListItem>
                            <asp:ListItem Value="10">Jujuy</asp:ListItem>
                            <asp:ListItem Value="11">La Pampa</asp:ListItem>
                            <asp:ListItem Value="12">La Rioja</asp:ListItem>
                            <asp:ListItem Value="13">Mendoza</asp:ListItem>
                            <asp:ListItem Value="14">Misiones</asp:ListItem>
                            <asp:ListItem Value="15">Neuqúen</asp:ListItem>
                            <asp:ListItem Value="16">Río Negro</asp:ListItem>
                            <asp:ListItem Value="17">Salta</asp:ListItem>
                            <asp:ListItem Value="18">San Juan</asp:ListItem>
                            <asp:ListItem Value="19">San Luis</asp:ListItem>
                            <asp:ListItem Value="20">Santa Cruz</asp:ListItem>
                            <asp:ListItem Value="21">Santa Fe</asp:ListItem>
                            <asp:ListItem Value="22">Santiago del Estero</asp:ListItem>
                            <asp:ListItem Value="23">Tierra del Fuego</asp:ListItem>
                            <asp:ListItem Value="24">Tucumán</asp:ListItem>
                        </asp:DropDownList> 
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr> <!-- -------------------------- Localidad ---------------------------- -->
                    <td width="255px" height="35px" colspan="2"><h3>Localidad :</h3></td>
                    <td>
                        <asp:TextBox ID="tLocalidadU" runat="server" MaxLength="25" ForeColor="#33CCFF" BackColor="#003366" Width="305px" Height="28px" Font-Size="X-Large"></asp:TextBox>
                    </td>
                    <td align="Center">
                        <asp:Label ID="lELocalidadU" runat="server" ForeColor="Red" Font-Size="Medium" Visible="false"></asp:Label>
                    </td>
                </tr>
                <tr> <!-- ------------------------ Dirección ------------------------------ -->
                    <td width="255px" height="35px" colspan="2"><h3>Dirección :</h3></td>
                    <td>
                        <asp:TextBox ID="tDireccionU" runat="server" MaxLength="70" Rows="2" TextMode="MultiLine" ForeColor="#33CCFF" BackColor="#003366" Height="28px" Width="305px" Font-Size="X-Large"></asp:TextBox>  
                    </td>
                    <td align="Center">
                        <asp:Label ID="lEDireccionU" runat="server" ForeColor="Red" Font-Size="Medium" Visible="false"></asp:Label>
                    </td>
                </tr>
                <tr> <!-- ---------------------------- Telefono -------------------------------- -->
                    <td width="255px" height="35px" colspan="2"><h3>Télefono :</h3></td>
                    <td>
                        <asp:TextBox ID="tTelefonosU" runat="server" MaxLength="25" ForeColor="#33CCFF" BackColor="#003366" Width="305px" Height="28px" Font-Size="X-Large"></asp:TextBox>
                    </td>
                    <td align="Center">
                        <asp:Label ID="lETelefonosU" runat="server" ForeColor="Red" Font-Size="Medium" Visible="false"></asp:Label>
                    </td>
                </tr>
                <tr> <!-- -------------------------- Usuario ----------------------------- -->
                    <td width="255px" height="35px" colspan="2"><h3>Usuario :</h3></td>
                    <td>
                        <asp:TextBox ID="tUsuarioU" runat="server" MaxLength="10" ForeColor="#33CCFF" BackColor="#003366" Width="305px" Height="28px" Font-Size="X-Large"></asp:TextBox>
                    </td>
                    <td align="Center">
                        <asp:Label ID="lEUsuarioU" runat="server" ForeColor="Red" Font-Size="Medium" Visible="false"></asp:Label>
                    </td>
                </tr>
                <tr> <!-- ------------------------ Password --------------------------------- -->
                    <td width="255px" height="35px" colspan="2"><h3>Clave :</h3></td>
                    <td>
                        <asp:TextBox ID="tClaveU" runat="server" MaxLength="10" TextMode="Password" ForeColor="#33CCFF" BackColor="#003366" Width="305px" Height="28px" Font-Size="X-Large"></asp:TextBox>
                    </td>
                    <td align="Center">
                        <asp:Label ID="lEClaveU" runat="server" ForeColor="Red" Font-Size="Medium" Visible="false"></asp:Label>
                    </td>
                </tr>
                <tr> <!-- ------------------------------ Repetir Password --------------------------- -->
                    <td width="255px" height="35pz" colspan="2"><h3>Repetir Clave :</h3></td>
                    <td>
                        <asp:TextBox ID="tRepetirClaveU" runat="server" MaxLength="10" TextMode="Password" ForeColor="#33CCFF" BackColor="#03366" Width="305px" Height="28px" Font-Size="X-Large"></asp:TextBox>
                    </td>
                    <td align="Center">
                        <asp:Label ID="lERepetirClaveU" runat="server" ForeColor="Red" Font-Size="Medium" Visible="false"></asp:Label>
                    </td>
                </tr>
            </table> <!-- Cierre de Tabla -->

            <br />

            <asp:Label ID="lErroresU" runat="server" ForeColor="Red" Font-Size="Medium" Visible="false"></asp:Label>

            <br /><br />

            <table width="765px"> <!-- Inicio Table -->
                <tr>
                    <td >
                        <asp:ImageButton ID="bRegistrarseU" runat="server" ImageUrl="~/imagenes/registrarse.png" ImageAlign="Middle" Width="300px" />
                    </td>
                    <td>
                        <asp:ImageButton ID="bRegistrarseUO" runat="server" ImageUrl="~/imagenes/cancelarvolver.png" ImageAlign="Middle" Width="300px" />
                    </td>
                </tr>
            </table> <!-- Cierre de Tble -->

         </asp:Panel>  <!-- Cierre de Panel Registrarse -->

        <br />

        <!-- Inicio Panel de Bienvenido -->

        <asp:Panel ID="pBienvenidos" runat="server" BorderColor="#66CCFF" Height="335px" ForeColor="#372C57" Font-Size="Large" Visible="false">
           
            <table > <!-- Inicio de Table -->
                <tr>
                    <td align="Center" width="765px"><h1>Bienvenido/a !!! <br />
                        <asp:Label ID="lBienvenido" runat="server" Text="Label"></asp:Label>
                        <br /></h1></td>
                </tr>
                <tr>
                    <td align="Center">
                        <asp:Image runat="server" ImageUrl="~/imagenes/exolgan2.png" ImageAlign="Middle"  />
                    </td>
                </tr>
                <tr>
                    <td align="Center" class="auto-style7"><h2>International Trade Logistics (ITL) somos un conjunto de empresas que desarrollamos, coordinamos e integramos compañías especializadas en gestionar procesos logísticos y portuarios.
                        Intervenimos en todos los modos de transporte, tanto a nivel local como regional. <br /> ¡Conoce todos nuestros servicios! <br /><br /></h2></td>
                </tr>
                <tr>
                    <td align="Center" class="auto-style8">
                        <asp:ImageButton ID="bTodook" runat="server" ImageUrl="~/imagenes/todook.png" ImageAlign="Middle" Width="305" Height="70px"/>
                    </td>
                </tr>
            </table> <!-- Cierre de table -->
        </asp:Panel>  <!-- Cierre de Panel de Bienvenido -->
        
        <br />
        <br />
        <br />
        <br />
        
        <!-- Inicio de Panel Area Usuario -->
        <asp:panel ID="pAreaUsuario" runat="server" Font-Bold="true" Width="763px" ForeColor="Blue" Font-Size="Large" BorderStyle="Solid" Visible="false" Height="465px" >

            <table width="765px"> <!-- inico de table -->
                <tr>
                    <td align="Center" height="50px">
                        <asp:Label ID="lBienvenidoAreaU" runat="server" Font-Size="X-Large" ></asp:Label>
                    </td>        
                </tr>
                <tr>
                     <td align="Center">
                        <asp:ImageButton ID="bAhoraQueHago" runat="server" ImageUrl="~/imagenes/ahora_que_hago.png" ImageAlign="Middle" />
                    </td>
                </tr>
            </table> <!-- cierre de table -->

            <br />
            <br />

            <table> <!-- Inicio de table -->
                <tr>
                    <td align="Center" width="765px" height="45px" >
                        <asp:ImageButton ID="bHacerPedido" runat="server" ImageUrl="~/imagenes/hacerpedido.png" ImageAlign="Middle" />
                    </td>
                </tr>
                <tr>
                    <td align="Center" width="765px" height="45px">
                        <asp:ImageButton ID="bVerHistorico" runat="server" ImageUrl="~/imagenes/vertodosmov.png" ImageAlign="Middle" />
                    </td>
                </tr>
                <tr>
                    <td align="Center" height="45px">
                        <asp:ImageButton ID="bModificarDatos" runat="server" ImageUrl="~/imagenes/modificardatos.png" ImageAlign="Middle" />
                     </td>
                </tr>
                <tr>
                    <td align="Center">
                        <asp:ImageButton ID="bPedidos" runat="server" ImageUrl="~/imagenes/pedidosfabrica.png" ImageAlign="Middle" Height="50px" Width="322px" />
                    </td>
                </tr>
                <tr>
                    <td align="Center" class="auto-style9">
                        <asp:ImageButton ID="bVolverLoguinU1" runat="server" ImageUrl="~/imagenes/terminarvolver.png" ImageAlign="Middle" />
                    </td>
                </tr>
            </table> <!-- Cierre de table -->

        </asp:panel> <!-- cierre de panel Area Usuario -->

        <br />
        <br />

        <!-- inicio de panel ahora que hago -->
        <asp:Panel ID="pAhoraQueHago" runat="server" Width="765px" Height="400px" Font-Bold="true" ForeColor="Blue" Visible="false" BorderStyle="Solid" Font-Size="Large">

            <table> <!-- inico de table -->
                <tr>
                    <td align="Center"><h1>Te cuento un poco!!</h1></td>
                </tr>
                <tr>
                    <td align="Center" height="150px"><h3>Aca podes escribir una descripción de un servicio, o como funciona la aplicación. <br />
                        Escribir acorde al destino que le vas a dar al proyecto. <br /> 
                        La idea es guiar al que se metio en tu aplicación sin saber demaciado sobre dónde se metió. <br />
                        Podés extenderte lo que consideres necesario, inclusive agregar fotos o imagenes para hacer más entendible algún proceso.</h3></td>
                </tr>
                <tr>
                    <td align="Center" height="45px">
                        <asp:ImageButton ID="bVolverLoguinU2" runat="server" ImageUrl="~/imagenes/terminarvolver.png" ImageAlign="Middle" />
                    </td>
                </tr>
            </table> <!-- cierre de table -->

        </asp:Panel> <!-- cierre de panel de ahora que hago -->

        <br />
        <br />

        <!-- Inicio de Panel de Cabiar datos Personales -->
        <asp:Panel ID="pCambiarDatosPersonalesU" runat="server" Height="700px" ForeColor="#372C57" BackImageUrl="~/imagenes/datospersonales.jpg" Font-Bold="true" Visible="false">

            <table > <!-- inicio de tabla -->
                <tr>
                    <td align="Center" height="80px" width="765px">
                        <h1>Cambiar tus datos personales</h1>
                    </td>
                </tr>
            </table> <!-- cierre de table -->

            <br />

            <table width="765px"> <!-- inicio de table -->

                <tr> <!------------------------------- Email ----------------------- -->
                    <td width="255px">
                        <h3>Email válido para notificaciones:</h3>
                    </td>
                    <td width="315px">
                        <asp:TextBox ID="tCamEmail" runat="server" MaxLength="70" TextMode="MultiLine"  ForeColor="#33CCFF" BackColor="#003366" Height="28px" Width="305px" Font-Size="Large"></asp:TextBox>
                    </td>
                    <td align="Center">
                       <asp:Label ID="EEmailU" runat="server" Visible="false" ForeColor="Red" Font-Size="Medium"></asp:Label>
                    </td>
                </tr>

                <tr><!-- ---------------------------------- Provincia --------------------------------- -->
                    <td width="255px">
                        <h3>Provincia :</h3>
                    </td>
                    <td width="315px">
                        <asp:DropDownList ID="dCamProvincia" runat="server" Width="305px" Height="28px" ForeColor="#33CCFF" BackColor="#003366" Font-Size="Large">
                            <asp:ListItem Value="1">Buenos Aires</asp:ListItem>
                            <asp:ListItem Value="2">CABA</asp:ListItem>
                            <asp:ListItem Value="3">Catamarca</asp:ListItem>   
                            <asp:ListItem Value="4">Chaco</asp:ListItem>
                            <asp:ListItem Value="5">Chubut</asp:ListItem>
                            <asp:ListItem Value="6">Córdoba</asp:ListItem>
                            <asp:ListItem Value="7">Corrientes</asp:ListItem>
                            <asp:ListItem Value="8">Entre Rios</asp:ListItem>
                            <asp:ListItem Value="9">Formosa</asp:ListItem>
                            <asp:ListItem Value="10">Jujuy</asp:ListItem>
                            <asp:ListItem Value="11">La Pampa</asp:ListItem>
                            <asp:ListItem Value="12">La Rioja</asp:ListItem>
                            <asp:ListItem Value="13">Mendoza</asp:ListItem>
                            <asp:ListItem Value="14">Misiones</asp:ListItem>
                            <asp:ListItem Value="15">Neuqúen</asp:ListItem>
                            <asp:ListItem Value="16">Río Negro</asp:ListItem>
                            <asp:ListItem Value="17">Salta</asp:ListItem>
                            <asp:ListItem Value="18">San Juan</asp:ListItem>
                            <asp:ListItem Value="19">San Luis</asp:ListItem>
                            <asp:ListItem Value="20">Santa Cruz</asp:ListItem>
                            <asp:ListItem Value="21">Santa Fe</asp:ListItem>
                            <asp:ListItem Value="22">Santiago del Estero</asp:ListItem>
                            <asp:ListItem Value="23">Tierra del Fuego</asp:ListItem>
                            <asp:ListItem Value="24">Tucumán</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>

                <tr> <!-- ------------------------------ Localidad -------------------------------- -->
                    <td width="255px">
                        <h3>Localidad :</h3>
                    </td>
                    <td width="315px">
                        <asp:TextBox ID="tCamLocalidad" runat="server" MaxLength="25" Width="305px" Height="28px" ForeColor="#33CCFF" BackColor="#003366" Font-Size="Large"></asp:TextBox>
                    </td>
                    <td align="Center">
                        <asp:Label ID="ELocalidadU" runat="server" Visible="false" Font-Size="Medium" ForeColor="Red"></asp:Label>
                    </td>
                </tr>

                <tr> <!-- -------------------------------- Direccion ------------------------------- -->
                    <td width="255px">
                        <h3>Dirección :</h3>
                    </td>
                    <td width="315px">
                        <asp:TextBox ID="tCamDireccion" runat="server" MaxLength="70" TextMode="MultiLine" ForeColor="#33CCFF" BackColor="#003366" Height="28" Width="305" Font-Size="Large"></asp:TextBox>
                    </td>
                    <td align="Center">
                        <asp:Label ID="EDireccionU" runat="server" Visible="false" Font-Size="Medium" ForeColor="Red"></asp:Label>
                    </td>
                </tr>

                <tr> <!-- --------------------------------- Telefono ---------------------------------- -->
                    <td width="255px">
                        <h3>Teléfono (agregue caracteristica):</h3>
                    </td>
                    <td width="315">
                        <asp:TextBox ID="tCamTelefono" runat="server" MaxLength="10" ForeColor="#33CCFF" BackColor="#003366" Font-Size="Large" Height="28px" Width="305px"></asp:TextBox>
                    </td>
                    <td align="Center">
                        <asp:Label ID="ETelefonoU" runat="server" Visible="false" Font-Size="Medium" ForeColor="Red"></asp:Label>
                    </td>
                </tr>

                <tr> <!-- ----------------------------------- Usuario -------------------------------------- -->
                    <td width="255px">
                        <h3>Usuario :</h3>
                    </td>
                    <td width="315px">
                        <asp:TextBox ID="tCamUsuario" runat="server" MaxLength="10" ForeColor="#33CCFF" BackColor="#003366" Font-Size="Large" Width="305px" Height="28px" ></asp:TextBox>
                    </td>
                    <td align="Center">
                        <asp:Label ID="EUsuarioU" runat="server" Visible="false" Font-Size="Medium" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
                <tr> <!-- ------------------------------------- Clave ----------------------------------- -->
                    <td width="255px">
                        <h3>Clave :</h3>
                    </td>
                    <td width="315px">
                        <asp:TextBox ID="tcamClave" runat="server" MaxLength="10"  ForeColor="#33CCFF" BackColor="#003366" Font-Size="Large" Width="305px" Height="28px" ></asp:TextBox>
                    </td>
                    <td align="Center">
                        <asp:Label ID="EClaveU" runat="server" Visible="false" Font-Size="Medium" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
                <tr> <!-- -------------------------------------- Error --------------------------------------- -->
                    <td align="Center" colspan="3">
                        <asp:Label ID="Error" runat="server" Visible="false" Font-Size="Medium" ForeColor="Red" Height="50px"></asp:Label>
                    </td>
                </tr>

            </table> <!-- cierre de table -->

            <br />

            <table>
              
                <tr>
                    <td align="center" width="382px">
                        <asp:ImageButton ID="bGuardarDatos" runat="server" ImageUrl="~/imagenes/cambiarlosdatos.png" ImageAlign="Middle" />
                    </td>
                    <td align="Center" width="382px">
                        <asp:ImageButton ID="bCancelarVolverCAm" runat="server" ImageUrl="~/imagenes/cancelarvolver.png" ImageAlign="Middle" />
                    </td>
                </tr>
                
            </table> <!-- cierre de table -->

        </asp:Panel> <!-- cierre de Panel Cambiar Datos Personales -->

        <br />
        <br />

        <!-- inicio de Panel de Datos Modificados -->
        <asp:Panel ID="pDatosModificados" runat="server" ForeColor="#372C57" BackImageUrl="~/imagenes/datospersonales.jpg" Font-Bold="true" Height="300px" Visible="false" >

            <table> <!-- inicio de table -->

                <tr>
                    <td align="Center" width="765px"><h2>Tus datos han sido Modificados Correctamente</h2></td>
                </tr>
                <tr>
                    <td align="Center" width="765px" height="150px">
                        <asp:ImageButton ID="bVolverAreaUsuario" runat="server" ImageUrl="~/imagenes/volveratuarea.png" ImageAlign="Middle" />
                    </td>
                </tr>
            </table> <!-- cierre de table -->

        </asp:Panel> <!-- cierre de Panel de Datos Modificados -->

        <br /> 
        <br />

        <!-- Inicio de PANEL DE PEDIDOS -->
        <asp:Panel ID="pPedidos" runat ="server" ForeColor="#372C57" Font-Bold="true" Height="250px" Visible="false">

            <table>
                <tr>
                    <td align="Center" width="765px" height="65px"><h1>Menu de Pedido </h1></td>
                </tr>
                <tr>
                    <td align="Center" width="765px">
                        <asp:ImageButton ID="imagenButton2" runat="server" ImageUrl="~/imagenes/nuevopedido2.png" ImageAlign="Middle" Height="45PX" />
                    </td>
                </tr>
                <tr>
                    <td align="Center" width="765px">
                        <asp:ImageButton ID="imagenButton3" runat="server" ImageUrl="~/imagenes/todoslospedidos.png" ImageAlign="Middle" Height="45px" />
                    </td>
                </tr>
                <tr>
                    <td align="Center" width="765px">
                        <asp:ImageButton ID="imagenButton4" runat="server" ImageUrl="~/imagenes/terminar.png" ImageAlign="Middle" Height="45px" />
                    </td>
                </tr>
            </table> <!-- cierre de tabla -->

            <!-- cierre de PANEL DE PEDIDOS -->
        </asp:Panel>

        <br />
        <br />

        <!-- Inicio de PANEL DE NUEVO PEDIDO -->

        <asp:Panel ID="pNuevoPedido" runat="server" ForeColor="#372C57" Font-Bold="true" Height="900px" Visible="false">

            <h1 align="Center" >Nuevo pedido a Fábrica</h1>
            <table> <!-- inicio de tabla -->

                <tr>
                    <td align="Center" width="200px" height="45px">
                        <asp:Button ID="bInstrucciones" runat="server" Text="Abrir Instrucciones" />
                    </td>
                    <td width="200px">
                        <asp:Label ID="lInstrucciones" runat="server" font_Size="medium" Text="Instrucciones" Font-Size="Medium"></asp:Label>
                    </td>
                </tr>
            </table> <!-- Cierre de table -->

            <br />

            <table> <!-- Inicio de table -->

                <tr> <!-- ---------------------------- gusto de Helados -------------------------------- -->
                    <td ><h2>Seleccione un gusto de Helado</h2></td>
                </tr>
                <tr>
                    <td height="35px" width="765px">
                        <asp:DropDownList ID="dHelados" runat="server" BackColor="Black" Width="700px" ForeColor="White" ></asp:DropDownList>  <!-- falta completar -->
                    </td>
                </tr>
                <tr>
                    <td><h2>(Seleccione Material (Embase,Bolsa,Etc....)</h2></td>
                </tr>
                <tr>
                    <td width="765px" class="auto-style10">
                        <asp:DropDownList ID="dMateriales" runat="server" BackColor="Black" Width="700px" ForeColor="White" ></asp:DropDownList>  <!-- falta completar -->
                    </td>
                </tr>
            </table> <!-- Cierre de tabla -->

            <br />

            <table><!-- inicio de table -->
                <tr>
                    <td width="255px"><h3>Agregar :</h3></td>
                    <td width="255px">
                        <asp:Label ID="lCosaAgregar" runat="server" Text="Label" Font-Size="Medium" ></asp:Label>
                    </td>
                    <td width="255px">
                        <asp:Label ID="lQueEs" runat="server" Text="Label" Font-Size="Medium" ></asp:Label>
                    </td>
                </tr>
            </table> <!-- cierre de tabla -->

            <br />

            <table> <!-- inicio de tabla -->
                <tr>
                    <td width="310px"><h2>Cantidad de latas o unidades :</h2></td>
                    <td width="80px" align="Center">
                        <asp:DropDownList ID="dCantLatas" runat="server" BackColor="Black" Width="60px" ForeColor="White">
                            <asp:ListItem Value="1">1</asp:ListItem>
                            <asp:ListItem Value="2">2</asp:ListItem>
                            <asp:ListItem Value="3">3</asp:ListItem>
                            <asp:ListItem Value="4">4</asp:ListItem>
                            <asp:ListItem Value="5">5</asp:ListItem>
                            <asp:ListItem Value="6">6</asp:ListItem>
                            <asp:ListItem Value="7">7</asp:ListItem>
                            <asp:ListItem Value="8">8</asp:ListItem>
                            <asp:ListItem Value="9">9</asp:ListItem>
                            <asp:ListItem Value="10">10</asp:ListItem>
                        </asp:DropDownList> 
                    </td>
                    <td align="Center" width="360px" >
                        <asp:ImageButton ID="bAgregarALista" runat="server" ImageUrl="~/imagenes/agregar.png" ImageAlign="Middle" Height="45px" />
                    </td>
                </tr>
            </table> <!-- cierre de tabla -->

            <br />

            <h2 align="Center">Esta es la lista de su pedido :</h2>

            <asp:GridView ID="gDatos" runat="server" Width="765px" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:ButtonField ButtonType="Image" CommandName="Quitar" ImageUrl="~/imagenes/quitar.png" Text="Quitar" />
                    <asp:BoundField DataField="Item" HeaderText="Item Solicitado" />
                    <asp:BoundField DataField="Tipo" HeaderText="Tipo" />
                    <asp:BoundField DataField="Cantidad" HeaderText="Cant." />
                </Columns>
                <EditRowStyle BackColor="#7C6F57" />
                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                <SortedAscendingHeaderStyle BackColor="#246B61" />
                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                <SortedDescendingHeaderStyle BackColor="#15524A" />
            </asp:GridView>

            <br />

            <table> <!-- inicio de table -->
                <tr>
                    <td align="Center" width="255px">
                        <asp:ImageButton ID="bQuitarTodos" runat="server" ImageUrl="~/imagenes/quitartodos.png" ImageAlign="Middle" Height="55px" />
                    </td>
                    <td align="255px" width="255px">
                        <asp:ImageButton ID="bSolicitarPedido" runat="server" ImageUrl="~/imagenes/solicitar.png" ImageAlign="Middle" Height="55px"/>
                    </td>
                    <td align="255px" width="255px">
                        <asp:ImageButton ID="bCancelarPedido" runat="server" ImageUrl="~/imagenes/cancelarpedido.png" ImageAlign="Middle" Height="55px" />
                    </td>
                </tr>
            </table> <!-- cierre de tabla -->

            <br />

            <asp:Label ID="lErrorPedido" runat="server" Font-Size="Medium" ForeColor="Red" Visible="false"></asp:Label>

        </asp:Panel> <!-- cierre de Panel Nuevo  pedidos -->

        <br />

        <!-- Incio Panel de  PEDIDO CREADO -->

        <asp:Panel ID="pPedidoCreado" runat="server" Font-Bold="true" ForeColor="#372C57" Visible="false" Height="250px" Width="765px">

            <table> <!-- inicio de tabla -->
                <tr>
                    <td align="Center" width="765px" height="120px">
                        <asp:Label ID="lPedidoCreado" runat="server" Font-Size="X-Large" ForeColor="#003366" Visible="false"  ></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="Center" width="765px">
                        <asp:ImageButton ID="imagenButton5" runat="server" ImageUrl="~/imagenes/terminar.png" ImageAlign="Middle" />
                    </td>
                </tr>
            </table> <!-- cierre de table -->

        </asp:Panel> <!-- cierre de panel PEDIDO CREADO -->

        <br />

        <!-- Inicio de HISTORIAL DE PEDIDOS -->

        <asp:Panel ID="pHistorico" runat="server" Font-Bold="true" ForeColor="#372C57" Width="765px" Height="600px" Visible="false">

            <h2 align="Center" > Historial de pedidos y revision de estados :</h2>

            <table> <!-- inicio de table -->
                <tr>
                    <td align="Center" width="765px">
                        <asp:Label ID="lErrorHistorico" runat="server" Font-Size="Medium" ForeColor="Red" Visible="false"></asp:Label>
                    </td>
                </tr>
            </table> <!-- cierre de table -->

            <br />

            <asp:GridView ID="gHistorico" runat="server" Width="765px" Height="400px" AutoGenerateColumns="False" ForeColor="#333333" GridLines="None" CellPadding="4">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:ButtonField ButtonType="Button" CommandName="Ver" Text="Ver pedido" >
                    <ControlStyle BackColor="Lime" />
                    <FooterStyle BackColor="Lime" />
                    </asp:ButtonField>
                    <asp:ButtonField ButtonType="Button" CommandName="Anular" HeaderText="(solo&quot;Solicitado&quot;)" Text="Anular Pedido" >
                    <ControlStyle BackColor="Red" />
                    </asp:ButtonField>
                    <asp:BoundField DataField="NPedido" HeaderText="N° de Pedido" ReadOnly="True" />
                    <asp:BoundField DataField="Fecha" DataFormatString="{0:dd/MM/yyyy HH:mm:tt}" HeaderText="Fecha y Hora" ReadOnly="True" />
                    <asp:BoundField DataField="Estado" HeaderText="Estado de Pedido" />
                </Columns>
                <EditRowStyle BackColor="#7C6F57" />
                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                <SortedAscendingHeaderStyle BackColor="#246B61" />
                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                <SortedDescendingHeaderStyle BackColor="#15524A" />
            </asp:GridView> 

            <br />
            <br />

            <table> <!-- inicio de table -->
                <tr>
                    <td align="Center" width="382px">
                        <asp:ImageButton ID="imagenButton8" runat="server" ImageUrl="~/imagenes/actualizar.png" ImageAlign="Middle" />
                    </td>
                    <td align="Center" width="382px">
                        <asp:ImageButton ID="bTerminarHistorico" runat="server" ImageUrl="~/imagenes/terminar.png" ImageAlign="Middle" Height="50px" />
                    </td>
                </tr>
            </table> <!-- cierre de table -->

        </asp:Panel> <!-- cierre de PANEL HISTORICO DE PEDIDOS -->

        <br />

        <!-- Inicio de PANEL DE VER UN PEDIDO --> 

        <asp:Panel ID="pVerUnPedido" runat="server" Font-Bold="true" ForeColor="#372C57" Width="765px" Height="380px" Visible="false">

            <table > <!-- inicio de table -->
                <tr>
                    <td width="255px" height="45px"><h2>Detalle del Pedido N° : </h2></td>
                    <td width="510px" height="45px">
                        <asp:Label ID="Label3" runat="server" ForeColor="#372C57" Font-Size="X-Large"></asp:Label>
                    </td>
                </tr>
            </table> <!-- Cierre de table -->

            <br />

            <table> <!-- inicio de table -->
                <tr>
                    <td align="Center" width="765px">
                        <asp:GridView ID="gVerUnPedido" runat="server" AutoGenerateColumns="False" ForeColor="#333333" GridLines="None" CellPadding="4" Width="550px" >
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="Item" HeaderText="Item Solicitado" />
                                <asp:BoundField DataField="Tipo" HeaderText="Tipo" />
                                <asp:BoundField DataField="Cantidad" HeaderText="Cant." />
                            </Columns>
                            <EditRowStyle BackColor="#7C6F57" />
                            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#E3EAEB" />
                            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#F8FAFA" />
                            <SortedAscendingHeaderStyle BackColor="#246B61" />
                            <SortedDescendingCellStyle BackColor="#D4DFE1" />
                            <SortedDescendingHeaderStyle BackColor="#15524A" />
                        </asp:GridView>
                    </td>
                </tr>
            </table> <!-- cierre de table -->

            <br />

            <table> <!--inicioo de table -->
                <tr>
                    <td align="Center" width="765">
                        <asp:Label ID="Label1" runat="server" ForeColor="Red" Font-Size="Medium" aling="Center" Visible="false" Height="45PX"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="Center" width="765px">
                        <asp:ImageButton ID="imagenButton9" runat="server" ImageUrl="~/imagenes/terminarvolver.png" ImageAlign="Middle" />
                    </td>
                </tr>
            
            </table> <!-- cierre de table -->

        </asp:Panel> <!-- cierre de PANEL VER UN PEDIDO -->

        <br />

        <asp:Panel ID="pAdministrador" runat="server" Font-Bold="true" Width="765px" Height="250px" ForeColor="#372C57" Visible="false">

            <asp:label id="lAdherente0" runat="server" align="Center" Font-Size="X-Large" ForeColor="#003366" ></asp:label>

        </asp:Panel>
      </form>
</html>
