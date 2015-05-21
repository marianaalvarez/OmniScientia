//
//  ConteudoService.swift
//  OmniScientia
//
//  Created by Victor Travassos Ferreira on 5/19/15.
//  Copyright (c) 2015 Mariana Alvarez. All rights reserved.
//

import CoreData

public class ConteudoService {
    static let entityName:String = "Conteudo"
    static let sharedInstance = ConteudoService()
    
    func novo() -> ConteudoMO {
        return NSEntityDescription.insertNewObjectForEntityForName(ConteudoService.entityName, inManagedObjectContext: CoreDataManager.sharedInstance.context!) as! ConteudoMO
    }
    
    func buscar() -> [ConteudoMO]? {
        let fetchRequest = NSFetchRequest(entityName: ConteudoService.entityName)
        var error:NSError?
        
        let fetchedResults = CoreDataManager.sharedInstance.context!.executeFetchRequest(fetchRequest, error: &error) as? [NSManagedObject]
        
        if let results = fetchedResults as? [ConteudoMO] {
            return results
        } else {
            println("Não foi possivel buscar conteudos: \(error), \(error!.userInfo)")
        }
        
        return nil
        
    }
    
    
    
}