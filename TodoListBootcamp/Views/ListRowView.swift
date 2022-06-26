//
//  ListRowView.swift
//  TodoListBootcamp
//
//  Created by Дмитрий Спичаков on 26.06.2022.
//

import SwiftUI

struct ListRowView: View {
    
    let title: String
    
    var body: some View {
        HStack {
            Image(systemName: "checkmark.circle")
            Text(title)
            Spacer()
        }
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        ListRowView(title: "First title")
    }
}
