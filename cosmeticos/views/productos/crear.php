<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Crear Nuevo Producto</title>
    <link rel="stylesheet" href="../../assets/css/styles.css">
</head>
<body>
    <h1>Crear Nuevo Producto</h1>
    <form action="../../index.php?action=create" method="POST">
        <label for="nombre">Nombre:</label>
        <input type="text" id="nombre" name="nombre" required>

        <label for="precio">Precio:</label>
        <input type="number" id="precio" name="precio" step="0.01" required>

        <label for="contenido">Contenido:</label>
        <input type="text" id="contenido" name="contenido">

        <label for="caracteristicas">Características:</label>
        <textarea id="caracteristicas" name="caracteristicas"></textarea>

        <label for="stock">Stock:</label>
        <input type="number" id="stock" name="stock" required>

        <label for="id_categoria">Categoría:</label>
        <select id="id_categoria" name="id_categoria" required>
            <!-- Aquí deberías cargar dinámicamente las categorías desde la base de datos -->
            <option value="">Seleccione una categoría</option>
        </select>

        <label for="id_proveedor">Proveedor:</label>
        <select name="id_categoria">
    <?php while ($categoria = $categorias->fetch(PDO::FETCH_ASSOC)): ?>
        <option value="<?php echo $categoria['ID_Categoria']; ?>"><?php echo $categoria['Nombre']; ?></option>
    <?php endwhile; ?>
</select>

<select name="id_marca">
    <?php while ($marca = $marcas->fetch(PDO::FETCH_ASSOC)): ?>
        <option value="<?php echo $marca['ID_Marca']; ?>"><?php echo $marca['Nombre']; ?></option>
    <?php endwhile; ?>
</select>

        <button type="submit">Crear Producto</button>
    </form>
    <a href="../../index.php?action=index">Volver a la lista de productos</a>
</body>
</html>