//
//  Users.swift
//  OmniScientia
//
//  Created by Mariana Alvarez on 19/05/15.
//  Copyright (c) 2015 Mariana Alvarez. All rights reserved.
//

import CloudKit
import UIKit

class Users: NSObject {
    
    var record : CKRecord!
    weak var database : CKDatabase!
    var usuario : String!
    var senha : String!
    var nome : String!
    var email : String!
    var sexo : String!
    var dataNascimento : NSDate!
    
    init(record : CKRecord, database: CKDatabase) {
        self.record = record
        self.database = database
        self.usuario = record.objectForKey("usuario") as! String!
        self.senha = record.objectForKey("senha") as! String!
        self.nome = record.objectForKey("nome") as! String!
        self.email = record.objectForKey("email") as! String!
        self.sexo = record.objectForKey("sexo") as! String!
        self.dataNascimento = record.objectForKey("dataNascimento") as! NSDate!
    }
   
}
