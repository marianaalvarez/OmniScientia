//
//  Video.swift
//  OmniScientia
//
//  Created by Mariana Alvarez on 19/05/15.
//  Copyright (c) 2015 Mariana Alvarez. All rights reserved.
//

import CloudKit
import UIKit

class Video: Objetos {
    
    var video : CKAsset!
   
    override init(record : CKRecord, database: CKDatabase) {
        super.init(record: record, database: database)
        self.video = record.objectForKey("video") as! CKAsset!
    }
    
}
