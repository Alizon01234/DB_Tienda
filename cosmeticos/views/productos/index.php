<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Lista de Productos</title>
    <link rel="stylesheet" href="assets/css/styles.css">
</head>
<body>
    <h1>Lista de Productos</h1>
    <a href="index.php?action=create">Crear nuevo producto</a>
    <table>
        <tr>
            <th>ID</th>
            <th>Nombre</th>
            <th>Precio</th>
            <th>Categoría</th>
            <th>Acciones</th>
        </tr>
        <?php while ($row = $result->fetch(PDO::FETCH_ASSOC)) { ?>
        <tr>
            <td><?php echo $row['ID_Producto']; ?></td>
            <td><?php echo $row['Nombre']; ?></td>
            <td><?php echo $row['Precio']; ?></td>
          
            <td><?php echo $row['categoria_nombre']; ?></td>
            <td>
                <a href="index.php?action=update&id=<?php echo $row['ID_Producto']; ?>">Editar</a>
                <form action="index.php?action=delete" method="post" style="display:inline;">
                    <input type="hidden" name="id" value="<?php echo $row['ID_Producto']; ?>">
                    <input type="submit" value="Eliminar" onclick="return confirm('¿Estás seguro?');">
                </form>
            </td>
        </tr>
        <?php } ?>
    </table>
</body>
</html>