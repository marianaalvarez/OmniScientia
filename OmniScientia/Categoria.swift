//
//  Categoria.swift
//  OmniScientia
//
//  Created by Mariana Alvarez on 19/05/15.
//  Copyright (c) 2015 Mariana Alvarez. All rights reserved.
//

import CloudKit
import UIKit

class Categoria: NSObject {
    
    var record : CKRecord!
    weak var database : CKDatabase!
    var categoria : String!
    
    
    init(record : CKRecord, database: CKDatabase) {
        self.record = record
        self.database = database
        self.categoria = record.objectForKey("categoria") as! String!
        
    }
    
   
}
