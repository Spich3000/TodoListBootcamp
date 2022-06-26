//
//  AddView.swift
//  TodoListBootcamp
//
//  Created by Дмитрий Спичаков on 26.06.2022.
//

import SwiftUI

struct AddView: View {
    
    @State var textFieldText = ""
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something", text: $textFieldText )
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)))
                    .cornerRadius(10)
                
                Button {
                    
                } label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                }
            }
            .padding(14)
        }
        .navigationTitle("Add an item")
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
    }
}
