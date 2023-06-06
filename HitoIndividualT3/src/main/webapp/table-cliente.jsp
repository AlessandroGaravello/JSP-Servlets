<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Insertar título aquí</title>
    <!-- Incluir Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="new-cliente.jsp">Registro</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="table-cliente.jsp">Mostrar</a>
            </li>
        </ul>
    </div>
</nav>
<div class="container">
    <form action="select" method="POST">
        <div class="form-group">
            <label for="nombre1">Nombre del usuario:</label>
            <input type="text" class="form-control" id="nombre1" name="nombre1" required>
        </div>
        
        <button type="submit" class="btn btn-primary">Mostrar</button>
    </form>
</div>

<!-- Incluir Bootstrap JS -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>