//
//  TodoModel.swift
//  TodoApp
//
//  Created by Ali Karabay on 1/11/22.
//

import Foundation

struct TodoModel: Identifiable {
    let id: String
    let title: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func onComplatedToggle() -> TodoModel{
        return TodoModel(id: id, title: title, isCompleted: !isCompleted)
    }
}
