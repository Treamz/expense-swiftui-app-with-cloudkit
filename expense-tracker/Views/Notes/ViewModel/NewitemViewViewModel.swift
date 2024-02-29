//
//  NewitemViewViewModel.swift
//  expense-tracker
//
//  Created by Иван Чернокнижников on 26.02.2024.
//


import Foundation
import FirebaseFirestore

class NewItemViewViewModel: ObservableObject {
    @Published var name = ""
    @Published var note = ""
    @Published var showAlert = false

    
    init() {}
    
    func save() {
        guard canSave else {
            return
        }
        // Get current user id
        let uuid: String = UIDevice.current.identifierForVendor?.uuidString ?? "none"
        
        print("\(uuid)")

        
        // Create model
        let newId = UUID().uuidString
        let newItem = Note(id: newId, name: name, note: note,date: getDateWithFormat())
        
        // Save model
        let db = Firestore.firestore()
        
        db.collection(uuid)
            .addDocument(data: ["name": name, "note": note, "date": getDateWithFormat()])
        
    }


    var canSave: Bool {
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
    
        return true
    }
    private func getDateWithFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = Date()
        let formattedDate = dateFormatter.string(from: date)
        return formattedDate
    }
}
