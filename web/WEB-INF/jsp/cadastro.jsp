<%-- Document : cadastro Created on : 05/09/2024, 14:15:25 Author : Senai --%>

    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@page contentType="text/html" pageEncoding="UTF-8" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>Cadastro</title>
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
                <div class=" d-flex justify-content-center align-items-center border cadastro-container">
                    <div class="d-grid border p-5">
                        <form action="./cadastro" method="POST">
                            <div class="row mb-3">
                                <label for="">Nome</label>
                                <input type="text" name="nome">
                            </div>
                            <!-- <div class="row mb-3">
                                <label for="">Matricula</label>
                                <input type="text" name="matricula">
                            </div> -->
                            <div class="row mb-3">
                                <label for="">Admissao</label>
                                <input type="date" name="admissao">
                            </div>
                            <div class="row mb-3">
                                <label for="">Senha</label>
                                <input type="password" name="senha">
                            </div>
                            <div class="row mb-3">
                                <label for="">Cpf</label>
                                <input type="text" name="cpf">
                            </div>
                            <div class="row mb-3">
                                <label for="">Area</label>
                                <select name="area" id="input-area">
                                    <option selected>Selecione a área</option>
                                    <c:forEach var="area" items="${areas}">
                                        <option value="${area.idArea}">${area.nome}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="row">
                                <div class="d-flex justify-content-center">
                                    <button type="submit" class="border w-75" id="btn-cadastrar">Cadastrar
                                        Professor
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </body>

            </html>