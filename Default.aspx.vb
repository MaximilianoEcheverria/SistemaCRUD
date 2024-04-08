Imports System.IO
Imports System.Data
Imports System.Data.SqlClient
Imports System.Globalization
Imports System.Net.Mail

Public Class _Default
    Inherits System.Web.UI.Page

    Public a As Integer
    Public connectionString As String = ConfigurationManager.ConnectionStrings(ConfigurationManager.AppSettings("conexion")).ToString()
    Public EmailActivo As String = ConfigurationManager.AppSettings("EmailActivo")
    Public Email As String = ConfigurationManager.AppSettings(EmailActivo)
    Public EmailPass As String = ConfigurationManager.AppSettings(EmailActivo & "Pass")

    Dim con As New SqlConnection(connectionString)
    Dim ar As String


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub bPortada_Click(sender As Object, e As ImageClickEventArgs) Handles bPortada.Click
        pPortada.Visible = False
        pLoguinMenu.Visible = True
    End Sub

    Protected Sub bVolverLoguin_Click(sender As Object, e As ImageClickEventArgs) Handles bVolverLoguin.Click
        pPortada.Visible = True
        pLoguin.Visible = False
    End Sub

    Protected Sub bRegistrase_Click(sender As Object, e As ImageClickEventArgs) Handles bRegistrase.Click
        pLoguinMenu.Visible = False
        pRegistrarse.Visible = True
    End Sub

    Protected Sub bRegistrarseVolverLoguinU13_Click(sender As Object, e As ImageClickEventArgs) Handles bRegistrarseVolverLoguinU13.Click
        pLoguinMenu.Visible = False
        pPortada.Visible = True
    End Sub

    Protected Sub bRegistrarseUO_Click(sender As Object, e As ImageClickEventArgs) Handles bRegistrarseUO.Click
        pRegistrarse.Visible = False
        pLoguinMenu.Visible = True
    End Sub

    Protected Sub bRegistrarseU_Click(sender As Object, e As ImageClickEventArgs) Handles bRegistrarseU.Click

        Dim ok As Boolean = True

        LimpiarErroresRegistroU()

        tNombreU.Text = tNombreU.Text.Trim.ToUpper
        If comprobar(tNombreU.Text) = False Then
            ArreglarCampo(tNombreU)
            ok = False
            lENombreU.Text = "El nombre contenia caracteres inválidos, fueron quitados."
            lENombreU.Visible = True
        End If
        tApellidoU.Text = tApellidoU.Text.Trim.ToUpper
        If comprobar(tApellidoU.Text) = False Then
            ArreglarCampo(tApellidoU)
            ok = False
            lEApellidoU.Text = "El Apellido contenia caracteres inválidos, fueron quitados."
            lEApellidoU.Visible = True
        End If
        tDocU.Text = tDocU.Text.Trim
        If comprobar(tDocU.Text) = False Or Not IsNumeric(tDocU.Text) Then
            SoloNumeros(tDocU)
            ok = False
            lEDocU.Text = "El Documento no era válido, se ajustó a número."
            lEDocU.Visible = True
        End If
        ArreglarCampo(tEmailU)
        If ValidaEmail(tEmailU.Text) = False Then
            ok = False
            lEEmailU.Text = "El Email no es válido."
            lEEmailU.Visible = True
        End If

        tLocalidadU.Text = tLocalidadU.Text.Trim().ToUpper
        If comprobar(tLocalidadU.Text) = False Then
            ArreglarCampo(tLocalidadU)
            ok = False
            lELocalidadU.Text = "La Localidad conteni caracteres invalidos, fueron quitados."
            lELocalidadU.Visible = True
        End If

        tDireccionU.Text = tDireccionU.Text.Trim().ToUpper
        If comprobar(tDireccionU.Text) = False Then
            ArreglarCampo(tDireccionU)
            ok = False
            lEDireccionU.Text = "La Dirección contenia cararcteres invalidos, fueron quitados."
            lEDireccionU.Visible = True
        End If

        tTelefonosU.Text = tTelefonosU.Text.Trim().ToUpper
        If comprobar(tTelefonosU.Text) = False Then
            ArreglarCampo(tTelefonosU)
            ok = False
            lETelefonosU.Text = "El tléfono contenia caracteres invalidos, fueron quitados."
            lETelefonosU.Visible = True
        End If

        Dim FechaNacimiento As Date
        ControlDeNacimiento(tF_Nac, ok, lEEdadU, lEdadU, True, FechaNacimiento)

        tUsuarioU.Text = tUsuarioU.Text.Trim().ToUpper
        If comprobar(tUsuarioU.Text) = False Or tUsuarioU.Text.IndexOf(" ") > -1 Then
            tUsuarioU.Text = tUsuarioU.Text.Replace(" ", "")
            ArreglarCampo(tUsuarioU)
            ok = False
            lEUsuarioU.Text = "El Usuario contenia caracteres inválidos, fueron quitados."
            lEUsuarioU.Visible = True
        End If

        If tUsuarioU.Text.Length < 5 Then
            ok = False
            lEUsuarioU.Text = "El Usuario debe tener de 5 a 10 caracteres, letras y/o números."
            lEUsuarioU.Visible = True
        End If

        tClaveU.Text = tClaveU.Text.Trim()
        If comprobar(tClaveU.Text) = False Or tClaveU.Text.IndexOf(" ") > -1 Then
            tClaveU.Text = tClaveU.Text.Replace(" ", "")
            ArreglarCampo(tClaveU)
            ok = False
            lEClaveU.Text = "La Clave contenia caracteres inválidos. Pruebe con letras y/o números."
            lEClaveU.Visible = True
        End If

        If tClaveU.Text.Length < 5 Then
            ok = False
            lEClaveU.Text = "La Clave debe tener de 5 a 10 caracteres, letras y/0 números."
            lEClaveU.Visible = True
        End If

        tRepetirClaveU.Text.Trim()
        If comprobar(tRepetirClaveU.Text) = False Or tRepetirClaveU.Text.IndexOf(" ") > -1 Then
            tRepetirClaveU.Text = tRepetirClaveU.Text.Replace(" ", "")
            ArreglarCampo(tRepetirClaveU)
            ok = False
            lERepetirClaveU.Text = "La segunda Clave contenia caracteres inválidos. Pruebe con letras y/o números."
            lERepetirClaveU.Visible = True
        End If

        If ok = False Then
            lErroresU.Text = "Revise los errores por favor y luego reintente."
            lErroresU.Visible = True
            Exit Sub
        End If

        If tRepetirClaveU.Text <> tRepetirClaveU.Text Then
            ok = False
            lERepetirClaveU.Text = "Las 2 claves son diferentes."
            lERepetirClaveU.Visible = True
        End If

        Session("Usuario") = tUsuarioU.Text
        Session("Password") = tClaveU.Text
        Session("TipoDocumento") = dTDocU.SelectedValue.Trim
        Session("Documento") = tDocU.Text.Trim
        If YaExisteSQL("select idusuario from usuarios where usuario='" & Session("Usuario") & "'") Then
            ok = False
            lEUsuarioU.Text = "El Usuario elegido ya existe. Pruebe con otro."
            lEUsuarioU.Visible = True
        End If

        If YaExisteSQL("select idusuario from usuarios where doc='" & Session("Documento") & "' and tdoc='" & Session("TipoDocumento") & "'") Then
            ok = False
            lEDocU.Text = "Ya existe el " & Session("TipoDocumento") & " " & Session("Documento") & " ."
            lEDocU.Visible = True
        End If

        If ok = False Then
            lErroresU.Text = "Solo se permite una inscripción por persona."
            lErroresU.Visible = True
            Exit Sub
        End If

        Session("Usuario") = tUsuarioU.Text.ToLower
        Session("Passord") = tClaveU.Text
        Session("TipoDocumento") = dTDocU.SelectedValue.Trim
        Session("Documento") = tDocU.Text.Trim
        Session("ApellidoYNombre") = tNombreU.Text.Trim & " " & tApellidoU.Text.Trim
        Session("Email") = tEmailU.Text.Trim

        LimpiarErroresRegistroU()

        If SQL_Accion("insert into Usuarios (Apellido,Nombre,tDoc,Doc,Usuario,Pass,Email,idProv,Localidad,Direccion,Telefonos,fNacimiento) values ('" & tApellidoU.Text.Trim & "','" & tNombreU.Text.Trim & "','" & Session("TipoDocumento") & "','" & Session("Documento") & "','" & Session("Usuario") & "','" & Session("Password") & "','" & Session("Email") & "'," & dProvinciaU.SelectedValue & ",'" & tLocalidadU.Text.Trim & "','" & tDireccionU.Text.Trim & "','" & tTelefonosU.Text.Trim & "','" & FechaNacimiento.ToString("yyyy-MM-dd") & "') ") = False Then
            lErroresU.Text = "Se a producido un error al querer guardar tus datos..."
            lErroresU.Visible = True
            Exit Sub
        End If
        Session("idUsuario") = VNum(LeeUnCampo("select top 1 idUsuario from usuarios where Usuario ='" & Session("Usuario") & "' and Pass = '" & Session("Password") & "' ", "idUsuario"))
        lBienvenido.text = "Bienvenido" & Session("ApellidoYNombre") & " !!"

        Dim mensaje As String, xusuario As String = Session("ApellidYNombre"), en As String = Chr(13) & Chr(10)
        mensaje = xusuario & " a Exolgan !!. " & en & en &
            "Te damos un cordial bienvenida a  ser parte de esta  empresa." & en & en &
            "Tu Usuario es " & """" & Session("Usuario") & """" & en & en &
            "Tu Clave es " & """" & Session("Password") & """" & en & en &
            "Ya podes loguearte para ver tus datos!!." & en & en

        LimpiarErroresRegistroU()
        pRegistrarse.Visible = False
        pBienvenidos.Visible = True
        bRegistrarseVolverLoguinU13.Focus()
    End Sub

    Protected Sub bTodook_Click(sender As Object, e As ImageClickEventArgs) Handles bTodook.Click
        pBienvenidos.Visible = False
        pLoguin.Visible = True
    End Sub

    Protected Sub bEntrarAqui_Click(sender As Object, e As ImageClickEventArgs) Handles bEntrarAqui.Click
        pLoguinMenu.Visible = False
        pLoguin.Visible = True
    End Sub

    Sub ArreglarCampo(ByRef campo As TextBox)
        campo.Text = campo.Text.Trim.Replace("'", "").Replace("""", "").Replace("*", "").Replace("+", "").Replace("-", "").Replace("/", "").Replace(":", "").Replace("`", "").Replace("<", "").Replace(">", "").Replace("=", "").Replace("&", "")
    End Sub

    Function comprobar(ByVal user As String) As Boolean
        If user Is System.DBNull.Value Then
            Return False
        Else
            Dim aux As Boolean = True
            Dim listanegra, x As String

            listanegra = "'*+-/:;`><&" & """"

            If user <> "" Then
                For Each x In user
                    If aux = True Then
                        If InStr(1, listanegra, x) > 0 Then
                            aux = False
                        Else
                            aux = True
                        End If
                    Else
                        Return False
                    End If
                Next
                If aux = True Then
                    Return True
                End If
            Else
                Return False
            End If
        End If
    End Function

    Sub LimpiarErroresRegistroU()
        lErroresU.Text = ""
        lErroresU.Visible = False
        lENombreU.Text = ""
        lEApellidoU.Text = ""
        lEDocU.Text = ""
        lEdadU.Text = ""
        lEEmailU.Text = ""
        lELocalidadU.Text = ""
        lEDireccionU.Text = ""
        lEUsuarioU.Text = ""
        lEClaveU.Text = ""
        lERepetirClaveU.Text = ""
        lENombreU.Visible = False
        lEApellidoU.Visible = False
        lEDocU.Visible = False
        lEEdadU.Visible = False
        lEEmailU.Visible = False
        lELocalidadU.Visible = False
        lEDireccionU.Visible = False
        lETelefonosU.Visible = False
        lEUsuarioU.Visible = False
        lEClaveU.Visible = False
        lERepetirClaveU.Visible = False
    End Sub

    Sub LimpiarRegistroU()
        LimpiarErroresRegistroU()
        pRegistrarse.Visible = False

        tNombreU.Text = ""
        tApellidoU.Text = ""
        dTDocU.SelectedIndex = 0
        tDocU.Text = ""
        tEmailU.Text = ""
        dProvinciaU.SelectedIndex = 0
        tLocalidadU.Text = ""
        tDireccionU.Text = ""
        tTelefonosU.Text = ""
        tUsuarioU.Text = ""
        tClaveU.Text = ""
        tRepetirClaveU.Text = ""
    End Sub

    Public Function ValidaEmail(ByVal email As String) As Boolean
        Dim emailRegex As New System.Text.RegularExpressions.Regex("^(?<user>[^@]+)@(?<host>.+)$")
        Dim emailMatch As System.Text.RegularExpressions.Match = emailRegex.Match(email)
        Return emailMatch.Success
    End Function

    Sub SoloNumeros(ByRef campo As TextBox)
        Dim cam As String = campo.Text.Trim, salida As String = "", c As String
        For Each c In cam
            If IsNumeric(c) Then salida &= c
        Next
        campo.Text = salida
    End Sub

    Function VNum(ByVal NTexto As String) As Decimal
        'Tranforma un texto con algo, que puede ser un numero con coma o punto y devuelve un numero decimal siempre
        Return CDec(Val(NTexto.Trim.Replace(",", ".")))
    End Function

    Function NumSQL(ByVal numero As String) As String
        'Recibe un numero desde un TexBox por ejemplo, lo verifica como número válido, y luego le cambie la coma por punto para que sea válido en una sentencia de SQL , luego lo devuelve
        Return CStr(VNum(numero)).Trim.Replace(",", ".")
    End Function

    Function RellenaNum(ByVal numero As Integer, ByVal cantidad As Integer) As String
        'Rellena con 0s adelante el numero. Ideal´para dias y meses : Rellena (3,2)--> "03" Rellena(3,4)-->"0003"
        Dim snum As String = CStr(numero).Trim
        Return "00000000000000000000".Substring(0, cantidad - snum.Length) & snum
    End Function

    Public Function AñoMes(ByVal fecha As Date) As String
        'devuelve AAAA-MM
        Return RellenaNum(Year(fecha), 4) & "-" & RellenaNum(Month(fecha), 2)
    End Function

    Public Function Vstr(ByVal cosa As Object) As String
        If IsDBNull(cosa) Then
            Return ""
        Else Return CStr(cosa)

        End If
    End Function

    Function CalcularEdad(ByVal FechaNac As Date) As Integer
        Dim edad As Integer = DateTime.Today.AddTicks(-FechaNac.Ticks).Year - 1
        Return edad

    End Function

    Sub ControlDeNacimiento(ByRef xtf_nac As TextBox, ByRef ok As Boolean, ByRef xlEFNac As Label, ByRef xlEdad As Label, ByVal Valida18 As Boolean, ByRef FechaNacimiento As Date)
        ArreglarCampo(xtf_nac)
        xlEFNac.Visible = False
        If xtf_nac.Text.Length < 6 Then
            ok = False
            xlEFNac.Text &= "El campo Fecha de Nacimiento debe tener 6 números."
            xlEdad.Text = "0"
            xlEFNac.Visible = True
        Else
            Dim fechaX As String = xtf_nac.Text
            Dim AñosX As Integer = VNum(fechaX.Substring(4, 2))
            If AñosX + 2000 > Date.Today.Year Then
                AñosX += 1900
            Else
                AñosX += 2000
                fechaX = AñosX.ToString.Trim & "-" & fechaX.Substring(2, 2) & "-" & fechaX.Substring(0, 2)
                If Not IsDate(fechaX) Then
                    ok = False
                    xlEFNac.Text &= "El campo Fecha de Nacimiento, es una fecha inválida."
                    xlEdad.Text = "0"
                    xlEFNac.Visible = True
                Else
                    Dim dFechax As Date
                    dFechax = CDate(fechaX)
                    FechaNacimiento = dFechax
                    If dFechax > Date.Today Then
                        ok = False
                        xlEFNac.Text &= "Nacio en el futuro....."
                        xlEdad.Text = "0"
                        xlEFNac.Visible = True
                    Else
                        Dim Edad As Integer = CalcularEdad(dFechax)
                        xlEdad.Text = Edad
                        If Edad < 18 And Valida18 Then
                            ok = False
                            xlEFNac.Text &= "Debe ser mayor de edad(18 Años)."
                            xlEdad.Text = "0"
                            xlEFNac.Visible = True
                        End If
                    End If
                End If

            End If
        End If
    End Sub

    Public Function SQL_Accion(ByVal Sql_de_accion As String) As Boolean
        'Ejecuta la consulta de accion 'Sql_de_accion' abriendo la coneecion automaticamente se da cuenta si es de un insert, update o delete,
        'porque mira dentro de la sentencia que se le devuelve true si se pudo hacer, y false si hubo algun error.
        Dim adapter As New SqlDataAdapter, salida As Boolean = True
        Try
            If con.State = ConnectionState.Closed Then con.Open()
            'con.Open()
            If Sql_de_accion.ToUpper.IndexOf("INSERT") Then
                'MsgBox(Sql_de_accion)
                adapter.InsertCommand = New SqlCommand(Sql_de_accion, con)
                adapter.InsertCommand.ExecuteNonQuery()
            Else
                If Sql_de_accion.ToUpper.IndexOf("UPDATE") Then
                    adapter.UpdateCommand = New SqlCommand(Sql_de_accion, con)
                    adapter.UpdateCommand.ExecuteNonQuery()
                Else
                    If Sql_de_accion.ToUpper.IndexOf("DELETE") Then
                        adapter.DeleteCommand = New SqlCommand(Sql_de_accion, con)
                        adapter.DeleteCommand.ExecuteNonQuery()
                    Else
                        'esta mal la sintaxis porque no hay ni insert, ni delete ni update
                        salida = False
                    End If
                End If
            End If
        Catch ex As Exception
            MsgBox(ex.Message)
            salida = False

        End Try
        'con.Clase()
        Return salida

    End Function

    Function LeeUnCampo(ByVal sql As String, ByVal campo As String) As Object
        'Se le pasa un select de sql con un campo y devuelde el valor del campo como Objeto. Se supone que devuelde nada o 1 registro(no mas que 1)
        'Por ej: valor=LeerUnCampo("Select cosa from table where condi=1","cosa") valor tomará cosa. Si no encuentra nada devuelve "**NADA**".
        'Si hay error devuelve "**ERROR**"
        Dim da1 As New SqlDataAdapter(sql, con)
        Dim ds1 As New DataSet
        Try
            If con.State = ConnectionState.Closed Then con.Open()
            da1.Fill(ds1, "datos")
            If ds1.Tables("datos").Rows.Count < 1 Then
                Return "**NADA**"
            Else
                Return ds1.Tables("datos").Rows(0)(campo)
            End If
        Catch
            Return "**ERROR**"
        End Try

        Return ds1.Tables("datos").Rows(0)(campo)

    End Function

    Public Function YaExisteSQL(ByVal sql As String) As Boolean
        'Se le pasa un select de sql que en teoria busca algo, por eje: un número de cheuqe, s hay registros la funcion devuelve true,
        'estilo "El chueque ya existe", si no esta, devuleve false 
        'Dim ar As String

        Dim con As New SqlConnection(connectionString)
        Dim da1 As New SqlDataAdapter(sql, con)
        Dim ds1 As New DataSet
        da1.Fill(ds1, "afidesc")
        If ds1.Tables("afidesc").Rows.Count < 1 Then
            Return False
        Else
            Return True
        End If
    End Function

    Protected Sub ImageButton1_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButton1.Click

        Session("QueEs") = "Usuarios"

        Loguea()
    End Sub

    Sub Loguea()
        Dim usu As String = tUsuario.Text.Trim.ToUpper, pass As String = tClave.Text.Trim
        If comprobar(tUsuario.Text.Trim) = False Or comprobar(tClave.Text.Trim) = False Then
            lErrorLoguin.Text = "El Usuario o la Clave son incorrectos, Revise por favor."
            lErrorLoguin.Visible = True
            Exit Sub
        End If

        Dim da1 As New SqlDataAdapter("select * from " & Session("QueEs") & " where upper(ltrim(rtrim(usuario)))='" & usu & "' and ltrim(rtrim(pass))='" & pass & "'", con)
        Dim ds1 As New DataSet
        da1.Fill(ds1, "Login")
        If ds1.Tables("Login").Rows.Count = 0 Then

            lErrorLoguin.Text = "El Usuario o la Clave son incorrectos, Revise por favor."
            lErrorLoguin.Visible = True
            Exit Sub
        End If

        Select Case Session("QueEs")

            Case "Usuarios"
                Session("idUsuario") = ds1.Tables("Login").Rows(0)("idUsuario")
                Session("Usuario") = usu
                Session("Password") = pass
                Session("TipoDocuemnto") = ds1.Tables("Login").Rows(0)("tDoc")
                Session("Documento") = ds1.Tables("Login").Rows(0)("Doc").ToString.Trim
                Session("ApellidoYNombre") = ds1.Tables("Login").Rows(0)("Nombre").ToString.Trim & " " & ds1.Tables("Login").Rows(0)("Apellido").ToString.Trim
                Session("Email") = ds1.Tables("Login").Rows(0)("Email").ToString.Trim
                Session("idProv") = ds1.Tables("Login").Rows(0)("idProv").ToString.Trim
                Session("Localidad") = ds1.Tables("Login").Rows(0)("Localidad").ToString.Trim
                Session("Direccion") = ds1.Tables("Login").Rows(0)("Direccion").ToString.Trim
                Session("Telefonos") = ds1.Tables("Login").Rows(0)("Telefonos").ToString.Trim

                lBienvenidoAreaU.Text = "Bienvenido " & Session("ApellidoYNombre") & " , a tu Área de Usuario."
                LimpiarRegistroU()
                pLoguin.Visible = False
                pAreaUsuario.Visible = True

            Case "Administrador"
                Session("idAdministrador") = ds1.Tables("Loguin").Rows(0)("idAdminastrador")
                Session("Denominacion") = ds1.Tables("Loguin").Rows(0)("Denominacion").ToString.Trim
                Session("Usuario") = usu
                Session("Password") = pass
                Session("ApellidoYNombre") = ds1.Tables("Login").Rows(0)("Nombre").ToString.Trim & " " & ds1.Tables("Login").Rows(0)("Apellido").ToString.Trim



                lAdherente0.Text = "Bienvenido Administrador " & Session("Denominacion") & Session("ApellidoYNombre")
                pLoguin.Visible = False
                pAdministrador.Visible = True
                ' MostrarCuantosAElimianar()
                ' MostrarCuantosUsuariosHay()


        End Select

    End Sub

    Protected Sub bAhoraQueHago_Click(sender As Object, e As ImageClickEventArgs) Handles bAhoraQueHago.Click
        pAreaUsuario.Visible = False
        pAhoraQueHago.Visible = True
    End Sub

    Sub LimpiarLoguin()
        lErrorLoguin.Text = ""
        lErrorLoguin.Visible = False
        tUsuario.Text = ""
        tClave.Text = ""
        pRegistrarse.Visible = False
    End Sub

    Protected Sub bVolverLoguinU1_Click(sender As Object, e As ImageClickEventArgs) Handles bVolverLoguinU1.Click
        LimpiarLoguin()
        LimpiarRegistroU()
        lReenviarClave.Text = "" ' falta terminar
        pLoguin.Visible = True
        pAreaUsuario.Visible = False
        tUsuario.Text = Session("Usuario")
        tClave.Text = Session("Passsword")
    End Sub

    Protected Sub bVolverLoguinU2_Click(sender As Object, e As ImageClickEventArgs) Handles bVolverLoguinU2.Click
        pAhoraQueHago.Visible = False
        pAreaUsuario.Visible = True
    End Sub

    Protected Sub bModificarDatos_Click(sender As Object, e As ImageClickEventArgs) Handles bModificarDatos.Click

        pAreaUsuario.Visible = False
        CargarCampos()
        pCambiarDatosPersonalesU.Visible = True

    End Sub

    Protected Sub bGuardarDatos_Click(sender As Object, e As ImageClickEventArgs) Handles bGuardarDatos.Click

        Dim ok As Boolean = True

        LimpiarErroresRegistroU()


        ArreglarCampo(tCamEmail)
        If ValidaEmail(tCamEmail.Text) = False Then
            ok = False
            EEmailU.Text = "El Email no es válido."
            EEmailU.Visible = True
        End If

        tCamLocalidad.Text = tCamLocalidad.Text.Trim().ToUpper
        If comprobar(tCamLocalidad.Text) = False Then
            ArreglarCampo(tCamLocalidad)
            ok = False
            ELocalidadU.Text = "La Localidad contenia caracteres invalidos, fueron quitados."
            ELocalidadU.Visible = True
        End If

        tCamDireccion.Text = tCamDireccion.Text.Trim().ToUpper
        If comprobar(tCamDireccion.Text) = False Then
            ArreglarCampo(tCamDireccion)
            ok = False
            EDireccionU.Text = "La Dirección contenia cararcteres invalidos, fueron quitados."
            EDireccionU.Visible = True
        End If

        tCamTelefono.Text = tCamTelefono.Text.Trim().ToUpper
        If comprobar(tCamTelefono.Text) = False Then
            ArreglarCampo(tCamTelefono)
            ok = False
            ETelefonoU.Text = "El tléfono contenia caracteres invalidos, fueron quitados."
            ETelefonoU.Visible = True
        End If

        tCamUsuario.Text = tCamUsuario.Text.Trim().ToUpper
        If comprobar(tCamUsuario.Text) = False Or tCamUsuario.Text.IndexOf(" ") > -1 Then
            tCamUsuario.Text = tCamUsuario.Text.Replace(" ", "")
            ArreglarCampo(tCamUsuario)
            ok = False
            EUsuarioU.Text = "El Usuario contenia caracteres inválidos, fueron quitados."
            EUsuarioU.Visible = True
        End If

        If tCamUsuario.Text.Length < 5 Then
            ok = False
            EUsuarioU.Text = "El Usuario debe tener de 5 a 10 caracteres, letras y/o números."
            EUsuarioU.Visible = True
        End If

        tCamClave.Text = tCamClave.Text.Trim()
        If comprobar(tCamClave.Text) = False Or tCamClave.Text.IndexOf(" ") > -1 Then
            tCamClave.Text = tCamClave.Text.Replace(" ", "")
            ArreglarCampo(tCamClave)
            ok = False
            EClaveU.Text = "La Clave contenia caracteres inválidos. Pruebe con letras y/o números."
            EClaveU.Visible = True
        End If

        If tCamClave.Text.Length < 5 Then
            ok = False
            EClaveU.Text = "La Clave debe tener de 5 a 10 caracteres, letras y/0 números."
            EClaveU.Visible = True
        End If

        If ok = False Then
            [Error].Text = "Revise los errores por favor y luego reintente."
            [Error].Visible = True
            Exit Sub
        End If

        LimpiarErroresRegistroU()

        If SQL_Accion("update Usuarios set Email='" & tCamEmail.Text.Trim.ToUpper.Replace("'", "´") & "', idProv='" & dCamProvincia.Text.Trim.ToUpper.Replace("'", "´") & "', localidad='" & tCamLocalidad.Text.Trim.ToUpper.Replace("'", "´") & "', direccion ='" & tCamDireccion.Text.Trim.ToUpper.Replace("'", "´") & "',  telefonos='" & tCamTelefono.Text.Trim.ToUpper.Replace("'", "´") & "', usuario='" & tCamUsuario.Text.Trim.ToUpper.Replace("'", "´") & "', pass='" & tcamClave.Text.Trim.ToUpper.Replace("'", "´") & "' where idUsuario=" & Val(Session("idUsuario"))) = False Then
            [Error].Text = "Se a producido un error al querer modificar tus datos..."
            [Error].Visible = True
            Exit Sub
        End If

        LimpiarErroresRegistroU()

        pCambiarDatosPersonalesU.Visible = False
        pDatosModificados.Visible = True
        bCancelarVolverCAm.Focus()


    End Sub

    Sub CargarCampos()

        Dim da As New SqlDataAdapter("SELECT  upper (ltrim(rtrim(isnull(Email,'')))) as email, (ltrim(rtrim(isnull(idprov,'')))) as provincia, (ltrim(rtrim(isnull(localidad,'')))) as localidad, (ltrim(rtrim(isnull(direccion,'')))) as dirección, (ltrim(rtrim(isnull(telefonos,'')))) as telefono, (ltrim(rtrim(isnull(usuario,'')))) as usuario, (ltrim(rtrim(isnull(pass,'')))) as clave from Usuarios where idUsuario= " & Val(Session("idUsuario")), con)
        Dim ds As New DataSet
        da.Fill(ds, "Usuarios")

        tCamEmail.Text = ds.Tables("Usuarios").Rows(0)("email")
        dCamProvincia.Text = ds.Tables("Usuarios").Rows(0)("provincia")
        tCamLocalidad.Text = ds.Tables("Usuarios").Rows(0)("localidad")
        tCamDireccion.Text = ds.Tables("Usuarios").Rows(0)("Dirección")
        tCamTelefono.Text = ds.Tables("Usuarios").Rows(0)("telefono")
        tCamUsuario.Text = ds.Tables("Usuarios").Rows(0)("usuario")
        tCamClave.Text = ds.Tables("Usuarios").Rows(0)("clave")

    End Sub

    Protected Sub bCancelarVolverCAm_Click(sender As Object, e As ImageClickEventArgs) Handles bCancelarVolverCAm.Click
        pCambiarDatosPersonalesU.Visible = False
        pAreaUsuario.Visible = True

    End Sub

    Protected Sub bVolverAreaUsuario_Click(sender As Object, e As ImageClickEventArgs) Handles bVolverAreaUsuario.Click
        pDatosModificados.Visible = False
        pAreaUsuario.Visible = True
    End Sub

    Protected Sub gDatos_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gDatos.SelectedIndexChanged

    End Sub
End Class