<?php

Class Usuario
{
    private $pdo;
    public $msgErro = "";

    public function conectar($nome, $host, $usuario, $senha)
    {
        global $pdo;
        try {
            $pdo = new PDO("mysql:dbname=".$nome.";host=".$host,$usuario,$senha);
        } catch (Exception $e) {
            $msgErro = $e->getMessage();
        }                
    }

    public function atualizar($idVendedor,$nomeVend,$cpfCnpj,$emailVend,$senhaVend,$imagemVend,$enderecoVend)
    {
        global $pdo;
      
            $sql = $pdo->prepare("UPDATE tblVendedor SET nomeVend = '$nomeVend', cpfCnpj = '$cpfCnpj',
             emailVend = '$emailVend', senhaVend = '$senhaVend', imagemVend = '$imagemVend', enderecoVend = '$enderecoVend'
             WHERE idVendedor = '$idVendedor'");

             $sql->execute();
           
        
    } 
}
    
?>