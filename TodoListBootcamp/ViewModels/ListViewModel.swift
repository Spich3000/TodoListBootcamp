//
//  ListViewModel.swift
//  TodoListBootcamp
//
//  Created by Дмитрий Спичаков on 27.06.2022.
//

import Foundation

/*
 CRUD FUNCTIONS
 
 Create
 Read
 Update
 Delete
 
 */

class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = [] {
        // every time items changed we call our save function with didSet
        didSet {
            saveItems()
        }
    }
    let itemsKey = "items_list"
    
    init() {
        getItems()
    }
    
    func getItems() {
        // fake data for beginning
        /*
         let newItems = [
         ItemModel(title: "This is the first title", isCompleted: false),
         ItemModel(title: "This is the second", isCompleted: true),
         ItemModel(title: "Third", isCompleted: false),
         ]
         items.append(contentsOf: newItems)
         */
        
        // Check data
        guard let data = UserDefaults.standard.data(forKey: itemsKey) else { return }
        
        // Try to decode data
        /*
         // [ItemModel].self - type of ItemModel, not the actual Item Model! thats why "self"\
         
         // We can add all 2 statements in to the guard:
         guard
         let data = UserDefaults.standard.data(forKey: itemsKey),
         let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
         else { return }
         
         // But i write it like this to clearly understand whats going on
         */
        guard let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data) else { return }
        
        self.items = savedItems
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel) {
        // commented code below is equals!! with uncommented
        /*
         if let index = items.firstIndex { (existingItem) -> Bool in
         return existingItem.id == item.id
         } {
         // run this code
         items[index] = ItemModel(title: item.title, isCompleted: !item.isCompleted)
         }
         */
        
        if let index = items.firstIndex(where: { $0.id == item.id}) {
            // run this code
            items[index] = item.updateCompletion()
        }
    }
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
}
