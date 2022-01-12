//
//  TodoListViewModel.swift
//  TodoApp
//
//  Created by Ali Karabay on 1/11/22.
//

import Foundation

class TodoListViewModel: ObservableObject {
    @Published var todoList: [TodoModel] = []
    
    init() {
        todoList.append(contentsOf: [
            TodoModel(title : "item 1", isCompleted: false),
            TodoModel(title : "item 2", isCompleted: false)
        ])
    }
    
    func onMove(indexSet: IndexSet, to: Int) {
        todoList.move(fromOffsets: indexSet, toOffset: to)
    }
    
    func onDelete(indexSet: IndexSet) {
        todoList.remove(atOffsets: indexSet)
    }
    
    func updateItem(item: TodoModel) {
        if let index = todoList.firstIndex(where: {$0.id == item.id}) {
            todoList[index] = item
        }
    }
    
    func onSave(item: TodoModel) {
        if let index = todoList.firstIndex(where: {$0.id == item.id}) {
            todoList[index] = item
            return
        }
        todoList.append(item)
    }
}
