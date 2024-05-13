//
//  TaskGroupView.swift
//  task-manager
//
//  Created by Владислав Кириллов on 13.05.2024.
//

import SwiftUI

struct TaskGroupView: View {
    
    let title: String
    @Binding var tasks: [Task]
    
    var body: some View {
        List($tasks) { $task in
            TaskView(task: $task)
        }.toolbar {
            Button(action: {
                tasks.append(Task(title: "New task"))
            }, label: {
                Label("Add new task", systemImage: "plus")
            })
        }
    }
}

#Preview {
    TaskGroupView(title: "All", tasks: .constant(Task.testTasks()))
}
