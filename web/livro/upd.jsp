
<%@page import="modelo.Editora"%>
<%@page import="dao.EditoraDAO"%>
<%@page import="modelo.Categoria"%>
<%@page import="java.util.List"%>
<%@page import="dao.CategoriaDAO"%>
<%@page import="dao.LivroDAO"%>
<%@page import="modelo.Livro"%>
<%@page import="util.StormData"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="modelo.Autor"%>
<%@page import="dao.AutorDAO"%>
<%@include file="../cabecalho.jsp" %>
<%
String msg ="";
String classe = "";
    
    AutorDAO daoa = new AutorDAO();
    Autor obja = new Autor();
    
     Livro obj = new  Livro();
     LivroDAO dao = new  LivroDAO();
  
     CategoriaDAO cdao = new CategoriaDAO();
     List<Categoria> clistar = cdao.listar();
     Categoria c = new Categoria();
     
     EditoraDAO edao = new EditoraDAO();
     List<Editora> elistar = edao.listar();
     Editora e = new Editora();
    //verifica se é postm ou seja, quer alterar
    if(request.getMethod().equals("POST")){
        
        //popular com oq ele digitou no form
        obj.setId(Integer.parseInt(request.getParameter("txtCodigo")));
        obj.setNome(request.getParameter("txtNome"));
        obj.setDatapublicacao(StormData.formata(request.getParameter("txtData")));
        obj.setPreco(Double.parseDouble(request.getParameter("txtPreco")));
        obj.setSinopse(request.getParameter("txtSinopse"));
        c.setId(Integer.parseInt(request.getParameter("txtCategoria")));
        e.setCnpj(request.getParameter("txtEditora"));
            obj.setCategoria(c);
            obj.setEditora(e);
            obj.setImagem1(request.getParameter("txtFoto"));
            obj.setImagem2(request.getParameter("txtFoto2"));
            obj.setImagem3(request.getParameter("txtFoto3"));
        
        
        Boolean resultado = dao.alterar(obj);
        
        if(resultado){
            msg = "Registro alterado com sucesso";
            classe = "alert-success";
        }
        else{
            msg = "Não foi possível alterar";
            classe = "alert-danger";
        }
        
    }else{
        //e GET
        if(request.getParameter("codigo") == null){
            response.sendRedirect("index.jsp");
            return;
        }
        
        
        obj = dao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));
        
        if(obj == null){
            response.sendRedirect("index.jsp");
            return;
        } 
    }
%>
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">
            Sistema de Comércio Eletrônico
            <small>Admin</small>
        </h1>
        <ol class="breadcrumb">
            <li>
                <i class="fa fa-dashboard"></i>  <a href="index.jsp">Área Administrativa</a>
            </li>
            <li class="active">
                <i class="fa fa-file"></i> Aqui vai o conteúdo de apresentação
            </li>
        </ol>
    </div>
</div>
<!-- /.row -->
<div class="row">
    <div class="panel panel-default">
        <div class="panel-heading">
            Autor
        </div>
        <div class="panel-body">

            <div class="alert <%=classe%>">
                <%=msg%>
            </div>
           <form action="../UploadWS" method="post" enctype="multipart/form-data">
                
                <div class="col-lg-6">

                    <div class="form-group">
                        <label>Código</label>
                        <input class="form-control" type="text" name="txtCodigo" readonly value="<%=obj.getId()%>"/>
                    </div>
                    
                    <div class="form-group">
                        <label>Nome</label>
                        <input class="form-control" type="text" name="txtNome" required value="<%=obj.getNome() %>" />
                    </div>
                   
                    <div class="form-group">
                        <label>Preço</label>
                        <input class="form-control" type="text" name="txtPreco" required value="<%=obj.getPreco() %>" />
                    </div>
                    
                    <div class="form-group">
                        <label>Data de publicação</label>
                        <input class="form-control" type="text" name="txtData" required value="<%=obj.getDatapublicacao() %>" />
                    </div>
                    
                    <div class="form-group">
                        <label>Sinopse</label>
                        <input class="form-control" type="text" name="txtSinopse" required value="<%=obj.getSinopse() %>" />
                    </div>
                    
                    <div class="form-group">
                        <label>Foto</label>
                        <input type="file" name="txtFoto" required value="<%=obj.getImagem1() %>" />
                    </div>
                    
                    <div class="form-group">
                        <label>Foto 2</label>
                        <input type="file" name="txtFoto2" required value="<%=obj.getImagem2() %>" />
                    </div>
                    
                    <div class="form-group">
                        <label>Foto 3</label>
                        <input type="file" name="txtFoto2" required value="<%=obj.getImagem3() %>" />
                    </div>
                <button class="btn btn-primary btn-sm" type="submit">Salvar</button>
                
            </form>

        </div>


    </div>
</div>
<!-- /.row -->
<%@include file="../rodape.jsp" %>