//
//  GrupoEstudo.swift
//  OmniScientia
//
//  Created by Mariana Alvarez on 19/05/15.
//  Copyright (c) 2015 Mariana Alvarez. All rights reserved.
//

import CloudKit
import UIKit

class GrupoEstudo: NSObject {
    
    var record : CKRecord!
    weak var database : CKDatabase!
    var conteudo : Conteudo
    var usuarios : Array<Usuario>!

    
    init(record : CKRecord, database: CKDatabase) {
        self.record = record
        self.database = database
        self.conteudo = record.objectForKey("conteudo") as! Conteudo!
        self.usuarios = record.objectForKey("usuarios") as! Array<Usuario>!

    }
   
}
