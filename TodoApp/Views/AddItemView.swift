//
//  AddItemView.swift
//  TodoApp
//
//  Created by Ali Karabay on 1/11/22.
//

import SwiftUI

struct AddItemView: View {
    @Environment(\.presentationMode) var presentationMode
    let onSave: (_ todo: TodoModel) -> Void
    let id: String = UUID().uuidString
    @StateObject var addTodoVm = AddTodoViewModel()
    var body: some View {
        VStack {
            ScrollView {
                TextField("Todo", text: $addTodoVm.title)
                    .padding()
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(12)
            }
            Button {
                if addTodoVm.canSave() {
                    onSaveClick()
                }
            } label: {
                Text("Save")
                    .foregroundColor(.white)
                    .font(.headline)
                    .frame(height: 56)
                    .frame(maxWidth: .infinity)
                    .background(Color(UIColor.systemBlue))
                    .cornerRadius(12)
            }
        }.padding()
        .navigationTitle("Add Todo")
    }
    func onSaveClick() {
        let todo: TodoModel = addTodoVm.getTodo()
        onSave(todo)
        presentationMode.wrappedValue.dismiss()
    }
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddItemView { todo in
            
        }
    }
}
