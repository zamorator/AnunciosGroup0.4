/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.inacap.connect;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author zamorator
 */
public class ConnectionFactory {

    Connection con;

    public Connection obtenerConexion() throws SQLException, ClassNotFoundException {
        con = null;
        Class.forName("com.mysql.jdbc.Driver");
        //con = DriverManager.getConnection("jdbc:mysql://localhost/anunciosgroup?user=admin&password=adminadmin&noAccessToProcedureBodies=true");
        con = DriverManager.getConnection("jdbc:mysql://localhost/anunciosgroup?user=admin&password=123456&noAccessToProcedureBodies=true");
        return con;
    }

    protected void cerrarConexion(Connection con, ResultSet rs, PreparedStatement pst) throws SQLException {
        try {
            if (rs != null) {
                rs.close();
            }
            if (pst != null) {
                pst.close();
            }
            if (con != null) {
                con.close();
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            throw new SQLException();
        }
    }

    protected void cerrarConexion(Connection con, ResultSet rs, Statement st) throws SQLException {
        try {
            if (rs != null) {
                rs.close();
            }
            if (st != null) {
                st.close();
            }
            if (con != null) {
                con.close();
            }
        } catch (SQLException ex) {
            throw new SQLException();
        }
    }

    public void cerrarConexion() throws SQLException {
        try {
            if (this.con != null) {
                this.con.close();
            }
        } catch (SQLException ex) {
            throw new SQLException();
        }
    }

}
