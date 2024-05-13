//
//  TasksGroupView.swift
//  task-manager
//
//  Created by Владислав Кириллов on 13.05.2024.
//

import SwiftUI

struct TasksGroupView: View {
    
    let title: String
    let tasks: [Task]
    
    var body: some View {
        List(tasks) { task in
            HStack {
                Image(systemName: task.isCompleted ? "largecircle.fill.circle" : "circle")
                Text(task.title)
            }
        }
    }
}

#Preview {
    TasksGroupView(title: "All", tasks: Task.testTasks())
}
