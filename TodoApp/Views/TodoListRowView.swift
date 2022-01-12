//
//  TodoListRowView.swift
//  TodoApp
//
//  Created by Ali Karabay on 1/11/22.
//

import SwiftUI

struct TodoListRowView: View {
    let todo: TodoModel
    let onComplatedToggle: () -> Void
    var body: some View {
        HStack{
            Button (action: onComplatedToggle, label: {
                Image(systemName: todo.isCompleted ? "checkmark.circle" :"circle")
                    .foregroundColor(todo.isCompleted ? .green  : Color(UIColor.placeholderText))
            })
            Text(todo.title)
                .strikethrough(todo.isCompleted)
            Spacer()
        }
    }
}

struct TodoListRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TodoListRowView(todo: TodoModel(title: "Test Item", isCompleted: true), onComplatedToggle: {})
            TodoListRowView(todo: TodoModel(title: "Test Item", isCompleted: false), onComplatedToggle: {})
        }.previewLayout(.sizeThatFits)
    }
}
