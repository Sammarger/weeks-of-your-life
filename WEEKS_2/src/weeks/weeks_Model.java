package weeks;

public class weeks_Model implements Model {

	Controller controller;
	View view;
	int width;
	int height;
	int totalWeeks;

	Week[][] squareContents;

	@Override
	public void initialise(int width, int height, View view, Controller controller) { // Later on only
																										// total weeks
																										// will be
																										// necessary
		this.controller = controller;
		this.view = view;
		this.width = width;
		this.height = height;

		squareContents = new Week[width][height];
	}

	// Create a function in controller that determines the width and height from the
	// total weeks.

	@Override
	public int getSquareContents(int x, int y) {
		Week w = squareContents[x][y];
		int s = w.getState();
		return s;
	}

	@Override
	public void setSquareContents(int x, int y, int val) {
		squareContents[x][y].setState(val);
	}

	@Override
	public int getWidth() {
		return this.width;
	}

	@Override
	public int getHeight() {
		// TODO Auto-generated method stub
		return this.height;
	}

	@Override
	public int getTotalWeeks() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int setTotalWeeks() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void initialiseWeek(int x, int y) { // Makes new week for each node in squareContents list
		squareContents[x][y] = new Week();
	}

}
