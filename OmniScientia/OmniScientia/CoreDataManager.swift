import CoreData

public class CoreDataManager {
    
    public static let sharedInstance = CoreDataManager()
    
    static let applicationName:String = "OmniScientia"
    
    public var managedObjectModel: NSManagedObjectModel = {
        var modelPath = NSBundle.mainBundle().pathForResource(CoreDataManager.applicationName, ofType: "momd")
        var modelURL = NSURL.fileURLWithPath(modelPath!)
        
        var model = NSManagedObjectModel(contentsOfURL: modelURL!)!
        
        return model
    }()
    
    var applicationDocumentsDirectory: NSURL = {
        let urls = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        return urls[urls.count-1] as! NSURL
    }()
    
    public lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator? = {
            println("Providenciando Persistent Store Coordinator")
            
            let url = self.applicationDocumentsDirectory.URLByAppendingPathComponent(CoreDataManager.applicationName)
            var options = [NSInferMappingModelAutomaticallyOption: true,NSMigratePersistentStoresAutomaticallyOption: true]
            var error: NSError? = nil
            
            var psc: NSPersistentStoreCoordinator? = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
            var ps = psc!.addPersistentStoreWithType(NSSQLiteStoreType, configuration:nil, URL: url, options: options, error: &error)
            
            if (ps == nil) {
                abort()
            }
            
            return psc
    }()
    
    public lazy var context:NSManagedObjectContext? = {
        var context: NSManagedObjectContext = NSManagedObjectContext(concurrencyType: NSManagedObjectContextConcurrencyType.PrivateQueueConcurrencyType)
        context.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        context.persistentStoreCoordinator = self.persistentStoreCoordinator
        
        return context
        
    }()
    
    public func saveContext(){
        
        self.context?.performBlock({
        
            var error:NSError? = nil
            
            if self.context!.hasChanges && !self.context!.save(&error) {
                println("Não foi possivel salvar: \(error), \(error?.userInfo)")
            }
        })

    }
    
    
    
    
}