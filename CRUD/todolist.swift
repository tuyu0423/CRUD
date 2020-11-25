//
//  todolist.swift
//  CRUD
//
//  Created by User12 on 2020/11/25.
//

import SwiftUI

struct todolist: View {
    @StateObject var Tododata = tododata()
    @State private var showEditor = false
    
    var body: some View {
        NavigationView{
            List{
                ForEach(Tododata.todos.indices,id: \.self){
                    (index)in
                    
                    NavigationLink(
                        
                        destination:
                        todoeditor( edittodoIndex: index, tododata: Tododata),
                        label: {
                            todorow(Todo: Tododata.todos[index])
                        }
                    )
                }
                .onDelete(perform: { indexSet in
                    Tododata.todos.remove(atOffsets:indexSet)
                })
            }
            .navigationTitle("待辦事項")
            .toolbar(content: {
                ToolbarItem(placement:.navigationBarTrailing){
                    Button(action: {showEditor = true}, label: {
                        Image(systemName: "plus.circle.fill")
                    })
                    }
                ToolbarItem(placement: .navigationBarLeading){
                    EditButton()
                }
            })
            .sheet(isPresented: $showEditor, content: {
                NavigationView{
                    todoeditor(tododata: Tododata)
                }
            })
        }
    }
}

struct todolist_Previews: PreviewProvider {
    static var previews: some View {
        todolist()
    }
}
