//
//  Objetos.swift
//  OmniScientia
//
//  Created by Mariana Alvarez on 19/05/15.
//  Copyright (c) 2015 Mariana Alvarez. All rights reserved.
//

import CloudKit
import UIKit

class Objetos: NSObject {
    
    var record : CKRecord!
    weak var database : CKDatabase!
    
    init(record : CKRecord, database: CKDatabase) {
        self.record = record
        self.database = database
    }
   
}
