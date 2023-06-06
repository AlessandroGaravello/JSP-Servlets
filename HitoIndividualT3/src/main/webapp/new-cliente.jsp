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
<div class="container">
    <h1 class="mt-4">Formulario de Solocrossfit</h1>
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
    <form action="add" method="POST">
        <div class="form-group">
            <label for="nombre">Nombre del usuario:</label>
            <input type="text" class="form-control" id="nombre" name="nombre" required>
        </div>
        
        <div class="form-group">
            <label for="plan">Plan de trabajo mensual:</label>
            <select class="form-control" id="plan" name="plan" required onchange="showHideCompetitions()">
                <option value="Beginner">2 sesiones por semana (8 al mes)</option>
                <option value="Intermediate">3 sesiones por semana (12 al mes)</option>
                <option value="Elite">5 sesiones por semana (20 al mes)</option>
            </select>
        </div>
        
        <div id="comp" style="display: none;" class="form-group">
            <label for="comp">Competiciones:</label>
            <input type="number" class="form-control" name="comp" value="0">
        </div>
        
        <div class="form-group">
            <label for="peso">Peso actual:</label>
            <select class="form-control" id="peso" name="peso">
                <option value="Flyweight">0-66 kg</option>
                <option value="Lightweight">67-73 kg</option>
                <option value="Light-Middleweight">74-81 kg</option>
                <option value="Middleweight">82-90 kg</option>
                <option value="Light-Heavyweight">91-100 kg</option>
                <option value="Heavyweight">Más de 100 kg</option>
            </select>
        </div>
        
        <div class="form-group">
            <label for="privado">Horas privadas al mes:</label>
            <input type="number" class="form-control" id="privado" name="privado" value="0" required max="20">
        </div>
        
        <input type="submit" class="btn btn-primary" value="Enviar">
    </form>
</div>

<!-- Incluir Bootstrap JS -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script>
	    document.getElementById("plan").addEventListener("change", function() {
	        showHideCompetitions();
	    });
	
	    function showHideCompetitions() {
	        var plan = document.getElementById("plan").value;
	        var competitionContainer = document.getElementById("comp");
	
	        if (plan === "Intermediate" || plan === "Elite") {
	            competitionContainer.style.display = "block";
	        } else {
	            competitionContainer.style.display = "none";
	        }  
	        if (plan === "Beginner") {
	            var competitionInput = competitionContainer.querySelector('input[name="comp"]');
	            competitionInput.value = "0";
	        }
	    }
	</script>
</body>
</html>