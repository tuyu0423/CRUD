//
//  SwiftUIView.swift
//  CRUD
//
//  Created by User12 on 2020/11/25.
//

import SwiftUI

struct todoeditor: View {
    @Environment(\.presentationMode) var
        presentationMode
    var edittodoIndex: Int?
    var tododata :tododata
    @State private var name = "空白"
    @State private var deadline = 0
    @State private var done = false
    
    var body: some View {
        Form{
            TextField("待辦事項",text:$name)
            Stepper("截止時間  \(deadline)", value:$deadline,in:1...30)
            Toggle("完成",isOn: $done)
        }
        .onAppear(perform: {
         if let edittodoIndex =
            edittodoIndex{
            let edit_todo = tododata.todos[edittodoIndex]
            name = edit_todo.name
            deadline = edit_todo.deadline
            done = edit_todo.done
         }
        })
        .navigationBarTitle(edittodoIndex == nil ? "Add new todo" : "Edit todo")
        .toolbar(content: {
            ToolbarItem{
                Button("save"){
                    let Todo = todo(deadline: deadline, done: done, name: name)
                    if let edittodoIndex =
                        edittodoIndex{
                        tododata.todos[edittodoIndex]=Todo
                    }
                    else{
                        tododata.todos
                            .insert(Todo, at: 0)
                    }
                    presentationMode
                        .wrappedValue.dismiss()
                }
            }
        })
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        todoeditor(tododata: tododata())
    }
}
