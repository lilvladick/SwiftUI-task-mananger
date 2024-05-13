import Foundation

struct TasksGroup: Identifiable, Hashable {
    let id = UUID()
    var title: String
    var createdAt: Date
    var tasks: [Task]
    
    init(title: String,  tasks: [Task] = []) {
        self.title = title
        self.createdAt = Date()
        self.tasks = tasks
    }
    
    static func exapleTaskGroup() -> TasksGroup {
        let task1 = Task(title: "Clean my room")
        let task2 = Task(title: "make homework")
        
        var group = TasksGroup(title: "Personal")
        group.tasks = [task1, task2]
        return group
    }
    
    static func basicGroups() -> [TasksGroup] {
        let perosnal = TasksGroup.exapleTaskGroup()
        let job = TasksGroup(title: "Job")
        
        return [perosnal,job]
    }
}
