
<%@page import="dao.LivroDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Autor"%>
<%@page import="java.util.Date"%>
<%@page import="modelo.Livro"%>
<%@page import="modelo.Autor"%>
<%@page import="dao.AutorDAO"%>
<%@page import="java.math.BigDecimal"%>

<%@page import="java.util.List"%>

<%@include file="../cabecalho.jsp" %>
<%
    String msg = "";
    String classe = "";
    AutorDAO adao = new AutorDAO();
    if(request.getMethod().equals("POST")){
        //pego uma lista de autores(com mesmo name)
        String[] autoresid = request.getParameterValues("autores");
        //popular o livro
        Livro l = new Livro();
        l.setNome("StorTroopers - Uma viagem que nao sai");
        l.setDatapublicacao(new Date());
        l.setPreco(13.12f);
        //Autores
        List<Autor> listaautores = new ArrayList<>();
        for (String id : autoresid) {
            Integer idinteger = Integer.parseInt(id);
            listaautores.add(adao.buscarPorChavePrimaria(idinteger));
         }
        l.setAutorList(listaautores);
        
        LivroDAO dao = new LivroDAO();
        dao.incluir(l);
        
        
    }
    
    

    //pego meus autores
    
    List<Autor> autores = adao.listar();

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
            Categorias
        </div>
        <div class="panel-body">

            <div class="alert <%=classe%>">
                <%=msg%>
            </div>
            <form action="#" method="post">

                <div class="col-lg-6">

                    <div class="form-group">
                        <label>Autores</label>
                        <select name="autores" multiple>
                            <%for(Autor a:autores){%>
                            <option value="<%=a.getId()%>"><%=a.getNome()%>
                            </option>
                            <%}%>
                        </select>
                     </div>
                        
                        <div class="form-group">
                        <label>Autores com checkbox</label>
                       
                            <%for(Autor a:autores){%>
                            <input type="checkbox" name="autoreschk" value="<%=a.getId()%>"><%=a.getNome()%>
                           
                            <%}%>
                        </select>
                     </div>

                    <button class="btn btn-primary btn-sm" type="submit">Salvar</button>

            </form>

        </div>


    </div>
</div>
<!-- 1/.row -->
<%@include file="../rodape.jsp" %>