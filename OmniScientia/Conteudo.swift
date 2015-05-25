//
//  Conteudo.swift
//  OmniScientia
//
//  Created by Mariana Alvarez on 19/05/15.
//  Copyright (c) 2015 Mariana Alvarez. All rights reserved.
//

import CloudKit
import UIKit

class Conteudo: NSObject {
    
    var record : CKRecord!
    weak var database : CKDatabase!
    var autor : String!
    var data : NSDate!
    var titulo : String!
    var descricao : String!
    var cor : String!
    var objetos : Array<Objetos>!
    
    
    init(record : CKRecord, database: CKDatabase) {
        self.record = record
        self.database = database
        self.autor = record.objectForKey("autor") as! String!
        self.data = record.objectForKey("data") as! NSDate!
        self.titulo = record.objectForKey("titulo") as! String!
        self.descricao = record.objectForKey("descricao") as! String!
        self.cor = record.objectForKey("cor") as! String!
        self.objetos = record.objectForKey("objetos") as! Array<Objetos>!
        
    }
   
}
