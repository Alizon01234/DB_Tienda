<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Editar Producto</title>
    <link rel="stylesheet" href="../../assets/css/styles.css">
</head>
<body>
    <h1>Editar Producto</h1>
    <form action="../../index.php?action=update" method="POST">
        <input type="hidden" name="id" value="<?php echo $producto['ID_Producto']; ?>">

        <label for="nombre">Nombre:</label>
        <input type="text" id="nombre" name="nombre" value="<?php echo $producto['Nombre']; ?>" required>

        <label for="precio">Precio:</label>
        <input type="number" id="precio" name="precio" step="0.01" value="<?php echo $producto['Precio']; ?>" required>

        <label for="contenido">Contenido:</label>
        <input type="text" id="contenido" name="contenido" value="<?php echo $producto['Contenido']; ?>">

        <label for="caracteristicas">Características:</label>
        <textarea id="caracteristicas" name="caracteristicas"><?php echo $producto['Caracteristicas']; ?></textarea>

        <label for="stock">Stock:</label>
        <input type="number" id="stock" name="stock" value="<?php echo $producto['Stock']; ?>" required>

        <label for="id_categoria">Categoría:</label>
        <select id="id_categoria" name="id_categoria" required>
            <!-- Aquí deberías cargar dinámicamente las categorías desde la base de datos -->
            <option value="<?php echo $producto['ID_Categoria']; ?>" selected>Categoría actual</option>
        </select>

        <label for="id_proveedor">Proveedor:</label>
        <select id="id_proveedor" name="id_proveedor" required>
            <!-- Aquí deberías cargar dinámicamente los proveedores desde la base de datos -->
            <option value="<?php echo $producto['ID_Proveedor']; ?>" selected>Proveedor actual</option>
        </select>

        <label for="id_marca">Marca:</label>
        <select id="id_marca" name="id_marca" required>
            <!-- Aquí deberías cargar dinámicamente las marcas desde la base de datos -->
            <option value="<?php echo $producto['ID_Marca']; ?>" selected>Marca actual</option>
        </select>

        <button type="submit">Actualizar Producto</button>
    </form>
    <a href="../../index.php?action=index">Volver a la lista de productos</a>
</body>
</html>