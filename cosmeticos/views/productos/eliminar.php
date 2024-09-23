<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Eliminar Producto</title>
    <link rel="stylesheet" href="../../assets/css/styles.css">
</head>
<body>
    <h1>Eliminar Producto</h1>
    <p>¿Está seguro que desea eliminar el producto "<?php echo $producto['Nombre']; ?>"?</p>
    <form action="../../index.php?action=delete" method="POST">
        <input type="hidden" name="id" value="<?php echo $producto['ID_Producto']; ?>">
        <button type="submit">Sí, eliminar</button>
    </form>
    <a href="../../index.php?action=index">No, volver a la lista de productos</a>
</body>
</html>