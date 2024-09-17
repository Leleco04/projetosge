<%-- Document : home Created on : 05/09/2024, 15:13:23 Author : Senai --%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
              crossorigin="anonymous">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
              crossorigin="anonymous">
        <link rel="stylesheet" href="./styles/styles.css">
    </head>

    <body>
        <header>
            <header>
                <div class="header vw-100 d-flex justify-content-end align-items-center">
                    <form action="logout" method="POST">
                        <button class="btn btn-danger me-3" type="submit">Logout</button>
                    </form>
                </div>
            </header>
        </header>
        <h2>Bem-vindo professor ${cookie['nome_professor'].getValue()}</h2>
    </body>

</html>