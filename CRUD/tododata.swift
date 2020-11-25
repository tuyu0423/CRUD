//
//  tododata.swift
//  CRUD
//
//  Created by User12 on 2020/11/25.
//

import Foundation
import SwiftUI
class tododata: ObservableObject {
    @AppStorage("todos") var  Tododata : Data?
    init() {
        if let Tododata = Tododata{
            let decoder = JSONDecoder()
            if let decodedData = try? decoder.decode([todo].self,from: Tododata){
                todos = decodedData
            }
        }
    }
    @Published var todos = [todo](){
        didSet{
            let encoder = JSONEncoder()
            do{
                let data = try encoder.encode(todos)
                Tododata = data
            }catch{
                
            }
        }
    }
    
}
