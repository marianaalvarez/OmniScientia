//
//  UsuarioMO
//  OmniScientia
//
//  Created by Victor Travassos Ferreira on 5/20/15.
//  Copyright (c) 2015 Mariana Alvarez. All rights reserved.
//

import Foundation
import CoreData

public class UsuarioMO: NSManagedObject {

    @NSManaged public var dataNasc: NSDate
    @NSManaged public var email: String
    @NSManaged public var nome: String
    @NSManaged public var senha: String
    @NSManaged public var sexo: String
    @NSManaged public var username: String

}
