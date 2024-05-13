import Foundation

enum TaskSection: Identifiable, CaseIterable, Hashable {
    static func == (lhs: TaskSection, rhs: TaskSection) -> Bool {
        lhs.id == rhs.id
    }
    
    static var allCases: [TaskSection] {
        [.all, .done, .upcoming]
    }
    
    case all
    case done
    case upcoming
    case list(TasksGroup)
    
    var id: String {
        switch self {
        case .all:
            "all"
        case .done:
            "done"
        case .upcoming:
            "upcoming"
        case .list(let tasksGroup):
            tasksGroup.id.uuidString
        }
    }
    
    var displayName: String {
        switch self {
        case .all:
            "All"
        case .done:
            "Done"
        case .upcoming:
            "Upcoming"
        case .list(let tasksGroup):
            tasksGroup.title
        }
    }
    
    var iconsName: String {
        switch self {
        case .all:
            "star"
        case .done:
            "checkmark.circle"
        case .upcoming:
            "calendar"
        case .list(_):
            "folder"
        }
    }
}
