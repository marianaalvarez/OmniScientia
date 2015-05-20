//
//  CDConteudo.swift
//  OmniScientia
//
//  Created by Victor Travassos Ferreira on 5/20/15.
//  Copyright (c) 2015 Mariana Alvarez. All rights reserved.
//

import Foundation
import CoreData

public class CDConteudo: NSManagedObject {

    @NSManaged var backgroundImage: NSData
    @NSManaged var cor: String
    @NSManaged var descricao: String
    @NSManaged var titulo: String

}
