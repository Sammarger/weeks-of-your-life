import Foundation

protocol View {}
protocol Controller {}
protocol Model {}

class WeeksMain {
    var view: View
    var controller: Controller
    var model: Model

    init() {
        view = GUIView() // Assuming WeeksGUIView conforms to View
        controller = WeeksController() // Assuming WeeksController conforms to Controller
        model = WeeksModel() // Assuming WeeksModel conforms to Model

        model.initialise(width: 5, height: 11, view: view, controller: controller)
        controller.initialise(view: view, model: model)
        view.initialise(controller: controller, model: model)

        controller.startup()
    }
}

let mainApp = WeeksMain()
