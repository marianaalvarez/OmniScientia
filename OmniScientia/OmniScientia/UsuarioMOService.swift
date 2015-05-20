//
//  UsuarioService.swift
//  OmniScientia
//
//  Created by Victor Travassos Ferreira on 5/20/15.
//  Copyright (c) 2015 Mariana Alvarez. All rights reserved.
//

import CoreData

public class UsuarioService {
    static let sharedInstance = UsuarioService()
    
    static let entityName = "Usuario"
    
    func salvar()
    {
        CoreDataManager.sharedInstance.saveContext()
    }
    
    func novo() -> UsuarioMO {
        return NSEntityDescription.insertNewObjectForEntityForName(UsuarioService.entityName, inManagedObjectContext: CoreDataManager.sharedInstance.context!) as! UsuarioMO
    }
    
    func buscar() -> [UsuarioMO]? {
        let fetchRequest = NSFetchRequest(entityName: UsuarioService.entityName)
        var error:NSError?
        
        let fetchedResults = CoreDataManager.sharedInstance.context!.executeFetchRequest(fetchRequest, error: &error) as? [NSManagedObject]
        
        if let results = fetchedResults as? [UsuarioMO] {
            return results
        }
        else {
            println("Não foi possivel buscar Usuarios:\(error), \(error!.userInfo)")
        }
            return nil
    }
}
