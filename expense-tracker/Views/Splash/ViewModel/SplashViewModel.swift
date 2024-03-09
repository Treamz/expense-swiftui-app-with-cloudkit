//
//  SplashViewModel.swift
//  expense-tracker
//
//  Created by Иван Чернокнижников on 08.03.2024.
//
import Foundation
import FirebaseFirestore

import Firebase
import CoreTelephony


class SplashViewModel : ObservableObject {
    
    @Published var showingNewItemView = false
    
    @Published var isReady = false;
    @Published var isFalse: Bool? = true;
    @Published var data: String? 


    
    func getStatus() {

        let db = Firestore.firestore()
        
        
        

        db.collection("data").document("data").getDocument { snapshot, error in
            print("\(String(describing: snapshot!.data()))")
            var snapshotValue = snapshot!.data()
            self.isFalse = snapshotValue!["isFalse"] as? Bool
            self.data = snapshotValue!["link"] as? String
            self.isReady = true
        }
    }
    
}
