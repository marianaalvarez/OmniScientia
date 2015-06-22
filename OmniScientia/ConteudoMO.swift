//
//  ConteudoMO.swift
//  OmniScientia
//
//  Created by Victor Travassos Ferreira on 5/22/15.
//  Copyright (c) 2015 Mariana Alvarez. All rights reserved.
//

import Foundation
import CoreData

public class ConteudoMO: NSManagedObject {

    @NSManaged var backgroundImage: NSData
    @NSManaged var cor: String
    @NSManaged var descricao: String
    @NSManaged var titulo: String
    @NSManaged var learningObjects: NSSet

    public func addLearningObject(#learningObject:LearningObjectMO){
        var auxLearningObjectsSet = learningObjects.copy() as! NSMutableSet
        
        auxLearningObjectsSet.addObject(learningObjects)
        
        learningObjects = auxLearningObjectsSet.copy() as! NSSet
        
        CoreDataStack.sharedInstance.saveContext()
    }
    
    public func createLearningObject(#entityName:String)->LearningObjectMO? {
        var learningObject = NSEntityDescription.insertNewObjectForEntityForName(entityName, inManagedObjectContext: CoreDataStack.sharedInstance.managedObjectContext!) as? LearningObjectMO
        
        return learningObject
    }
    
    

}
