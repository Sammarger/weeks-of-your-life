package weeks;

import java.awt.Color;
import java.awt.Graphics;

import javax.swing.JPanel;

public class Square_w extends JPanel {

	private static final long serialVersionUID = 1L;

	JPanel square = new JPanel();
	int width = 0;
	int height = 0;
	Color fillColor;
	int state;

	public Square_w(int x, int y) {
		width = x;
		height = y;

		setColor(0);

	}

	public Square_w(int x, int y, int s) {
		width = x;
		height = y;

		setColor(s);

	}

	public void setColor(int s) {
		if (s == 1) {
			fillColor = Color.black;
		} else {
			fillColor = Color.white;
		}
	}

	@Override
	public void paintComponent(Graphics g) {
		super.paintComponent(g);
		g.setColor(fillColor);
		g.fillRect(width / 4, (height / 4), width / 2, height / 2);
		
	}

}
