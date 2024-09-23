<?php
class Producto {
    private $conn;
    private $table_name = "Productos";

    public $id;
    public $nombre;
    public $precio;
    public $talla;
    public $color;
    public $id_categoria;
    public $id_proveedor;
    public $id_marca;

    public function __construct($db) {
        $this->conn = $db;
    }

    public function create() {
        $query = "INSERT INTO " . $this->table_name . " SET nombre=:nombre, precio=:precio, color=:, talla=:talla, id_categoria=:id_categoria, id_proveedor=:id_proveedor, id_marca=:id_marca";

        $stmt = $this->conn->prepare($query);

        $this->nombre = htmlspecialchars(strip_tags($this->nombre));
        $this->precio = htmlspecialchars(strip_tags($this->precio));
        $this->color = htmlspecialchars(strip_tags($this->color));
        $this->talla = htmlspecialchars(strip_tags($this->talla));
        $this->id_categoria = htmlspecialchars(strip_tags($this->id_categoria));
        $this->id_proveedor = htmlspecialchars(strip_tags($this->id_proveedor));
        $this->id_marca = htmlspecialchars(strip_tags($this->id_marca));

        $stmt->bindParam(":nombre", $this->nombre);
        $stmt->bindParam(":precio", $this->precio);
        $stmt->bindParam(":color", $this->color);
        $stmt->bindParam(":talla", $this->talla);
        $stmt->bindParam(":id_categoria", $this->id_categoria);
        $stmt->bindParam(":id_proveedor", $this->id_proveedor);
        $stmt->bindParam(":id_marca", $this->id_marca);

        if($stmt->execute()) {
            return true;
        }
        return false;
    }

    public function read() {
        $query = "SELECT p.*, c.Nombre as categoria_nombre, pr.Nombre as proveedor_nombre, m.Nombre as marca_nombre 
                  FROM " . $this->table_name . " p 
                  LEFT JOIN Categorias c ON p.id_categoria = c.ID_Categoria 
                  LEFT JOIN Proveedores pr ON p.id_proveedor = pr.ID_Proveedor 
                  LEFT JOIN Marcas m ON p.id_marca = m.ID_Marca 
                  ORDER BY p.ID_Producto DESC";

        $stmt = $this->conn->prepare($query);
        $stmt->execute();

        return $stmt;
    }

    public function update() {
        $query = "UPDATE " . $this->table_name . " 
                  SET nombre = :nombre, precio = :precio, color = :color, talla = :talla, id_categoria = :id_categoria, id_proveedor = :id_proveedor, id_marca = :id_marca 
                  WHERE ID_Producto = :id";

        $stmt = $this->conn->prepare($query);

        $this->nombre = htmlspecialchars(strip_tags($this->nombre));
        $this->precio = htmlspecialchars(strip_tags($this->precio));
        $this->color = htmlspecialchars(strip_tags($this->color));
        $this->talla = htmlspecialchars(strip_tags($this->talla));
        $this->id_categoria = htmlspecialchars(strip_tags($this->id_categoria));
        $this->id_proveedor = htmlspecialchars(strip_tags($this->id_proveedor));
        $this->id_marca = htmlspecialchars(strip_tags($this->id_marca));
        $this->id = htmlspecialchars(strip_tags($this->id));

        $stmt->bindParam(":nombre", $this->nombre);
        $stmt->bindParam(":precio", $this->precio);
        $stmt->bindParam(":color", $this->color);
        $stmt->bindParam(":talla", $this->talla);
        $stmt->bindParam(":id_categoria", $this->id_categoria);
        $stmt->bindParam(":id_proveedor", $this->id_proveedor);
        $stmt->bindParam(":id_marca", $this->id_marca);
        $stmt->bindParam(":id", $this->id);

        if($stmt->execute()) {
            return true;
        }
        return false;
    }

    public function delete() {
        $query = "DELETE FROM " . $this->table_name . " WHERE ID_Producto = ?";

        $stmt = $this->conn->prepare($query);

        $this->id = htmlspecialchars(strip_tags($this->id));

        $stmt->bindParam(1, $this->id);

        if($stmt->execute()) {
            return true;
        }
        return false;
    }
}
?>