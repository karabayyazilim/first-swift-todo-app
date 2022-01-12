//
//  AddTodoViewModel.swift
//  TodoApp
//
//  Created by Ali Karabay on 1/12/22.
//

import Foundation

class AddTodoViewModel: ObservableObject {
    @Published var title: String = ""
    
    func canSave() -> Bool {
        if title.isEmpty {
            return false
        } else if title.count < 5 {
            return false
        }
        return true
    }
    
    func getTodo(id: String = UUID().uuidString) -> TodoModel {
        return TodoModel(id: id, title: title, isCompleted: false)
    }
}
