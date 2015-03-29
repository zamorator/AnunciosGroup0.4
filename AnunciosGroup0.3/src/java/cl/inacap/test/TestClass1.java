/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.inacap.test;

import cl.inacap.connect.ConnectionFactory;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author dzamoraf
 */
public class TestClass1 {

    public static void main(String args[]) throws SQLException {
        ConnectionFactory connection = new ConnectionFactory();
        try {
            connection.obtenerConexion();
        } catch (SQLException ex) {
            Logger.getLogger(TestClass1.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(TestClass1.class.getName()).log(Level.SEVERE, null, ex);
        } finally{
            connection.cerrarConexion();
        }

    }
}
