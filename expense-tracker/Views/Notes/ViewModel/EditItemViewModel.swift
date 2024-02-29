//
//  EditItemViewModel.swift
//  expense-tracker
//
//  Created by Иван Чернокнижников on 26.02.2024.
//

import Foundation
import FirebaseFirestore

class EditItemViewViewModel: ObservableObject {
    @Published var name = ""
    @Published var note = ""
    @Published var showAlert = false
    var uuid: String = UIDevice.current.identifierForVendor?.uuidString ?? "none"
    private let noteId: String
    
    init(name: String = "", note: String = "", noteId: String) {
        self.name = name
        self.note = note
        self.noteId = noteId
    }
    func update() {
        
        let db = Firestore.firestore()
        db.collection(uuid).document(noteId).setData(["name": name, "note": note, "date": getDateWithFormat()])
        
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
