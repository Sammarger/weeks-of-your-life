package weeks;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.GridLayout;

import javax.swing.JFrame;
import javax.swing.JPanel;

public class weeks_GUIView implements View {

	View view;
	Model model;
	Controller controller;
	JFrame frame1 = new JFrame(); // Frame for diagram
	JPanel centralPanel = new JPanel();
	JPanel mainBlock = new JPanel();

	JFrame frame2 = new JFrame();
	JPanel parameterSetter = new JPanel();
	Square_w[][] square_grid;

	public void initialise(Controller controller, Model model) // ADD CONTROLLER AND MODEL
	{

		// DIAGRAM VIEW
		this.controller = controller;
		this.model = model;
		square_grid = new Square_w[model.getWidth()][model.getHeight()];

		frame1.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame1.setTitle("Weeks");
		frame1.setLocationRelativeTo(null); // centre on screen
		frame1.setMinimumSize(new Dimension(350, 570));

		frame1.getContentPane().setLayout(new BorderLayout());

		centralPanel.setPreferredSize(new Dimension(350, 570)); // Central Panel will contain the rectangle which holds
																// the week squares
		centralPanel.setLayout(new FlowLayout(FlowLayout.CENTER, 40, 40));
		centralPanel.setBackground(Color.WHITE);

		mainBlock.setPreferredSize(new Dimension(220, 480)); // 220 300
		mainBlock.setLayout(new GridLayout(0, 5)); // Grid size will be determined by the users input
		mainBlock.setBackground(Color.WHITE);

		loadSquares(model.getWidth(), model.getHeight(), 1);

		centralPanel.add(mainBlock);

		frame1.add(centralPanel, BorderLayout.CENTER);

		frame1.pack();
		frame1.setVisible(true);

	}

	public void loadSquares(int width, int height, int startup) {
		for (int j = 0; j < height; j++) {
			for (int i = 0; i < width; i++) {
				switch (startup) // Startup checks whether program is starting up or not so squares aren't
									// assigned null weeks
				{
				case 0:
					square_grid[i][j].setColor(model.getSquareContents(i, j)); // the Width and height of what will be
																				// filled square
				default:
					setupSquare(i, j); // the Width and height of what will be filled square
				}
			}
		}
	}

	public void setupSquare(int x, int y) {
		square_grid[x][y] = new Square_w(40, 40);
		square_grid[x][y].setSize(new Dimension(40, 40)); // Width and height of the 'square container'
		square_grid[x][y].setBackground(Color.white);
		mainBlock.add(square_grid[x][y]);

	}

	@Override
	public void refreshView() {
		loadSquares(model.getWidth(), model.getHeight(), 0);
		//frame1.pack();
	}

	@Override
	public void feedbackToUser() {
		// TODO Auto-generated method stub

	}
}
