<%-- Document : login Created on : 05/09/2024, 14:15:59 Author : Senai --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
              crossorigin="anonymous">
        <link rel="stylesheet" href="./styles/styles.css">
    </head>

    <body>
        <header>
            <div class="header vw-100 d-flex justify-content-end align-items-center">
                <a href="./login" id="link-login" class="me-3">Login</a>
                <a href="./cadastro" id="link-cadastro" class="me-3">Cadastro</a>
            </div>
        </header>
        <div class="d-flex justify-content-center align-items-center login-container">
            <div class="d-grid border p-5">
                <c:if test="${mensagem != null}">
                    <p class="alert alert-danger w-100">${mensagem}</p>
                </c:if>
                <form action="./login" method="POST">
                    <div class="input-group mb-3">
                        <span class="input-group-text input-login-icon" id="basic-addon1"><svg
                                xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                class="bi bi-person-fill" viewBox="0 0 16 16">
                            <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6" />
                            </svg>
                        </span>
                        <input type="text" class="form-control input-login-cpf" placeholder="CPF"
                               aria-label="Username" aria-describedby="basic-addon1" name="cpf">
                    </div>
                    <div class="input-group mb-3">
                        <span class="input-group-text input-login-icon" id="basic-addon1"><svg
                                xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                class="bi bi-shield-lock-fill" viewBox="0 0 16 16">
                            <path fill-rule="evenodd"
                                  d="M8 0c-.69 0-1.843.265-2.928.56-1.11.3-2.229.655-2.887.87a1.54 1.54 0 0 0-1.044 1.262c-.596 4.477.787 7.795 2.465 9.99a11.8 11.8 0 0 0 2.517 2.453c.386.273.744.482 1.048.625.28.132.581.24.829.24s.548-.108.829-.24a7 7 0 0 0 1.048-.625 11.8 11.8 0 0 0 2.517-2.453c1.678-2.195 3.061-5.513 2.465-9.99a1.54 1.54 0 0 0-1.044-1.263 63 63 0 0 0-2.887-.87C9.843.266 8.69 0 8 0m0 5a1.5 1.5 0 0 1 .5 2.915l.385 1.99a.5.5 0 0 1-.491.595h-.788a.5.5 0 0 1-.49-.595l.384-1.99A1.5 1.5 0 0 1 8 5" />
                            </svg>
                        </span>
                        <input type="password" class="form-control input-login-senha" placeholder="Senha"
                               aria-label="Username" aria-describedby="basic-addon1" name="senha">
                    </div>
                    <div class="d-flex justify-content-center mt-3">
                        <button type="submit" id="btn-login" class="border">Fazer Login</button>
                    </div>
                </form>
            </div>
        </div>
    </body>

</html>