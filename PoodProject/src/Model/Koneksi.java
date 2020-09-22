/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
/**
 *
 * @author HP2017-08
 */
public class Koneksi {
    
    Connection con;
    //buat metod Ambil conneksi
    public Connection GetCon()
    {
    try{
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/penjualan","root","");
        }catch (ClassNotFoundException e){
            System.out.println("error #1 "+e.getMessage());
            System.exit(0);
        }catch(SQLException e){
            System.out.println("error #2 "+e.getMessage());
            System.exit(0);          
        }
    return con;
    }
    
}
