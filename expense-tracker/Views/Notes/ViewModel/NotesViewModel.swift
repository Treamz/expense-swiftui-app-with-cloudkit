//
//  NotesViewModel.swift
//  expense-tracker
//
//  Created by Иван Чернокнижников on 26.02.2024.
//

import Foundation
import FirebaseFirestore

import Firebase

class NotesViewModel : ObservableObject {
    
    @Published var showingNewItemView = false
    

    
    func delete(id: String) {
        let uuid: String = UIDevice.current.identifierForVendor?.uuidString ?? "none"

        let db = Firestore.firestore()
        

        db.collection(uuid).document(id).delete()
    }
}
