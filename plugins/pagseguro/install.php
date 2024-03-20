<?php

defined('MYAAC') or die('Direct access not allowed!');

// Verifica se a tabela pagseguro_transactions existe
if(!tableExist('pagseguro_transactions')) {
    // Se não existir, importa o schema
    try {
        $db->query(file_get_contents(PLUGINS . 'pagseguro/install.sql'));
        success('Imported pagseguro_transactions table to database.');
    } catch(PDOException $error_) {
        error($error_);
        return;
    }
}

if(!extension_loaded('curl')) {
    error("cURL php extension is not loaded, please install it with following command (on linux):" . "<br/>" .
        "sudo apt-get install php5-curl" . "<br/>" .
        "sudo service apache2 restart" . "<br/><br/>" .
        "for XAMPP (Windows) you need to uncomment (Remove selicolon - ;) this line in your php.ini:" . "<br/>" .
        ";extension=php_curl.dll");
    return;
}

?>
