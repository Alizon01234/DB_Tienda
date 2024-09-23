<?php
require_once 'models/Producto.php';
require_once 'models/Categoria.php';
require_once 'models/Marca.php';
require_once 'config/database.php';

class ProductoController {
    private $db;
    private $producto;
    private $categoria;
    private $marca;

    public function __construct() {
        $database = new Database();
        $db = $database->getConnection();
        $this->producto = new Producto($db);
        $this->categoria = new Categoria($db);
        $this->marca = new Marca($db);
    }

    public function index() {
        $result = $this->producto->read();
        include 'views/productos/index.php';
    }

    public function create() {
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            $this->producto->nombre = $_POST['nombre'];
            $this->producto->precio = $_POST['precio'];
            $this->producto->color = $_POST['color'];
            $this->producto->talla = $_POST['talla'];
            $this->producto->id_categoria = $_POST['id_categoria'];
            $this->producto->id_marca = $_POST['id_marca'];

            if ($this->producto->create()) {
                header('Location: index.php?controller=producto&action=index');
            } else {
                $categorias = $this->categoria->read();
                $marcas = $this->marca->read();
                include 'views/productos/crear.php';
            }
        } else {
            $categorias = $this->categoria->read();
            $marcas = $this->marca->read();
            include 'views/productos/crear.php';
        }
    }

    public function update() {
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            $this->producto->id = $_POST['id'];
            $this->producto->nombre = $_POST['nombre'];
            $this->producto->precio = $_POST['precio'];
            $this->producto->color = $_POST['color'];
            $this->producto->talla = $_POST['talla'];
            $this->producto->id_categoria = $_POST['id_categoria'];
            $this->producto->id_marca = $_POST['id_marca'];

            if ($this->producto->update()) {
                header('Location: index.php?controller=producto&action=index');
            } else {
                $categorias = $this->categoria->read();
                $marcas = $this->marca->read();
                include 'views/productos/editar.php';
            }
        } else {
            $id = $_GET['id'];
            // Aquí deberías obtener los datos del producto por su ID
            $categorias = $this->categoria->read();
            $marcas = $this->marca->read();
            include 'views/productos/editar.php';
        }
    }

    public function delete() {
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            $this->producto->id = $_POST['id'];
            if ($this->producto->delete()) {
                header('Location: index.php?controller=producto&action=index');
            }
        }
    }
}
?>