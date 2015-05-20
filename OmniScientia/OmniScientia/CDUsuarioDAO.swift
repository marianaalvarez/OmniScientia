//
//  CDUsuarioDAO.swift
//  OmniScientia
//
//  Created by Victor Travassos Ferreira on 5/20/15.
//  Copyright (c) 2015 Mariana Alvarez. All rights reserved.
//

import CoreData

public class CDUsuarioDAO {
    static let sharedInstance = CDUsuarioDAO()
    
    static let entityName = "Usuario"
    
    func salvar()
    {
        CDManager.sharedInstance.saveContext()
    }
    
    func novo() -> CDUsuario {
        return NSEntityDescription.insertNewObjectForEntityForName(CDUsuarioDAO.entityName, inManagedObjectContext: CDManager.sharedInstance.context!) as! CDUsuario
    }
    
    func buscar() -> [CDUsuario]? {
        let fetchRequest = NSFetchRequest(entityName: CDUsuarioDAO.entityName)
        var error:NSError?
        
        let fetchedResults = CDManager.sharedInstance.context!.executeFetchRequest(fetchRequest, error: &error) as? [NSManagedObject]
        
        if let results = fetchedResults as? [CDUsuario] {
            return results
        }
        else {
            println("Não foi possivel buscar Usuarios:\(error), \(error!.userInfo)")
        }
            return nil
    }
}
