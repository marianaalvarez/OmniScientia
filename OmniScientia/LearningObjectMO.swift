//
//  LearningObjectMO.swift
//  OmniScientia
//
//  Created by Guilherme Ferreira de Souza on 6/22/15.
//  Copyright (c) 2015 Mariana Alvarez. All rights reserved.
//

import Foundation
import CoreData

class LearningObjectMO: NSManagedObject {

    @NSManaged var height: NSNumber
    @NSManaged var width: NSNumber
    @NSManaged var x: NSNumber
    @NSManaged var y: NSNumber
    @NSManaged var conteudo: ConteudoMO

}
