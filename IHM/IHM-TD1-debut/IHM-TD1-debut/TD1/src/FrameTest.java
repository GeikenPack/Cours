import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Font;
import java.awt.GridLayout;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JTextField;

@SuppressWarnings("serial")
public class FrameTest extends JFrame
{
	public FrameTest()
	{
		//Définition de la fenetre
		super("Plus ou moins");
		this.setDefaultCloseOperation(EXIT_ON_CLOSE);
		this.setLayout(new BorderLayout());
		this.setSize(280, 120);
		
		//Création des panels
		JPanel pan;
		pan = new JPanel();
		pan.setLayout(new GridLayout(1, 3));
		
		//Création des bouttons
		JButton but1, but2, but3;
		but1 = new JButton("+");
		new Color(0);
		but1.setBackground(Color.GREEN);
		but2 = new JButton("RAZ");
		new Color(0);
		but2.setBackground(Color.BLUE);
		but3 = new JButton("-");
		new Color(0);
		but3.setBackground(Color.RED);
		
		//Création de la zone de texte
		JTextField zone = new JTextField(10);
		zone.setFont(new Font("Arial", 1, 18));
		zone.setEditable(false);
		zone.setHorizontalAlignment(JTextField.CENTER);
		zone.setText("16");
		
		//Ajout des éléments aux panels
		pan.add(but1);
		pan.add(but2);
		pan.add(but3);
		
		//Ajout des pannels a la fenetre
		this.add(zone, BorderLayout.CENTER);
		this.add(pan, BorderLayout.SOUTH);
	}
}
