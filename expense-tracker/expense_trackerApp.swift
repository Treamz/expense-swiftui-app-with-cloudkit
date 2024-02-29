//
//  expense_trackerApp.swift
//  expense-tracker
//
//  Created by Иван Чернокнижников on 13.02.2024.
//

import SwiftUI
import Firebase

@main
struct expense_trackerApp: App {
    var coreDataStack = CoreDataStack(containerName: "ExpenseTracker")

    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, coreDataStack.viewContext)
        }
    }
}
