import SwiftUI

struct SideBarView: View {
    
    @Binding var userCreated: [TasksGroup]
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
                ForEach($userCreated) { $group in
                    HStack{
                        Image(systemName: "folder")
                        TextField("New Group", text: $group.title)
                    }
                    .tag(TaskSection.list(group))
                    .contextMenu {
                        Button("Delete", role: .destructive) {
                            if let index = userCreated.firstIndex(where: {$0.id == group.id}) {
                                userCreated.remove(at: index)
                            }
                        }
                    }
                }
            }
        }
        
        .safeAreaInset(edge: .bottom) {
            Button(action: {
                let newGroup = TasksGroup(title: "New Group")
                userCreated.append(newGroup)
            }, label: {
                Label("New Group", systemImage: "plus.circle")
            }).buttonStyle(.borderless).foregroundColor(.accentColor).padding().frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
        }
    }
}

#Preview {
    SideBarView(userCreated: .constant(TasksGroup.basicGroups()),
                selection: .constant(.all)).listStyle(.sidebar)
}
