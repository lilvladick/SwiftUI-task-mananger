import SwiftUI

struct ContentView: View {
    
    @State private var selection = TaskSection.all
    
    @State private var allTasks = Task.testTasks()
    @State private var userCreatedGroups: [TasksGroup] = TasksGroup.basicGroups()
    
    var body: some View {
        NavigationSplitView{
            SideBarView(userCreated: userCreatedGroups, selection: $selection)
        } detail: {
            switch selection {
            case .all:
                TasksGroupView(title: "All", tasks: allTasks)
            case .done:
                TasksGroupView(title: "All", tasks: allTasks.filter({
                    $0.isCompleted
                }))
            case .upcoming:
                TasksGroupView(title: "All", tasks: allTasks.filter({
                    !$0.isCompleted
                }));
            case .list(let tasksGroup):
                TasksGroupView(title: tasksGroup.title, tasks: tasksGroup.tasks)
            }
        }
    }
}

#Preview {
    ContentView()
}
