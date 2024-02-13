//
//  CoreDataStack.swift
//  expense-tracker
//
//  Created by Иван Чернокнижников on 13.02.2024.
//


import CoreData

class CoreDataStack {
    
    private let containerName: String
    var viewContext: NSManagedObjectContext { persistentContainer.viewContext }
    
    
    private lazy var persistentContainer: NSPersistentCloudKitContainer = {
        let container = NSPersistentCloudKitContainer(name: containerName)
        guard let persistentStoreDescription = container.persistentStoreDescriptions.first else {
                           fatalError("\(#function): Failed to retrieve a persistent store description.")
                       }
                       persistentStoreDescription
                           .setOption(true as NSNumber, forKey: NSPersistentHistoryTrackingKey)
                       persistentStoreDescription
                           .setOption(true as NSNumber, forKey: NSPersistentStoreRemoteChangeNotificationPostOptionKey)

        container.viewContext.mergePolicy = NSMergeByPropertyStoreTrumpMergePolicy
        container.viewContext.automaticallyMergesChangesFromParent = true
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                print(error.localizedDescription)
            }
            print(storeDescription)
        })
        return container
    }()
    
    init(containerName: String) {
        self.containerName = containerName
        _ = persistentContainer
    }
}

extension NSManagedObjectContext {
    
    func saveContext() throws {
        guard hasChanges else { return }
        try save()
    }
}
