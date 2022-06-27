//
//  ItemModel.swift
//  TodoListBootcamp
//
//  Created by Дмитрий Спичаков on 26.06.2022.
//

import Foundation

struct ItemModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let isCompleted: Bool
}
