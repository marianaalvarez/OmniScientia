import CoreData

class CoreDataStack {
    
    static let sharedInstance = CoreDataStack()
    let nameApp:String = "OmniScientia"
    let context:NSManagedObjectContext
    let psc:NSPersistentStoreCoordinator
    let model:NSManagedObjectModel
    let store:NSPersistentStore?
    
    class func applicationDocumentsDirectory() -> NSURL {
        
        let fileManager = NSFileManager.defaultManager()
        
        let urls = fileManager.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask) as! [NSURL]
        
        return urls[0]
    }
    
    init() {
        let bundle = NSBundle.mainBundle()
        let modelURL = bundle.URLForResource(nameApp, withExtension: "momd")
        model = NSManagedObjectModel(contentsOfURL: modelURL!)!
        
        psc = NSPersistentStoreCoordinator(managedObjectModel: model)
        
        context = NSManagedObjectContext()
        
        context.persistentStoreCoordinator = psc
        
        let documentsURL = CoreDataStack.applicationDocumentsDirectory()
        
        let storeURL =
        documentsURL.URLByAppendingPathComponent(nameApp)
        
        let options = [NSMigratePersistentStoresAutomaticallyOption: true]
        
        var error:NSError? = nil
        
        store = psc.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: storeURL, options: options, error: &error)
        
        if store == nil {
            println("Erro ao adicionar persistent store: \(error)")
            abort()
        }
        
    }
    
    func saveContext(){
        var error:NSError? = nil
        
        if context.hasChanges && !context.save(&error) {
            println("Não foi possivel salvar: \(error), \(error?.userInfo)")
        }
    }
}