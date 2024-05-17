import SwiftUI

struct StaticTasksGroupView: View {
    
    let title: String
    let tasks: [Task]
    
    var body: some View {
        List(tasks) { task in
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: task.isCompleted ? "largecircle.fill.circle" : "circle")
                    Text(task.title)
                    Spacer()
                    if let endDate = task.endDate as? Date{
                        Text("\(endDate.formatted())")
                            .foregroundColor(.gray)
                            .fontWeight(.bold)
                    }
                }
                if ((task.description?.isEmpty) != nil) {
                    Text(task.description ?? "")
                        .padding(.leading,23) //костыль
                        .foregroundColor(.gray).fontWeight(.bold)
                }
            }
        }
    }

}

#Preview {
    StaticTasksGroupView(title: "All", tasks: Task.testTasks())
}
