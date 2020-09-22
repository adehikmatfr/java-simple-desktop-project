/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package penjualan;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author RPL-09
 */
public class koneksi {
    
    Connection conn;
    
        public void buka_db(){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/bunga","root","");
            
        }catch (ClassNotFoundException e){
            System.out.println("error #1 "+e.getMessage());
            System.exit(0);
        }catch(SQLException e){
            System.out.println("error #2 "+e.getMessage());
            System.exit(0);
            
        }
    }
}
