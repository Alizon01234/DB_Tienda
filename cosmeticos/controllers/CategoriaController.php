<?php
require_once 'models/Categoria.php';
require_once 'config/database.php';

class CategoriaController {
    private $db;
    private $categoria;

    public function __construct() {
        $database = new Database();
        $db = $database->getConnection();
        $this->categoria = new Categoria($db);
    }

    public function index() {
        $result = $this->categoria->read();
        include 'views/categorias/index.php';
    }

    public function create() {
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            $this->categoria->nombre = $_POST['nombre'];
            $this->categoria->descripcion = $_POST['descripcion'];

            if ($this->categoria->create()) {
                header('Location: index.php?controller=categoria&action=index');
            } else {
                include 'views/categorias/crear.php';
            }
        } else {
            include 'views/categorias/crear.php';
        }
    }

    public function update() {
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            $this->categoria->id = $_POST['id'];
            $this->categoria->nombre = $_POST['nombre'];
            $this->categoria->descripcion = $_POST['descripcion'];

            if ($this->categoria->update()) {
                header('Location: index.php?controller=categoria&action=index');
            } else {
                include 'views/categorias/editar.php';
            }
        } else {
            $id = $_GET['id'];
            // Aquí deberías obtener los datos de la categoría por su ID
            include 'views/categorias/editar.php';
        }
    }

    public function delete() {
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            $this->categoria->id = $_POST['id'];
            if ($this->categoria->delete()) {
                header('Location: index.php?controller=categoria&action=index');
            }
        }
    }
}
?>