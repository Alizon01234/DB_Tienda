<?php
require_once 'models/Marca.php';
require_once 'config/database.php';

class MarcaController {
    private $db;
    private $marca;

    public function __construct() {
        $database = new Database();
        $db = $database->getConnection();
        $this->marca = new Marca($db);
    }

    public function index() {
        $result = $this->marca->read();
        include 'views/marcas/index.php';
    }

    public function create() {
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            $this->marca->nombre = $_POST['nombre'];
            $this->marca->descripcion = $_POST['descripcion'];

            if ($this->marca->create()) {
                header('Location: index.php?controller=marca&action=index');
            } else {
                include 'views/marcas/crear.php';
            }
        } else {
            include 'views/marcas/crear.php';
        }
    }

    public function update() {
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            $this->marca->id = $_POST['id'];
            $this->marca->nombre = $_POST['nombre'];
            $this->marca->descripcion = $_POST['descripcion'];

            if ($this->marca->update()) {
                header('Location: index.php?controller=marca&action=index');
            } else {
                include 'views/marcas/editar.php';
            }
        } else {
            $id = $_GET['id'];
            include 'views/marcas/editar.php';
        }
    }

    public function delete() {
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            $this->marca->id = $_POST['id'];
            if ($this->marca->delete()) {
                header('Location: index.php?controller=marca&action=index');
            }
        }
    }
}
?>