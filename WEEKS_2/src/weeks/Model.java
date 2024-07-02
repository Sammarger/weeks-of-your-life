package weeks;

public interface Model {

	void initialise(int width, int height, View view, Controller controller);

	int getSquareContents(int x, int y);

	void setSquareContents(int x, int y, int val);

	int getWidth();

	int getHeight();

	int getTotalWeeks();

	int setTotalWeeks();

	void initialiseWeek(int i, int j);

}
