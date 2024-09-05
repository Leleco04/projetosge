/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import conexao.Conexao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.bean.Professores;

/**
 *
 * @author Senai
 */
public class ProfessoresDAO {
    public void cadastrarProfessor(Professores professor) {
        try {
            Connection conexao = Conexao.conectar();
            PreparedStatement stmt = null;
            stmt = conexao.prepareStatement("INSERT INTO professores (nome, matricula, admissao, senha, cpf, area) VALUES (?, ?, ?, ?, ?, ?)");
            
            stmt.setString(1, professor.getNome());
            stmt.setString(2, professor.getMatricula());
            stmt.setDate(3, professor.getAdmissao());
            stmt.setString(4, professor.getSenha());
            stmt.setString(5, professor.getCpf());
            stmt.setInt(6, professor.getArea());
            
            stmt.executeUpdate();
            
            stmt.close();
            conexao.close();
            
        } catch(SQLException e) {
            e.printStackTrace();
        }
    }
    
    public Professores verificarLogin(Professores professorVerificado) {
        Professores professor = new Professores();
        try {
            Connection conexao = Conexao.conectar();
            PreparedStatement stmt = null;
            ResultSet rs = null;
            stmt = conexao.prepareStatement("SELECT * FROM professores WHERE cpf = ? and senha = ?");
            
            stmt.setString(1, professorVerificado.getCpf());
            stmt.setString(2, professorVerificado.getSenha());
            rs = stmt.executeQuery();
            
            if(rs.next()) {
                professor.setIdProfessor(rs.getInt("id_professor"));
                professor.setNome(rs.getString("nome"));
            }
            
            rs.close();
            stmt.close();
            conexao.close();
                    
        } catch(SQLException e) {
            e.printStackTrace();
        }
        return professor;
    }
}
