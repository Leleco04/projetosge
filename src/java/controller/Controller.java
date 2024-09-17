/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Date;
import java.sql.SQLException;
import java.util.HashSet;
import java.util.List;
import java.util.Random;
import java.util.Set;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import model.bean.Areas;
import model.bean.Professores;
import model.dao.AreasDAO;
import model.dao.ProfessoresDAO;

/**
 *
 * @author Senai
 */
@WebServlet(name = "Controller", urlPatterns = {"/Controller", "/cadastro", "/login", "/home", "/logout"})
@MultipartConfig
public class Controller extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Controller</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Controller at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pagina = request.getServletPath();
        AreasDAO aDao = new AreasDAO();

        Cookie[] cookies = request.getCookies();

        if (cookies != null) {
            for (Cookie c : cookies) {
                request.setAttribute(c.getName(), c.getValue());
            }
        } else {
            request.setAttribute("id_professor", "0");
            request.setAttribute("nome_professor", "");
        }

        if (pagina.equals("/cadastro")) {
            List<Areas> areas = aDao.lerAreas();
            request.setAttribute("areas", areas);
            request.getRequestDispatcher("WEB-INF/jsp/cadastro.jsp").forward(request, response);
        } else if (pagina.equals("/login")) {
            request.getRequestDispatcher("WEB-INF/jsp/login.jsp").forward(request, response);
        } else if (pagina.equals("/home")) {
            String idProfessor = request.getAttribute("id_professor") != null ? request.getAttribute("id_professor").toString() : "0";
            if(Integer.valueOf(idProfessor) > 0) {
                request.getRequestDispatcher("WEB-INF/jsp/home.jsp").forward(request, response);
            } else {
                Cookie cookieMensagem = new Cookie("mensagem", "Faca o login!");
                response.addCookie(cookieMensagem);
                response.sendRedirect("login");
            }
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pagina = request.getServletPath();
        AreasDAO aDao = new AreasDAO();
        ProfessoresDAO pDao = new ProfessoresDAO();
        Professores professor = new Professores();
        Random gerador = new Random();
        int matriculaRandom = gerador.nextInt();

        if (pagina.equals("/cadastro")) {

            do {
                matriculaRandom = gerador.nextInt();
            } while (matriculaRandom < 0);

            professor.setNome(request.getParameter("nome"));
            professor.setMatricula(String.valueOf(matriculaRandom));
            //professor.setMatricula(request.getParameter("matricula"));
            professor.setAdmissao(Date.valueOf(request.getParameter("admissao")));
            professor.setSenha(request.getParameter("senha"));
            professor.setCpf(request.getParameter("cpf"));
            professor.setArea(Integer.valueOf(request.getParameter("area")));

            Part pArquivo = request.getPart("imagem");
            // Pega o caminho da imagem e converte para string
            String nomeArquivo = Paths.get(pArquivo.getSubmittedFileName()).getFileName().toString();

            // Verifica se o nome do arquivo não é null e não está vazio
            if (nomeArquivo != null && !nomeArquivo.isEmpty()) {
                // Pega o caminho que a imagem será salva
                String caminho = getServletContext().getRealPath("/") + "assets";
                File uploads = new File(caminho);

                // Verifica se o diretório upload existe
                if (!uploads.exists()) {
                    // Cria um diretório novo
                    uploads.mkdirs();
                }

                File arquivo = new File(uploads, nomeArquivo);

                try (InputStream input = pArquivo.getInputStream()) {
                    Files.copy(input, arquivo.toPath(), StandardCopyOption.REPLACE_EXISTING);
                } catch (Exception e) {
                    e.printStackTrace();
                }

                // Seta a imagem no atributo imagem do professor (bean)
                professor.setImagem("assets/" + nomeArquivo);

            } else {
                professor.setImagem(null);
            }

            pDao.cadastrarProfessor(professor);

            response.sendRedirect("login");

        } else if (pagina.equals("/login")) {

            professor.setCpf(request.getParameter("cpf"));
            professor.setSenha(request.getParameter("senha"));

            professor = pDao.verificarLogin(professor);

            if (professor.getIdProfessor() > 0) {
                Cookie cookieIdProfessor = new Cookie("id_professor", String.valueOf(professor.getIdProfessor()));
                response.addCookie(cookieIdProfessor);
                Cookie cookieNome = new Cookie("nome_professor", professor.getNome());
                response.addCookie(cookieNome);
                response.sendRedirect("home");
            } else {
                response.sendRedirect("login");
            }
        } else if(pagina.equals("/logout")) {
            Cookie[] cookies = request.getCookies();
            for(Cookie c: cookies) {
                c.setMaxAge(0);
                c.setValue("");
                response.addCookie(c);
            }
            response.sendRedirect("login");
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
