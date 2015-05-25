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
        println(1)
        usuarioMOService = UsuarioMOService.sharedInstance
        println(2)
    }
    
    override func tearDown() {
        super.tearDown()
        usuarioMOService = nil
    }

    func testAdicionaUsuario() {
        println(3)
        var usuario = usuarioMOService.novo(username:"Victor", email: "Victor.Travassos@iCloud.com", senha: "Vrtsf.140193")
        println(4)
        XCTAssertNotNil(usuario, "Não pode ser nulo")
        println(usuario?.description)
        XCTAssertTrue(usuario!.username == "Victor")
        println(6)
        XCTAssertTrue(usuario?.email == "Victor.Travassos@iCloud.com")
        println(7)
        XCTAssertTrue(usuario?.senha == "Vrtsf.140193")
        println(8)
    }

}
