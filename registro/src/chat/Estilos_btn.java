/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package chat;
import java.awt.Color;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JTextField;

import javax.swing.JFrame;

/**
 *
 * @author fer
 */
public class Estilos_btn extends JFrame {
    public Estilos_btn ()
    {
        
    }
    
    
    
    public void dandoEstilos(JButton objeto)
    {
        objeto.setFocusPainted(false);
        objeto.setContentAreaFilled(false);
        objeto.setFont (new Font ("Arial", Font.BOLD, 10));
    }
    
    public void dandoEstiloTxtField(JTextField objeto)
    {
        objeto.setFont(new Font("Arial", Font.BOLD, 10));
    }
    
    public void dandoEstilosFrame(JFrame objeto)
    {
        getContentPane().setBackground(Color.white);
    }
}
