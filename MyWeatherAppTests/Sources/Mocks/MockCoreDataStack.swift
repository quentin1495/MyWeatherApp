@testable import MyWeatherApp
import Foundation
import CoreData

class MockCoreDataStack: CoreDataStack {
    override lazy var persistentContainer: NSPersistentContainer = {
        let modelName = "MyWeatherApp"
        let persistentStoreDescription = NSPersistentStoreDescription()
        persistentStoreDescription.type = NSInMemoryStoreType
        let container = NSPersistentContainer(name: modelName)
        container.persistentStoreDescriptions = [persistentStoreDescription]

        container.loadPersistentStores { (_, error) in
            if let error = error {
                fatalError("\(error)")
            }
        }
        return container
    }()
}
