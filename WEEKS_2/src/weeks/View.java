package weeks;

public interface View {
	void initialise(Controller controller, Model model);

	void refreshView();

	void feedbackToUser();
}
