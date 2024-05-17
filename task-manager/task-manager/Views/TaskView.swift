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
        VStack(alignment: .leading){
            HStack{
                Image(systemName: task.isCompleted ? "largecircle.fill.circle" : "circle")
                    .onTapGesture {
                        task.isCompleted.toggle()
                    }
                TextField("New task", text: $task.title).textFieldStyle(.plain)
                Spacer()
                if let endDate = task.endDate as? Date{
                    Text("\(endDate.formatted())")
                        .foregroundColor(.gray)
                        .fontWeight(.bold)
                }
            }
            //Проблема с пробелом =(
            if ((task.description?.isEmpty) != nil) {
                Text(task.description ?? "")
                    .padding(.leading,23) //костыль
                    .foregroundColor(.gray).fontWeight(.bold)
            }
        }
    }
}

#Preview {
    TaskView(task: .constant(Task.testTask())).padding()
}
