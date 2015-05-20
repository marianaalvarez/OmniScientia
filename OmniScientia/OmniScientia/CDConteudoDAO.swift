//
//  CKConteudoDAO.swift
//  OmniScientia
//
//  Created by Victor Travassos Ferreira on 5/19/15.
//  Copyright (c) 2015 Mariana Alvarez. All rights reserved.
//

import CoreData

public class CDConteudoDao {
    static let entityName:String = "Conteudo"
    static let sharedInstance = CDConteudoDao()
    
    func novo() -> CDConteudo {
        return NSEntityDescription.insertNewObjectForEntityForName(CDConteudoDao.entityName, inManagedObjectContext: CDManager.sharedInstance.context!) as! CDConteudo
    }
    
    func buscar() -> [CDConteudo]? {
        let fetchRequest = NSFetchRequest(entityName: CDConteudoDao.entityName)
        var error:NSError?
        
        let fetchedResults = CDManager.sharedInstance.context!.executeFetchRequest(fetchRequest, error: &error) as? [NSManagedObject]
        
        if let results = fetchedResults as? [CDConteudo] {
            return results
        } else {
            println("Não foi possivel buscar conteudos: \(error), \(error!.userInfo)")
        }
        
        return nil
        
    }
    
    
    
}