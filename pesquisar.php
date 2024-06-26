<?php
include('php/conexao.php');
require('php/connection.php');
include('php/protect.php');
include('php/protectSearch.php');
include('php/protectPesquisar.php');
include('php/loadItem.php');

if (isset($_POST['sub'])) {
    foreach ($_SESSION['dados'] as $produtos) {
        $insert = $pdo->prepare("
        INSERT INTO tblPedido (idCliente,idItem,idVendedor) VALUES (?,?,?)");
        $insert->bindParam(1, $produtos['idCliente']);
        $insert->bindParam(2, $produtos['idItem']);
        $insert->bindParam(3, $produtos['idVendedor']);
        $insert->execute();
        $bol = true;
    }
    header("Location: carrinho.php");
}

$_SESSION['dados'] = array();
$idCliente = $_SESSION['idCliente'];

$consulta = "SELECT * FROM tblProduto WHERE statusProduto <> 0  ORDER BY RAND() LIMIT 8";

$con = $pdo->query($consulta) or die($mysqli->error);
$conn = $mysqli->query($consulta) or die($mysqli->error);

$consulta2 = "SELECT * from tblItem as i inner join tblProduto as p on i.idProduto = p.idProduto
    inner join tblVendedor as v on p.idVendedor = v.idVendedor where idCliente = $idCliente and statusItem <> 0";

$con2 = $pdo->query($consulta2) or die($mysqli->error);
$conn2 = $mysqli->query($consulta2) or die($mysqli->error);

$consulta3 = "SELECT * FROM tblProduto WHERE statusProduto <> 0 ORDER BY RAND() LIMIT 8";

$con3 = $pdo->query($consulta3) or die($mysqli->error);
$conn3 = $mysqli->query($consulta3) or die($mysqli->error);

$soma = "SELECT SUM(p.preco*i.qtde) AS total FROM tblProduto as p inner join tblItem as i on p.idProduto = i.idProduto where statusItem <> 0 and idCliente = $idCliente";
$s = $mysqli->query($soma) or die($mysqli->error);

$sql = $pdo->query("SELECT * from tblItem as i inner join tblProduto as p on i.idProduto = p.idProduto
     inner join tblVendedor as v on p.idVendedor = v.idVendedor where idCliente = $idCliente and statusItem <> 0;");
if ($sql->rowCount() > 0) {
    foreach ($sql->fetchAll() as $value) {
        array_push(
            $_SESSION['dados'],
            array(
                'idCliente' =>  $value['idCliente'],
                'idItem' =>  $value['idItem'],
                'idVendedor' =>  $value2['idVendedor'],
                'qtde' => $value['qtde'],
                'preco' => $value['preco'],
                'nomeProd' => $value['nomeProd']
            )
        );
    }
}

if (!empty($_GET['search'])) {
    $data = $_GET['search'];

    $sqlVend = "SELECT * from tblVendedor WHERE nomeVend LIKE '%$data%' ORDER BY RAND() LIMIT 8";
    $sv = $pdo->query($sqlVend) or die($mysqli->error);
    $svv = $mysqli->query($sqlVend) or die($mysqli->error);

    $sqlProd = "SELECT * from tblProduto WHERE nomeProd LIKE '%$data%' and statusProduto <> 0  ORDER BY RAND() LIMIT 8";
    $sp = $pdo->query($sqlProd) or die($mysqli->error);
    $spp = $mysqli->query($sqlProd) or die($mysqli->error);
}

?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="assets/img/icon.ico">
    <!--<link rel="icon" type="imagem/png" href="assets/img/leafg (1).png">-->
    <!--=============== BOXICONS ===============-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">

    <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />

    <!--=============== CSS ===============-->
    <link rel="stylesheet" href="assets/css/stylesPqq.css">

    <!-- font awesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <!--==================== UNICONS ====================-->
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">

    <!--==================== GOOGLE ICONS ====================-->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    <title>Nattus</title>
</head>

<body>
    <!--=============== HEADER ===============-->
    <header class="header" id="header" style="box-shadow: 0 0 4px rgba(0, 0, 0, 0.1);">
        <nav class="nav nav__container">

            <nav class="navbar naves">
                <a href="initial.php">Home</a>
                <a href="#packages">Produtores</a>
                <a href="fruta.php">Frutas</a>
                <a href="#pricing">Vegetais</a>
                <a href="#review">Especiarias</a>
            </nav>

            <a href="initial.html" class="nav__logo first"> <i class="fa fa-leaf"></i>Nattus</a>

            <div class="nav__menu" id="nav-menu">
                <ul class="nav__list__initial">
                    <div></div>
                    <form action="" class="search-form">
                        <input id="enter" type="search" placeholder="busque por produtor ou item..." id="search-box" style=" border: none;">
                        <button onclick="searchData()">
                            <label for="search-box" class="fas fa-search"></label></button>
                    </form>

                    <div class="nav__icon">

                        <div class="fas fa-search" id="search-btn" style="display: none"></div>

                        <li class="nav__item">
                            <div id="cart-btn" id="carts" class="uil uil-shopping-bag nav__link"></div>
                        </li>

                        <li class="nav__item">
                            <a href="perfilCliente.php" class="fas fa-user nav__link"></a>
                        </li>

                        <li class="nav__item">
                            <a href="php/logout.php" class="uil uil-signout nav__link" style="font-size: 1.2rem !important"></a>
                        </li>
                        
                    </div>
                </ul>
            </div>

            <div class="nav__toggle" id="nav-toggle">
                <i class='bx bx-grid-alt'></i>
            </div>
        </nav>



        <div class="shopping-cart cartes">
            <?php if ($con2->rowCount() > 0) { ?>
                <form action="#" method="POST" enctype="multipart/form-data">
                    <div class="box__maior" style=" overflow-y: scroll;height: 18rem;">
                        <?php while ($dado2 = $conn2->fetch_array()) {   ?>
                            <div class="box">
                                <a href="remover.php?idItem=<?php echo $dado2["idItem"]; ?>"><i class="fas fa-times"></i></a>
                                <img src="upload/<?php echo $dado2["foto"]; ?>" alt="">
                                <div class="content">
                                    <h3><?php echo $dado2["nomeProd"]; ?></h3>
                                    <span class="quantity"><?php echo $dado2["qtde"]; ?></span>
                                    <span class="multiply">x</span>
                                    <span class="price">R$ <?php echo number_format($dado2["preco"], 2, ",", "."); ?></span>
                                </div>
                            </div>
                        <?php } ?>
                    </div>
                    <h3 class="total"> Total : <?php while ($dado = $s->fetch_array()) {
                                                    echo number_format($dado['total'], 2, ",", "."); ?></h3> <?php } ?> </h3>
                <input class="btn" type="submit" name="sub" value="Finalizar Compra">

        </div>
    <?php } else { ?>
        <div class="box">
            <img src="assets/img/carrinho-vazio.svg" alt="" class="carrinho__img">
        </div>
        <h3 class="total2"> Seu carrinho está vazio. Clique no botão abaixo para começar a comprar. </h3>
        <a href="initial.php" class="btn">Começar a comprar</a>
    <?php } ?>
    </form>
    </header>

    <main class="main initial__home">

        <!--=============== HOME ===============-->
        <section class="home produtos1 section-p1" id="home">
            <div id="linha-vertical"></div>
            <h1 class="home__title">Buscando por <span style="color: #70C38D; cursor:initial;"><?php echo $data ?></span></h1>

            <div class="caixa__grande">
                <div class="esquerda">
                    <div class="title__prod">
                        <h2>Produtos</h2>
                        <p>Produtos com as melhores qualificações</p>
                    </div>

                    <div class="prod__container">
                        <?php if ($sp->rowCount() > 0) {
                            while ($dadoP = $spp->fetch_array()) {
                                $idProduto = $dadoP["idProduto"];
                                $consultaVend = "SELECT nomeVend as nomeVend FROM tblVendedor as v inner join tblProduto as p on v.idVendedor = p.idVendedor where idProduto = $idProduto";

                                $connVend = $mysqli->query($consultaVend) or die($mysqli->error); ?>
                                <div class="prod">
                                    <img src="upload/<?php echo $dadoP['foto']; ?>" alt="">
                                    <div class="des">
                                        <span>Produtor: <?php while ($dado2 = $connVend->fetch_array()) {
                                                            echo $dado2['nomeVend']; ?> </span><?php } ?>
                                    <h5><?php echo $dadoP['nomeProd']; ?></h2>
                                    
                                        <h4>R$ <?php echo $dadoP['preco']; ?></h4>
                                    </div>
                                    <a href="sproduto.php?idProduto=<?php echo $dadoP["idProduto"]; ?>"><i class="fas fa-shopping-cart"></i></a>
                                </div>
                            <?php }
                        } else {
                            ?>
                            <div class="sem-prod">
                                <img src="assets/img/7966492.jpg" alt="" style="width: 15rem;">
                                <h1>Nenhum produto encontrado com sua pesquisa.</h1>
                                <p>Tente procurar por outro semelhante ou aguarde que nossos produtores com certeza vão conseguir trazer seu produto tão desejado.</p>
                            </div>
                        <?php
                        } ?>
                    </div>
                </div>

                <div class="direita">
                    <div class="title__prod">
                        <h2>Produtores</h2>
                        <p>Produtores que vendem esses produtos</p>
                    </div>


                    <div class="prod__container">
                        <?php if ($sv->rowCount() > 0) {
                            while ($dadoV = $svv->fetch_array()) { ?>
                                <div class="prod">
                                    <img src="upload/<?php echo $dadoV['imagemVend']; ?>" alt="">
                                    <div class="des">
                                        <h5><?php echo $dadoV['nomeVend']; ?></h2>
                                            <h4>Visitar Perfil</h4>
                                    </div>
                                    <a href="sVendedor.php?idVendedor=<?php echo $dadoV["idVendedor"]; ?>"><i class="uil uil-chat"></i></a>
                                </div>
                            <?php }
                        } else {
                            ?>
                             <div class="sem-prod">
                                <img src="assets/img/sem-prod - cor.svg" alt="" style="width: 15rem;">
                                <h1>Nenhum vendedor encontrado com sua pesquisa.</h1>
                                <p>Verifique se o nome foi digitado corretamente e tente de novo, o produtor está te esperando.</p>
                            </div>
                        <?php
                        } ?>
                    </div>
                </div>
            </div>
        </section>
        </main>



    <div class="alinhar">
        <div id="linha-horizontal"></div>
    </div>

    <!--=============== FOOTER ===============-->
    <footer class="section-p1">
        <div class="col">
            <a href="index.html" class="nav__logo logo"> <i class="fa fa-leaf" style="color: #70C28D;"></i> Radix </a>
            <h4>Contato</h4>
            <p><strong>Endereço:</strong> Rua Beco do Batman</p>
            <p><strong>Telefone:</strong> +55 (13) 99128-8937</p>
            <p><strong>CNPJ</strong> 25.672.446 / 0001-50</p>
            <div class="follow">
                <h4>Nos siga</h4>
                <div class="icon">
                    <i class="fab fa-facebook-f"></i>
                    <i class="fab fa-twitter"></i>
                    <i class="fab fa-instagram"></i>
                    <i class="fab fa-pinterest-p"></i>
                    <i class="fab fa-youtube"></i>
                </div>
            </div>
        </div>

        <div class="col">
            <h4>Sobre</h4>
            <a href="#">Sobre nós</a>
            <a href="#">Informações sobre entrega</a>
            <a href="#">Política de privacidade</a>
        </div>

        <div class="col">
            <h4>Minha Conta</h4>
            <a href="#">Fazer Login</a>
            <a href="#">Carrinho</a>
            <a href="#">Ajuda</a>
        </div>

        <div class="col install">
            <h4>Baixar App</h4>
            <p>Baixar da App Store ou Google Play</p>
            <div class="row">
                <img src="assets/img/pay/app.jpg" alt="">
                <img src="assets/img/pay/play.jpg" alt="">
            </div>
            <p>Gateways de Pagamento Seguros</p>
            <img src="assets/img/pay/pay.png" alt="">
        </div>

        <div class="copyright">
            <p>© Copyright 2023 - Nattus - Todos os direitos reservados Nattus Comércio Alimentício LTDA
</p>
        </div>
    </footer>
    <!--=============== SCROLL UP ===============-->
    <a href="#" class="scrollup" id="scroll-up">
        <i class='bx bx-up-arrow-alt scrollup__icon'></i>
    </a>

    <!--=============== MAIN JS ===============-->
    <script src="https://unpkg.com/swiper@7/swiper-bundle.min.js"></script>

    <script src="assets/js/initial.js"></script>

    <script>
            var search = document.getElementById('enter');

            search.addEventListener("keydown", function(event) {
                if (event.key === "Enter") {
                    searchData();
                }
            });

            function searchData() {
                window.location = 'pesquisar.php?search=' + search.value;
            }
        </script>


</body>

</html>