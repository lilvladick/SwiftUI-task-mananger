//
//  SideBarView.swift
//  task-manager
//
//  Created by Владислав Кириллов on 13.05.2024.
//

import SwiftUI

struct SideBarView: View {
    
    let userCreated: [TasksGroup]
    @Binding var selection: TaskSection
    
    var body: some View {
        List(selection: $selection) {
            Section("System"){
                ForEach(TaskSection.allCases) {
                    selection in Label(selection.displayName, systemImage: selection.iconsName)
                        .tag(selection)
                }
            }
            Section("Personal Groups"){
                ForEach(userCreated) { group in
                    Label(group.title, systemImage: "folder")
                        .tag(TaskSection.list(group))
                }
            }
        }
    }
}

#Preview {
    SideBarView(userCreated: TasksGroup.basicGroups(),
                selection: .constant(.all))
        .listStyle(.sidebar)
}
