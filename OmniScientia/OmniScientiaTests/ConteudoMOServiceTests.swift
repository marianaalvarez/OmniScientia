//
//  ConteudoMOServiceTests.swift
//  OmniScientia
//
//  Created by Victor Travassos Ferreira on 5/21/15.
//  Copyright (c) 2015 Mariana Alvarez. All rights reserved.
//

import XCTest
import CoreData
import OmniScientia

class ConteudoMOServiceTests: XCTestCase {

    var conteudoService: ConteudoMOService!
    
    override func setUp() {
        super.setUp()
        conteudoService = ConteudoMOService.sharedInstance
    }
    
    override func tearDown() {
        super.tearDown()
        conteudoService = nil
    
    }
    
    func testCreateText() {
        var conteudoMO = conteudoService.novo()
    
        XCTAssertNotNil(conteudoMO, "Conteudo Object not created")
        
        let text = conteudoMO.createLearningObject(entityName: "Texto") as? TextoMO
        
        
        XCTAssertNotNil(text, "Texto Object not created")
        
        text?.texto = "Whatever"
        
        XCTAssert(text?.texto == "Whatever", "Texto não é igual")
        
    }
    
    func testCreateImage() {
        var conteudoMO = conteudoService.novo()
        
        XCTAssertNotNil(conteudoMO, "Conteudo Object not created")
        
        let img = conteudoMO.createLearningObject(entityName: "Image") as? ImageMO
        
        XCTAssertNotNil(img, "Image Object not created")
        
        img?.url = "/Users/victor/Downloads/img.png"
        
        CoreDataStack.sharedInstance.saveContext()
        
    }
    
    func testCreateQuiz() {
        var conteudoMO = conteudoService.novo()
        
        XCTAssertNotNil(conteudoMO, "Conteudo Object not created")
        
        let quiz = conteudoMO.createLearningObject(entityName: "Quiz") as? QuizMO
        
        XCTAssertNotNil(quiz, "Quiz Object not created")
        
        quiz?.perguntas = "Porque a galinha atravessou a rua?"
        quiz?.respostas = ["Porque Sim", "Porque quis", "Para encontrar o gato de schrodinger"]
        quiz?.respostas = NSNumber(integer: 1)
        
        CoreDataStack.sharedInstance.saveContext()
    }
    
    func testBuscarConteudo() {
        let conteudos: [ConteudoMO] = conteudoService.buscar()!

        XCTAssertNotNil(conteudos, "Objects not found")
    
    }

}
