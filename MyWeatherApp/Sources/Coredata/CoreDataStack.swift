//
//  CoreDataStack.swift
//  MyWeatherApp
//
//  Created by Quentin Prevost on 02/03/2018.
//  Copyright © 2018 Quentin Prevost. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {
    // MARK: Properties
    static let shared = CoreDataStack()

    var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "MyWeatherApp")
        container.loadPersistentStores(completionHandler: { (_, error) in
            if let error = error {
                fatalError("Error - CoreDataStack.persistentContainer : \(error)")
            }
        })
        return container
    }()

    lazy var mainContext: NSManagedObjectContext = {
        return persistentContainer.viewContext
    }()

    /// Creates a private managed object context.
    /// - Returns: NSManagedObjectContext
    func newDerivedContext() -> NSManagedObjectContext {
        let context = persistentContainer.newBackgroundContext()
        return context
    }

    /// Save the context
    func saveContext() {
        saveContext(mainContext)
    }

    /// Save the context
    /// - Parameter context: Context
    func saveContext(_ context: NSManagedObjectContext) {
        if context != mainContext {
            saveDerivedContext(context)
            return
        }

        context.perform {
            do {
                try context.save()
            } catch {
                fatalError("Error - CoreDataStack.saveContext(_ context: NSManagedObjectContext: \(error)")
            }
        }
    }

    // MARK: Private Functions
    private func saveDerivedContext(_ context: NSManagedObjectContext) {
        context.perform {
            do {
                try context.save()
            } catch {
                fatalError("Error - CoreDataStack.saveDerivedContext(_ context: NSManagedObjectContext: \(error)")
            }

            self.saveContext(self.mainContext)
        }
    }
}
