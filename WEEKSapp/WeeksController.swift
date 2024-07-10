import Foundation

class WeeksController {
    
    var view: View?
    var model: Model?
    var currentDate: Date = Date()
    var currentWeekOfYear: Int
    
    init(view: View?, model: Model?) {
        self.view = view
        self.model = model
        self.currentWeekOfYear = getCurrentWeekOfYear()
    }
    
    func initialise(view: View?, model: Model?) {
        self.view = view
        self.model = model
    }
    
    func startup() {
        guard let model = model else { return }
        
        let height = model.height
        let width = model.width
        
        for j in 0..<height {
            for i in 0..<width {
                model.initialiseWeek(i, j)
                model.setSquareContents(i, j, calculateState(i, j, width, height, currentWeekOfYear))
            }
        }
        
        view?.refreshView()
    }
    
    func calculateState(x: Int, y: Int, l: Int, h: Int, w: Int) -> Int {
        var s = 0
        
        if ((y * l) + x) < w {
            s = 1
        }
        
        return s
    }
    
    func update() {
        // Implementation depends on what needs to be updated
    }
    
    func getCurrentWeekOfYear() -> Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.weekOfYear], from: currentDate)
        return components.weekOfYear ?? 0
    }
}
