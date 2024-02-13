//
//  expense_trackerApp.swift
//  expense-tracker
//
//  Created by Иван Чернокнижников on 13.02.2024.
//

import SwiftUI

@main
struct expense_trackerApp: App {
    var coreDataStack = CoreDataStack(containerName: "ExpenseTracker")

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, coreDataStack.viewContext)
        }
    }
}
