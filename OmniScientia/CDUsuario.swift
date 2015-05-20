//
//  CDUsuario.swift
//  OmniScientia
//
//  Created by Victor Travassos Ferreira on 5/20/15.
//  Copyright (c) 2015 Mariana Alvarez. All rights reserved.
//

import Foundation
import CoreData

public class CDUsuario: NSManagedObject {

    @NSManaged var dataNasc: NSDate
    @NSManaged var email: String
    @NSManaged var nome: String
    @NSManaged var senha: String
    @NSManaged var sexo: String
    @NSManaged var username: String

}
