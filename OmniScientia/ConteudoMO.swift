//
//  ConteudoMO
//  OmniScientia
//
//  Created by Victor Travassos Ferreira on 5/20/15.
//  Copyright (c) 2015 Mariana Alvarez. All rights reserved.
//

import Foundation
import CoreData

public class ConteudoMO: NSManagedObject {

    @NSManaged public var backgroundImage: NSData
    @NSManaged public var cor: String
    @NSManaged public var descricao: String
    @NSManaged public var titulo: String

}
