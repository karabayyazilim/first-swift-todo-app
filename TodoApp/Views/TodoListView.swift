//
//  TodoListView.swift
//  TodoApp
//
//  Created by Ali Karabay on 1/11/22.
//

import SwiftUI

struct TodoListView: View {
    @StateObject var todoListVM = TodoListViewModel()
    
    var body: some View {
        List{
            ForEach(todoListVM.todoList) {item in
                TodoListRowView(todo: item, onComplatedToggle: {
                    todoListVM.updateItem(item: item.onComplatedToggle())
                })
            }.onDelete(perform: todoListVM.onDelete).onMove(perform: todoListVM.onMove)
        }.navigationTitle("Todo List")
            .navigationBarItems(leading: EditButton(), trailing: NavigationLink(
                                    destination: AddItemView{ todo in
                                        todoListVM.onSave(item: todo)
                                    },
                                    isActive: /*@START_MENU_TOKEN@*/.constant(true)/*@END_MENU_TOKEN@*/,
                                    label: {
                                        Text("Add Item")
                                    }))
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            TodoListView()
        }
    }
}
