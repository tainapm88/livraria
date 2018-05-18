

<%@page import="util.StormData"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Livro"%>
<%@page import="dao.LivroDAO"%>
<%@page import="dao.EditoraDAO"%>
<%@page import="dao.AutorDAO"%>
<%@page import="modelo.Editora"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Autor"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="modelo.Categoria"%>
<%@page import="dao.CategoriaDAO"%>
<%@include file="../cabecalho.jsp" %>
<%
    String msg = "";
    String classe = "";
    /*LivroDAO dao = new LivroDAO();
    CategoriaDAO cdao = new CategoriaDAO();
    AutorDAO adao = new AutorDAO();
    EditoraDAO edao = new EditoraDAO();
    
    
    Livro obj = new Livro();*/
    
    Livro obj = new  Livro();
     LivroDAO dao = new  LivroDAO();
  
     CategoriaDAO cdao = new CategoriaDAO();
     List<Categoria> clistar = cdao.listar();
     Categoria c = new Categoria();
     
     EditoraDAO edao = new EditoraDAO();
     List<Editora> elistar = edao.listar();
     Editora e = new Editora();
     
     AutorDAO adao = new AutorDAO();
     List<Autor> alistar = adao.listar();

    
    //verifica se é postm ou seja, quer alterar
    if (request.getMethod().equals("POST")) {
      String[] autoresid = request.getParameter("autoreschk").split(";");
        //popular o livro
        if (request.getParameter("txtNome") != null &&
                request.getParameter("txtPreco") != null && 
                request.getParameter("txtData") != null && request.getParameter("txtCategoria") != null &&
                request.getParameter("txtEditora") != null) 
        {
            obj.setNome(request.getParameter("txtNome"));
            obj.setPreco(Double.parseDouble(request.getParameter("txtPreco")));
            obj.setDatapublicacao(StormData.formata(request.getParameter("txtData")));
            obj.setSinopse(request.getParameter("txtSinopse"));
            c.setId(Integer.parseInt(request.getParameter("txtCategoria")));
            e.setCnpj(request.getParameter("txtEditora"));
            obj.setCategoria(c);
            obj.setEditora(e);
            obj.setImagem1(request.getParameter("txtFoto"));
            obj.setImagem2(request.getParameter("txtFoto2"));
            obj.setImagem3(request.getParameter("txtFoto3"));
            
            List<Autor> listaautores = new ArrayList<>();
            for (String id : autoresid) {
                Integer idinteger = Integer.parseInt(id);
                listaautores.add(adao.buscarPorChavePrimaria(idinteger));
            }
            obj.setAutorList(listaautores);
            Boolean resultado = dao.alterar(obj);
            if (resultado) {
                msg = "Registro cadastrado com sucesso";
                classe = "alert-success";
            } else {
                msg = "Não foi possível cadastrar";
                classe = "alert-danger";
            }
        }

    } else {
        //e GET
        if (request.getParameter("Id") == null) {
            response.sendRedirect("index.jsp");
            return;
        }

        
        obj = dao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("Id")));

        if (obj == null) {
            response.sendRedirect("index.jsp");
            return;
        }
    }

    List<Autor> autores = adao.listar();
    List<Editora> editoras = edao.listar();
    List<Categoria> categorias = cdao.listar();
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
            Livro
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
                        <input class="form-control" type="text"  name="txtNome"  required />
                    </div>

                    <div class="form-group">
                        <label>Preço</label>
                        <input class="form-control" type="text"  name="txtPreco"  required />
                    </div>
                    <div class="form-group">
                        <label>Sinopse</label>
                        
                        <TextArea name="txtSinopse"></TextArea>
                        </textarea>
                    </div>

                    <div class="form-group">
                        <label>Data Publicação</label>
                        <input class="form-control" type="text"  name="txtData"  required />
                    </div>

                    <div class="form-group">
                        <label>Categoria</label>
                        <select name="txtCategoria" class="form-control">
                            <option>Selecione</option>
                        <%
                         String selecionado;
                         for(Categoria c1:categorias){
                             
                            if(obj.getCategoria().getId()==c1.getId()){
                                selecionado="selected";
                            }
                            else{
                                selecionado="";
                            }
                        %>
                        <option value="<%=c1.getId()%>" <%=selecionado%>>
                            
                            
                        <%=c1.getNome()%>
                        </option>
                        <%}%>
                        </select>
                    </div>

                    <div class="form-group">
                        <label>Editora</label>
                        <select name="txtEditora" class="form-control">
                            <option>Selecione</option>
                        <%
                       
                         for(Editora e1:editoras){
                             
                            if(obj.getEditora().getCnpj()==e1.getCnpj()){
                                selecionado="selected";
                            }
                            else{
                                selecionado="";
                            }
                        %>
                        <option value="<%=e1.getCnpj()%>" <%=selecionado%>>
                            
                            
                        <%=e1.getNome()%>
                        </option>
                        <%}%>
                        </select>
                    </div>

                   <div class="form-group">
                        <label>Image1</label>
                        <input class="form-control" type="file" name="txtFoto" id="arquivo1"  accept="image/*" />
                        <input type="hidden" name="txtFotoVelha"
                               value="<%=obj.getImagem1()%>" />
                        <td><img src="../arquivos/<%=obj.getImagem1()%>" id="img1" width="100" height="80"/></td>
                        
                    </div>

                    <div class="form-group">
                        <label>Imagem 2</label>
                        <input class="form-control" type="file" name="txtFoto2" id="arquivo2"  accept="image/*" />
                        <input type="hidden" name="txtFotoVelha"
                               value="<%=obj.getImagem2()%>" />
                        <td><img src="../arquivos/<%=obj.getImagem2()%>" id="img2" width="100" height="80"/></td>
                    </div>

                    <div class="form-group">
                        <label>Imagem 3</label>
                        <input class="form-control" type="file" name="txtFoto3" id="arquivo3"  accept="image/*" />
                        <input type="hidden" name="txtFotoVelha"
                               value="<%=obj.getImagem3()%>" />
                        <td><img src="../arquivos/<%=obj.getImagem3()%>" id="img3" width="100" height="80"/></td>
                    </div>

                    
                     
                    
                    
                    <div class="form-group">
                        <label>Autores</label>

                        <%for (Autor a : autores) {
                            //verifica se o autor está na lista de autores do livro
                            if(obj.getAutorList().contains(a)){
                                selecionado = "checked";
                            }
                            else{
                                selecionado="";
                            }
                        
                        %>
                        <input type="checkbox" name="autoreschk" <%=selecionado%> value="<%=a.getId()%>"><%=a.getNome()%>

                        <%}%>
                    </div>

                    <button class="btn btn-primary btn-sm" type="submit">Salvar</button>
                
                </div>
            </form>>

    </div>
</div>
<!-- /.row -->
    <%@include file="../rodape.jsp" %>
    
    <script>
    function readURL(input,destino) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            
            reader.onload = function (e) {
                $('#'+destino).attr('src', e.target.result);
            }
            
            reader.readAsDataURL(input.files[0]);
        }
    }
    
    $("#arquivo1").change(function(){
        readURL(this,"img1");
    });
</script>