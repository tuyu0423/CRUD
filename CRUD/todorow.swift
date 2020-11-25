//
//  todorow.swift
//  CRUD
//
//  Created by User12 on 2020/11/25.
//

import SwiftUI

struct todorow: View {
    var Todo: todo
    var body: some View {
        HStack{
            Text(Todo.name)
            Spacer()
            Text("\(Todo.deadline) day")
            Image(systemName: Todo.done ?
                "checkmark": "xmark")
        }
    }
}

struct todorow_Previews: PreviewProvider {
    static var previews: some View {
        todorow(Todo: todo(deadline: 0, done: false, name:"Get a girlfriend"))
    }
}
