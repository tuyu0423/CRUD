//
//  SwiftUIView.swift
//  CRUD
//
//  Created by User12 on 2020/11/25.
//


import Foundation
typealias Codable = Decodable & Encodable
struct todo : Identifiable, Codable{
    var id = UUID()
        var deadline:Int
        var done: Bool
        var name: String
}
