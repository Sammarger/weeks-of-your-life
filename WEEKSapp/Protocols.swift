protocol View {
    func initialise(controller: Controller, model: Model)
    func refreshView()
    func feedbackToUser()
}

protocol Model {
    func initialise(width: Int, height: Int, view: View, controller: Controller)
    func getSquareContents(x: Int, y: Int) -> Int
    func setSquareContents(x: Int, y: Int, val: Int)
    func getWidth() -> Int
    func getHeight() -> Int
    func getTotalWeeks() -> Int
    func setTotalWeeks(val: Int) -> Int
    func initialiseWeek(i: Int, j: Int)
}

protocol Controller {
    func initialise(view: View, model: Model)
    func startup()
    func update()
}

