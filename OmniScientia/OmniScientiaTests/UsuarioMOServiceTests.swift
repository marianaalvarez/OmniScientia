//
//  ConteudoServiceTests.swift
//  OmniScientia
//
//  Created by Victor Travassos Ferreira on 5/20/15.
//  Copyright (c) 2015 Mariana Alvarez. All rights reserved.
//

import UIKit
import XCTest
import CoreData
import OmniScientia

class UsuarioMOServiceTests: XCTestCase {
    
    var usuarioMOService: UsuarioMOService!

    override func setUp() {
        super.setUp()

        usuarioMOService = UsuarioMOService.sharedInstance

    }
    
    override func tearDown() {
        super.tearDown()
        usuarioMOService = nil
    }

    func testAdicionaUsuario() {

        var usuario = usuarioMOService.novo(username:"Mariana", email: "Mariana", senha: "Mariana")

        XCTAssertNotNil(usuario, "Não pode ser nulo")

        XCTAssertTrue(usuario!.username == "Mariana")

        XCTAssertTrue(usuario?.email == "Mariana")

        XCTAssertTrue(usuario?.senha == "Mariana")
        
        usuarioMOService.coreDataStack.saveContext()

    }

}
