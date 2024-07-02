package weeks;

public class weeksMain {

	View view;
	Controller controller;
	Model model;

	weeksMain() {

		view = new weeks_GUIView();

		controller = new weeks_Controller();

		model = new weeks_Model();

		model.initialise(5, 11, view, controller);
		controller.initialise(view, model);
		view.initialise(controller, model);

		controller.startup();

	}

	public static void main(String[] args) {
		new weeksMain();
	}
}