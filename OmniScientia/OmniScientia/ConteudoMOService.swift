//
//  ConteudoService.swift
//  OmniScientia
//
//  Created by Victor Travassos Ferreira on 5/19/15.
//  Copyright (c) 2015 Mariana Alvarez. All rights reserved.
//

import CoreData

public class ConteudoMOService {
    static let entityName:String = "Conteudo"
    public static let sharedInstance = ConteudoMOService()
    public var coreDataStack = CoreDataStack.sharedInstance
    
    public func novo() -> ConteudoMO {
        return NSEntityDescription.insertNewObjectForEntityForName(ConteudoMOService.entityName, inManagedObjectContext: coreDataStack.managedObjectContext!) as! ConteudoMO
    }
    
    public func listarTodos() -> [ConteudoMO]? {
        let fetchRequest = NSFetchRequest(entityName: ConteudoMOService.entityName)
        var error:NSError?
        
        let fetchedResults = coreDataStack.managedObjectContext!.executeFetchRequest(fetchRequest, error: &error) as? [NSManagedObject]
        
        if let results = fetchedResults as? [ConteudoMO] {
            return results
        } else {
            println("Não foi possivel buscar conteudos: \(error), \(error!.userInfo)")
        }
        
        return nil
        
    }
    
    public func listarFavoritos() -> [ConteudoMO]? {
        
        let fetchRequest = NSFetchRequest(entityName: ConteudoMOService.entityName)
        var error:NSError?
        
        fetchRequest.predicate = NSPredicate(format: "favoritado == %@", true)
        
        let fetchedResults = coreDataStack.managedObjectContext!.executeFetchRequest(fetchRequest, error: &error) as? [NSManagedObject]
        
        if let results = fetchedResults as? [ConteudoMO] {
            return results
        } else {
            println("Não foi possivel buscar conteudos: \(error), \(error!.userInfo)")
        }
        
        return nil
    }
    
    
    
    
    
}