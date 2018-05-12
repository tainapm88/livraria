<%@page import="util.StormData"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Livro"%>
<%@page import="dao.LivroDAO"%>
<%@include file="../cabecalho.jsp" %>

<% 
    
    LivroDAO dao = new LivroDAO();
    List<Livro> lista;
    
    if (request.getParameter("txtFiltro") != null) {
        lista = dao.listar(request.getParameter("txtFiltro"));
        
    } else{ 
   
    //verifico se � excluir
    if(request.getParameter("codigo") != null){
            Livro obj = dao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));
            if(obj != null){
                dao.excluir(obj);
            }
        }
        
        lista = dao.listar();
    }
    
    

%>

<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">
            Gerenciamento de Livros

        </h1>
        <ol class="breadcrumb">
            <li>
                <i class="fa fa-dashboard"></i>  <a href="index.jsp">Listagem</a>
            </li>
            <li class="active">
                <i class="fa fa-file"></i> listagem de registros
            </li>
        </ol>
    </div>
</div>
<!-- /.row -->
<div class="row">
    <div class="panel panel-default">

        <div class="panel-body">

            <a  href="add.jsp" class="btn  btn-primary btn-sm fa fa-plus-square-o" >Novo</a>
            
        </div>
    </div>
</div>
<!-- /.row -->
<div class="row">
    <div class="panel panel-default">
        <form action="#" method="post">
            <div class="form-group input-group">
                <input type="text" class="form-control" name="txtFiltro" placeholder="digite...">
                                <span class="input-group-btn"><button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button></span>
                            </div>
        </form>
        <div class="panel-body">
           
        
        <div class="table-responsive">
            <table class="table table-bordered table-hover">
                <thead>
                    <tr>
                        <th >Id</th>
                        <th>Nome</th>
                        <th >Pre�o</th>
                        <th >Editora</th>
                        <th >Data de Publica��o</th>
                        <th >Categoria</th>
                        <th >Sinopse</th>
                        <th >Foto</th>
                        <th >Foto 2</th>
                        <th >Foto 3</th>
                    </tr>
                </thead>
                <tbody>
                    <%for(Livro item: lista)
                    {
                    %>
                    <tr>
                        <td><%=item.getId()%></td>
                        <td><%=item.getNome() %></td>
                        <td><%=item.getPreco()%></td>
                        <td><%=item.getEditora().getNome()%></td>
                        <td><%=StormData.formata(item.getDatapublicacao())%></td>
                        <td><%=item.getCategoria().getNome()%></td>
                        <td><%=item.getSinopse()%></td>
                        <td><img src = "../arquivos/<%=item.getImagem1()%>" width="100" height = "80" /></td>
                        <td><img src = "../arquivos/<%=item.getImagem2()%>" width="100" height = "80" /></td>
                        <td><img src = "../arquivos/<%=item.getImagem3()%>" width="100" height = "80" /></td>
                        <td><a href="upd.jsp?Id=<%=item.getId()%>" class="btn  btn-primary btn-sm">Alterar</a>
                            <button class="btn  btn-danger btn-sm" data-toggle="modal" data-target="#myModal" onclick="codigo=<%=item.getId()%>">Excluir</button>  
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
           
                <!-- /.table-responsive -->
            </div>

        </div>
        <!-- /.panel-body -->
    </div>
    <!-- /.panel -->
        </div>
                
                
    <%@include file="../modalExcluir.jsp" %>
    <%@include file="../rodape.jsp" %>