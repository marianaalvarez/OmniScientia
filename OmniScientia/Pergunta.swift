//
//  Pergunta.swift
//  OmniScientia
//
//  Created by Mariana Alvarez on 19/05/15.
//  Copyright (c) 2015 Mariana Alvarez. All rights reserved.
//

import CloudKit
import UIKit

class Pergunta: Objetos {
    
    var pergunta : String!
    var arrayRespostas : NSArray!
    var resposta : Int = 0
    
    init(record : CKRecord, database: CKDatabase) {
        super.init()
        super.record = record
        super.database = database
        self.pergunta = record.objectForKey("pergunta") as! String!
        self.arrayRespostas = record.objectForKey("arrayRespostas") as! NSArray!
        self.resposta = record.objectForKey("resposta") as! Int!
    }
   
}
