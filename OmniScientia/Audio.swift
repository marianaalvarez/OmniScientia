//
//  Audio.swift
//  OmniScientia
//
//  Created by Mariana Alvarez on 19/05/15.
//  Copyright (c) 2015 Mariana Alvarez. All rights reserved.
//

import CloudKit
import UIKit

class Audio: Objetos {
    
    var audio : CKAsset!
    
    override init(record : CKRecord, database: CKDatabase) {
        super.init(record: record, database: database)
        super.record = record
        super.database = database
        self.audio = record.objectForKey("audio") as! CKAsset!
    }
}
