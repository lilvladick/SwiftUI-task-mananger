import SwiftUI

struct ContentView: View {
    
    @State private var selection = TaskSection.all
    @State private var searchTerm = ""
    @State private var allTasks = Task.testTasks()
    @State private var userCreatedGroups: [TasksGroup] = TasksGroup.basicGroups()
    
    var body: some View {
        NavigationSplitView {
            SideBarView(userCreated: $userCreatedGroups, selection: $selection)
        } detail: {
            if searchTerm.isEmpty{
                switch selection {
                case .all:
                    TaskGroupView(title: "All", tasks: $allTasks)
                case .done:
                    StaticTasksGroupView(title: "All", tasks: allTasks.filter({
                        $0.isCompleted
                    }))
                case .upcoming:
                    StaticTasksGroupView(title: "All", tasks: allTasks.filter({
                        !$0.isCompleted
                    }));
                case .list(let tasksGroup):
                    StaticTasksGroupView(title: tasksGroup.title, tasks: tasksGroup.tasks)
                }
            } else {
                StaticTasksGroupView(title: "All", tasks: allTasks.filter({
                    $0.title.contains(searchTerm)
                }))
            }
        }.searchable(text: $searchTerm)
    }
}

#Preview {
    ContentView()
}
