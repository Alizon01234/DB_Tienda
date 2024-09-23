<?php
require_once 'controllers/ProductoController.php';
require_once 'controllers/CategoriaController.php';
require_once 'controllers/MarcaController.php';

$controller = isset($_GET['controller']) ? $_GET['controller'] : 'producto';
$action = isset($_GET['action']) ? $_GET['action'] : 'index';

switch ($controller) {
    case 'producto':
        $controller = new ProductoController();
        break;
    case 'categoria':
        $controller = new CategoriaController();
        break;
    case 'marca':
        $controller = new MarcaController();
        break;
    default:
        // Manejar error 404
        break;
}

if (method_exists($controller, $action)) {
    $controller->$action();
} else {
    // Manejar error 404
}
?>