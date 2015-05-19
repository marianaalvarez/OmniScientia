//
//  Historico.swift
//  OmniScientia
//
//  Created by Mariana Alvarez on 19/05/15.
//  Copyright (c) 2015 Mariana Alvarez. All rights reserved.
//

import CloudKit
import UIKit

class Historico: NSObject {
    
    var record : CKRecord!
    weak var database : CKDatabase!
    var usuario : Users
    var criados : NSArray!
    var lidos : NSArray!
    var favoritos : NSArray!
    
    
    init(record : CKRecord, database: CKDatabase) {
        self.record = record
        self.database = database
        self.usuario = record.objectForKey("usuario") as! Users!
        self.criados = record.objectForKey("criados") as! NSArray!
        self.lidos = record.objectForKey("lidos") as! NSArray!
        self.favoritos = record.objectForKey("favoritos") as! NSArray!
        
    }

   
}
