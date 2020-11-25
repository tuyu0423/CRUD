//
//  Json.swift
//  CRUD
//
//  Created by User12 on 2020/11/25.
//

import SwiftUI

struct Json: View {
    var body: some View {
        let encoder = JSONEncoder()
        do{
            let data = try encoder.encode(tododata)
        }catch{
            
        }
    }
}

struct Json_Previews: PreviewProvider {
    static var previews: some View {
        Json()
    }
}
