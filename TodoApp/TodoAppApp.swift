//
//  TodoAppApp.swift
//  TodoApp
//
//  Created by Ali Karabay on 1/11/22.
//

import SwiftUI

@main
struct TodoAppApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView{
                TodoListView()
            }
        }
    }
}
