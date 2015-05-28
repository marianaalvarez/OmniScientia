//
//  ConteudoDAO.swift
//  OmniScientia
//
//  Created by Mariana Alvarez on 19/05/15.
//  Copyright (c) 2015 Mariana Alvarez. All rights reserved.
//

import Foundation
import CloudKit

protocol CloudKitDelegate {
    func errorUpdating(error: NSError)
    func modelUpdated()
}

let conteudoDAO = ConteudoDAO()

class ConteudoDAO {

    var container : CKContainer
    var publicDB : CKDatabase
    let privateDB : CKDatabase
    var delegate : CloudKitDelegate?
    var usuarios = [Usuario]()
    var objetos = [Objetos]()
    
    init() {
        container = CKContainer.defaultContainer()
        publicDB = container.publicCloudDatabase
        privateDB = container.privateCloudDatabase
    }
    
    func salvaConteudo(autor: Usuario, titulo: String, descricao: String, cor: String, objetos: NSArray, data: NSDate) {
        let conteudoRecord = CKRecord(recordType: "Conteudo")
        conteudoRecord.setValue(autor, forKey: "autor")
        conteudoRecord.setValue(titulo, forKey: "titulo")
        conteudoRecord.setValue(descricao, forKey: "descricao")
        conteudoRecord.setValue(cor, forKey: "cor")
        conteudoRecord.setValue(objetos, forKey: "objetos")
        conteudoRecord.setValue(data, forKey: "data")
        
        publicDB.saveRecord(conteudoRecord, completionHandler: { (record, error) -> Void in
            NSLog("Dados salvos no cloud kit.")
        } )
    }
    
    
    func salvaGrupoEstudo(usuarios: NSArray, conteudo: Conteudo) {
        let grupoRecord = CKRecord(recordType: "GrupoEstudo")
        grupoRecord.setValue(conteudo, forKey: "conteudo")
        grupoRecord.setValue(usuarios, forKey: "usuarios")
        
        publicDB.saveRecord(grupoRecord, completionHandler: { (record, error) -> Void in
            NSLog("Dados salvos no cloud kit.")
        } )
    }
    
    
    
    
    
}