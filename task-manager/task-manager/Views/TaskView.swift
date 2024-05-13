//
//  TaskView.swift
//  task-manager
//
//  Created by Владислав Кириллов on 13.05.2024.
//

import SwiftUI

struct TaskView: View {
    
    @Binding var task: Task
    
    var body: some View {
        HStack{
            Image(systemName: task.isCompleted ? "largecircle.fill.circle" : "circle")
                .onTapGesture {
                    task.isCompleted.toggle()
                }
            TextField("New task", text: $task.title).textFieldStyle(.plain)
            Text(task.title)
        }
    }
}

#Preview {
    TaskView(task: .constant(Task.testTask())).padding()
}
