<%@page import="modelo.Livro"%>
<%@page import="dao.LivroDAO"%>
<%@page import="modelo.Categoria"%>
<%@page import="java.util.List"%>
<%@page import="dao.CategoriaDAO"%>
<!DOCTYPE html>
<html lang="en">
    
    <%
    CategoriaDAO daoc1 = new CategoriaDAO();
    List<Categoria> lista1 = daoc1.listar();
    
    
    LivroDAO daol = new LivroDAO();
    List<Livro> listal = daol.listar();
    daoc1.fecharConexao();
    %>

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title  -->
    <title>Karl - Fashion Ecommerce Template | Home</title>

    <!-- Favicon  -->
    <link rel="icon" href="img/core-img/favicon.ico">

    <!-- Core Style CSS -->
    <link rel="stylesheet" href="css/core-style.css">
    <link rel="stylesheet" href="style.css">

    <!-- Responsive CSS -->
    <link href="css/responsive.css" rel="stylesheet">

</head>

<body>
    <div class="catagories-side-menu">
        <!-- Close Icon -->
        <div id="sideMenuClose">
            <i class="ti-close"></i>
        </div>
        <!--  Side Nav  -->
        <div class="nav-side-menu">
            <div class="menu-list">
                <h6>Categorias</h6>
                <ul id="menu-content" class="menu-content collapse out">
                    <!-- Single Item -->
                       <%
                    for(Categoria item : lista1){
                        
                    
                    %>
                    <li data-toggle="collapse" data-target="#<%=item.getNome()%>" class="collapsed ">
                        <a href="#"><%=item.getNome()%> <span class="arrow"></span></a>
                        <ul class="sub-menu collapse" id="<%=item.getNome()%>">
                             
                                 <%
                    for(Livro l : item.getLivroList()){
                        
                    
                    %>
                            <li><a href="#"><%=l.getNome()%></a></li>
                            
                            <%} %>
                          
                        </ul>
                    </li>
                  
                         <%} %>
                     






                </ul>
            </div>
        </div>
    </div>
<div id="wrapper">

        <!-- ****** Header Area Start ****** -->
        <header class="header_area">
            <!-- Top Header Area Start -->
            <div class="top_header_area">
                <div class="container h-100">
                    <div class="row h-100 align-items-center justify-content-end">

                        <div class="col-12 col-lg-7">
                            <div class="top_single_area d-flex align-items-center">
                                <!-- Logo Area -->
                                <div class="top_logo">
                                    <a href="#"><img src="img/core-img/logo.png" alt=""></a>
                                </div>
                                <!-- Cart & Menu Area -->
                                <div class="header-cart-menu d-flex align-items-center ml-auto">
                                    <!-- Cart Area -->
                                    <div class="cart">
                                        <a href="#" id="header-cart-btn" target="_blank"><span class="cart_quantity">2</span> <i class="ti-bag"></i> Carrinho</a>
                                        <!-- Cart List Area Start -->
                                        <ul class="cart-list">
                                            <li>
                                                <a href="#" class="image"><img src="img/product-img/product-10.jpg" class="cart-thumb" alt=""></a>
                                                <div class="cart-item-desc">
                                                    <h6><a href="#">Women's Fashion</a></h6>
                                                    <p>1x - <span class="price">$10</span></p>
                                                </div>
                                                <span class="dropdown-product-remove"><i class="icon-cross"></i></span>
                                            </li>
                                            <li>
                                                <a href="#" class="image"><img src="img/product-img/product-11.jpg" class="cart-thumb" alt=""></a>
                                                <div class="cart-item-desc">
                                                    <h6><a href="#">Women's Fashion</a></h6>
                                                    <p>1x - <span class="price">$10</span></p>
                                                </div>
                                                <span class="dropdown-product-remove"><i class="icon-cross"></i></span>
                                            </li>
                                            <li class="total">
                                                <span class="pull-right">Total: $20.00</span>
                                                <a href="carrinho.jsp" class="btn btn-sm btn-cart">Cart</a>
                                                <a href="checkout-1.html" class="btn btn-sm btn-checkout">Checkout</a>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="header-right-side-menu ml-15">
                                        <a href="#" id="sideMenuBtn"><i class="ti-menu" aria-hidden="true"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <!-- Top Header Area End -->
            <div class="main_header_area">
                <div class="container h-100">
                    <div class="row h-100">
                        <div class="col-12 d-md-flex justify-content-between">
                           
                            <!-- Menu Area -->
                            <div class="main-menu-area">
                                <nav class="navbar navbar-expand-lg align-items-start">

                                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#karl-navbar" aria-controls="karl-navbar" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"><i class="ti-menu"></i></span></button>

                                    <div class="collapse navbar-collapse align-items-start collapse" id="karl-navbar">
                                        <ul class="navbar-nav animated" id="nav">
                                            <li class="nav-item active"><a class="nav-link" href="index.jsp">Home</a></li>
                                            <li class="nav-item dropdown">
                                                <a class="nav-link dropdown-toggle" href="#" id="karlDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Livros</a>
                                                <div class="dropdown-menu" aria-labelledby="karlDropdown">
                                                    <a class="dropdown-item" href="index.html">Lançamentos</a>
                                                    <a class="dropdown-item" href="cart.html">Mais Vendidos</a>
                                                    <a class="dropdown-item" href="produtodetalhe.jsp">Todos</a>
                                                    
                                                    
                                                </div>
                                            </li>
                                            <li class="nav-item"><a class="nav-link" href="#"><span class="karl-level">hot</span> Autor</a></li>
                                            <li class="nav-item"><a class="nav-link" href="#">Editora</a></li>
                                        </ul>
                                    </div>
                                </nav>
