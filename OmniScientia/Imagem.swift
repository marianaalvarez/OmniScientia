//
//  Imagem.swift
//  OmniScientia
//
//  Created by Mariana Alvarez on 19/05/15.
//  Copyright (c) 2015 Mariana Alvarez. All rights reserved.
//

import CloudKit
import UIKit

class Imagem: Objetos {
    
    var imagem : CKAsset!
    
    init(record : CKRecord, database: CKDatabase) {
        super.init()
        super.record = record
        super.database = database
        self.imagem = record.objectForKey("imagem") as! CKAsset!
    }
   
}
