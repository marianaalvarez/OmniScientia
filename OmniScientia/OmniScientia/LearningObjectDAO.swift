//
//  LearningObjectDAO.swift
//  OmniScientia
//
//  Created by Guilherme Ferreira de Souza on 5/26/15.
//  Copyright (c) 2015 Mariana Alvarez. All rights reserved.
//

import CloudKit

let learningObjDAO = LearningObjectDAO()

class LearningObjectDAO {
    
    var container : CKContainer
    var publicDB : CKDatabase
    let privateDB : CKDatabase
    
    init() {
        container = CKContainer.defaultContainer()
        publicDB = container.publicCloudDatabase
        privateDB = container.privateCloudDatabase
    }
    
    func salvaImagem(imagem: CKAsset) {
        let imagemRecord = CKRecord(recordType: "Imagem")
        imagemRecord.setValue(imagem, forKey: "imagem")
        
        publicDB.saveRecord(imagemRecord, completionHandler: { (record, error) -> Void in
            NSLog("Dados salvos no cloud kit.")
        } )
    }
    
    func salvaAudio(audio: CKAsset) {
        let audioRecord = CKRecord(recordType: "Audio")
        audioRecord.setValue(audio, forKey: "audio")
        
        publicDB.saveRecord(audioRecord, completionHandler: { (record, error) -> Void in
            NSLog("Dados salvos no cloud kit.")
        } )
    }
    
    func salvaTexto(texto: String) {
        let textoRecord = CKRecord(recordType: "Texto")
        textoRecord.setValue(texto, forKey: "texto")
        
        publicDB.saveRecord(textoRecord, completionHandler: { (record, error) -> Void in
            NSLog("Dados salvos no cloud kit.")
        } )
    }
   
}
