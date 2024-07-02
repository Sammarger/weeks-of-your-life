package weeks;

import java.time.LocalDate;
import java.time.temporal.WeekFields;
import java.util.Locale;


public class weeks_Controller implements Controller {

	View view;
	Model model;
    LocalDate currentDate = LocalDate.now();
	int currentWeekOfYear = getCurrentWeekOfYear();

	
	@Override
	public void initialise(View view, Model model) {
		this.view = view;
		this.model = model;
	}

	@Override
	public void startup() {
		int height = model.getHeight();
		int width = model.getWidth();
		for (int j = 0; j < height; j++) {
			for (int i = 0; i < width; i++) { 
				model.initialiseWeek(i, j);
				model.setSquareContents(i, j, calculateState(i, j, width, height, currentWeekOfYear));
			}
		}
		view.refreshView();
	}

	public int calculateState(int x, int y, int l, int h, int w) {
		int s = 0;

		if (((y * l) + x) < w) {
			s = 1;
		}
		return s;
	}

	@Override
	public void update() {
		// TODO Auto-generated method stub

	}
	
    public static int getCurrentWeekOfYear() {
        // Get the current date
        LocalDate currentDate = LocalDate.now();

        // Define the locale (optional, defaults to ISO if not specified)
        Locale locale = Locale.getDefault();

        // Use WeekFields to get the week of the year according to ISO-8601
        int weekOfYear = currentDate.get(WeekFields.of(locale).weekOfWeekBasedYear());

        return weekOfYear;
    }

}
