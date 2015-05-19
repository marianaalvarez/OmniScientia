//
//  Texto.swift
//  OmniScientia
//
//  Created by Mariana Alvarez on 19/05/15.
//  Copyright (c) 2015 Mariana Alvarez. All rights reserved.
//

import CloudKit
import UIKit

class Texto: Objetos {
    
    var texto : String!
    
    init(record : CKRecord, database: CKDatabase) {
        super.init()
        super.record = record
        super.database = database
        self.texto = record.objectForKey("texto") as! String!
    }
   
}
