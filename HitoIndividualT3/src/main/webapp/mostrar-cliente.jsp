<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Mostrar datos del usuario</title>
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
<%

    // Obtén los datos del request

    String nombre = (String) request.getAttribute("nombre");

	String plan = "";
	Object planObj = request.getAttribute("plan");
    
    if (planObj != null) {
    	plan = (String) planObj;
    }

	int competiciones = 0;

    Object competicionesObj = request.getAttribute("competiciones");
    
    if (competicionesObj != null) {
        competiciones = (int) competicionesObj;
    }

    String peso = (String) request.getAttribute("peso");

    int hora = 0;
    
	Object horaObj = request.getAttribute("hora");
    
    if (horaObj != null) {
    	hora = (int) horaObj;
    }



    // Calcula el precio de las competiciones

    double precioCompeticiones = competiciones * 22.00;

    String precioCompeticionesConSimbolo = String.format("%.2f£", precioCompeticiones);

    double precioPrivate = hora * 9.50;

    String precioPrivateConSimbolo = String.format("%.2f£", precioPrivate);



    // Calcula el precio dependiendo del nivel

    double precioPlan = 0.0;

    if (plan.equals("Beginner")) {

    	precioPlan = 100.0;

    } else if (plan.equals("Intermediate")) {

    	precioPlan = 120.0;

    } else if (plan.equals("Elite")) {

    	precioPlan = 140.0;

    }



    // Calcula el precio total

    double precioTotal = precioCompeticiones +  precioPlan + precioPrivate;

    String precioTotalConSimbolo = String.format("%.2f£", precioTotal);

    %>



    <div class="container">
    <div class="card">
        <div class="card-body">
            <h1 class="card-title">Datos del cliente</h1>

            <div class="row">
                <div class="col-md-6">
                    <p>Nombre: <%= nombre %></p>
                    <p>Categoría de peso: <%= peso %></p>
                    <p>Plan: <%= plan %></p>
                    <p>Precio del Plan: <%= precioPlan %></p>
                </div>
                <div class="col-md-6">
                    <p>Precio de las competiciones: <%= precioCompeticionesConSimbolo %></p>
                    <p>Precio de las sesiones privadas: <%= precioPrivateConSimbolo %></p>
                    <p>Precio total: <%= precioTotalConSimbolo %></p>
                </div>
            </div>
        </div>
    </div>
</div>

    <!-- Incluir Bootstrap JS -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
