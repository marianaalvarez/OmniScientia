//
//  UsuarioService.swift
//  OmniScientia
//
//  Created by Victor Travassos Ferreira on 5/20/15.
//  Copyright (c) 2015 Mariana Alvarez. All rights reserved.
//

import CoreData

public class UsuarioMOService {
    public static let sharedInstance = UsuarioMOService()
    
    private init(){}
    
    static let entityName = "Usuario"
    var coreDataStack:CoreDataStack = CoreDataStack.sharedInstance
    
    public func novo(#username:String,email:String,senha:String) -> UsuarioMO? {
        println(3.1)
        var usuario = NSEntityDescription.insertNewObjectForEntityForName(UsuarioMOService.entityName, inManagedObjectContext: coreDataStack.managedObjectContext!) as! UsuarioMO
        println(3.2)
        usuario.username = username
        usuario.email = email
        usuario.senha = senha
        println(3.3)
        coreDataStack.saveContext()
        println(3.4)
        
        return usuario
    }
    
    public func buscar() -> [UsuarioMO]? {
        let fetchRequest = NSFetchRequest(entityName: UsuarioMOService.entityName)
        var error:NSError?
        
        let fetchedResults = coreDataStack.managedObjectContext!.executeFetchRequest(fetchRequest, error: &error) as? [NSManagedObject]
        
        if let results = fetchedResults as? [UsuarioMO] {
            return results
        }
        else {
            println("Não foi possivel buscar Usuarios:\(error), \(error!.userInfo)")
        }
            return nil
    }
}
