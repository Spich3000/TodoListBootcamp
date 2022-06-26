//
//  TodoListBootcampApp.swift
//  TodoListBootcamp
//
//  Created by Дмитрий Спичаков on 26.06.2022.
//

import SwiftUI

/*
 MVVM Architecture
 
 Model - data point
 View - UI
 ViewModel - manages Models for View
 
 */
@main
struct TodoListBootcampApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
        }
    }
}
