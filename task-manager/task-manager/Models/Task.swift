import Foundation

struct Task: Identifiable, Hashable {
    let id = UUID()
    var title: String
    var isCompleted: Bool
    var endDate: Date
    var description: String?
    
    init(title: String, isCompleted: Bool = false, endDate: Date = Date(), description: String? = nil) {
        self.title = title
        self.isCompleted = isCompleted
        self.endDate = endDate
        self.description = description
    }
    
    static func testTask() -> Task {
        Task(title: "evolve", endDate: Calendar.current.date(byAdding: .day, value: 2, to: Date())!)
    }
    
    static func testTasks() -> [Task] {
        [
            Task(title: "go to school"),
            Task(title: "buy a new keyboard", endDate: Calendar.current.date(byAdding: .day, value: 4, to: Date())!),
            Task(title: "make dinner", isCompleted: true),
            Task(title: "clean my room", isCompleted: true ,endDate: Calendar.current.date(byAdding: .day, value: 2, to: Date())!),
        ]
    }
}
