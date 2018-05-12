
<%@page import="java.math.BigDecimal"%>
<%@page import="dao.EditoraDAO"%>
<%@page import="modelo.Editora"%>
<%@page import="java.util.List"%>

<%@include file="../cabecalho.jsp" %>
<%
    String msg = "";
    String classe = "";
    Editora obj = new Editora();
    EditoraDAO dao = new EditoraDAO();
    
    if (request.getParameter("txtNome") != null) {
        obj.setNome(request.getParameter("txtNome"));
        obj.setCnpj(request.getParameter("txtCNPJ"));
        obj.setLogo(request.getParameter("txtLogo"));
        

        Boolean resultado = dao.incluir(obj);
        dao.fecharConexao();
        if (resultado) {
            msg = "Registro cadastrado com sucesso";
            classe = "alert-success";
        } else {
            msg = "N�o foi poss�vel cadastrar";
            classe = "alert-danger";
        }
    } 
    

%>
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">
            Sistema de Com�rcio Eletr�nico
            <small>Admin</small>
        </h1>
        <ol class="breadcrumb">
            <li>
                <i class="fa fa-dashboard"></i>  <a href="index.jsp">�rea Administrativa</a>
            </li>
            <li class="active">
                <i class="fa fa-file"></i> Aqui vai o conte�do de apresenta��o 
            </li>
        </ol>
    </div>
</div>
<!-- /.row -->
<div class="row">
    <div class="panel panel-default">
        <div class="panel-heading">
            Editoras
        </div>
        <div class="panel-body">

            <div class="alert <%=classe%>">
                <%=msg%>
            </div>
            <form action="../UploadWS" method="post" enctype="multipart/form-data">

                <div class="col-lg-6">

                    <div class="form-group">
                        <label>Nome</label>
                        <input class="form-control" type="text"  name="txtNome"  required />
                    </div>
                    
                    <div class="form-group">
                        <label>CNPJ</label>
                        <input class="form-control" type="text"  name="txtCNPJ"  required />
                    </div>
                    
                    <div class="form-group">
                        <label>Foto</label>
                        <input type="file" name="txtLogo" required value="<%=obj.getLogo() %>" />
                    </div>
                   
                    <button class="btn btn-primary btn-sm" type="submit">Salvar</button>

            </form>

        </div>


    </div>
</div>
<!-- 1/.row -->
<%@include file="../rodape.jsp" %>