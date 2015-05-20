//
//  CloudKitHelper.swift
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

let cloudKitHelper = CloudKitHelper()

class CloudKitHelper {

    var container : CKContainer
    var publicDB : CKDatabase
    let privateDB : CKDatabase
    var delegate : CloudKitDelegate?
    var usuarios = [Usuario]()
    
    init() {
        container = CKContainer.defaultContainer()
        publicDB = container.publicCloudDatabase
        privateDB = container.privateCloudDatabase
    }
    
    class func sharedInstance() -> CloudKitHelper {
        return cloudKitHelper
    }
    
    func salvaUsuario(usuario: String, senha: String, nome: String, email: String, sexo: String) {
        let userRecord = CKRecord(recordType: "Usuario")
        userRecord.setValue(usuario, forKey: "usuario")
        userRecord.setValue(nome, forKey: "nome")
        userRecord.setValue(senha, forKey: "senha")
        userRecord.setValue(email, forKey: "email")
        userRecord.setValue(sexo, forKey: "sexo")
        //userRecord.setValue(dataNascimento, forKey: "dataNascimento")
        
        publicDB.saveRecord(userRecord, completionHandler: { (record, error) -> Void in
            if (error != nil) {
                println("Deu Ruim + \(error)")
            }
            else {
                println("Salvou")
            }
            
        } )
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
    
    func salvaImagem(imagem: CKAsset) {
        let imagemRecord = CKRecord(recordType: "Imagem")
        imagemRecord.setValue(imagem, forKey: "imagem")
        
        publicDB.saveRecord(imagemRecord, completionHandler: { (record, error) -> Void in
            NSLog("Dados salvos no cloud kit.")
        } )
    }
    
    func salvaVideo(video: CKAsset) {
        let videoRecord = CKRecord(recordType: "Video")
        videoRecord.setValue(video, forKey: "video")
        
        publicDB.saveRecord(videoRecord, completionHandler: { (record, error) -> Void in
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
    
    func salvaGrupoEstudo(usuarios: NSArray, conteudo: Conteudo) {
        let grupoRecord = CKRecord(recordType: "GrupoEstudo")
        grupoRecord.setValue(conteudo, forKey: "conteudo")
        grupoRecord.setValue(usuarios, forKey: "usuarios")
        
        publicDB.saveRecord(grupoRecord, completionHandler: { (record, error) -> Void in
            NSLog("Dados salvos no cloud kit.")
        } )
    }
    
    func fetchUsers(insertedRecord: CKRecord) {
        let predicate = NSPredicate(value: true)
        let sort = NSSortDescriptor(key: "creationDate", ascending: false)
        let query = CKQuery(recordType: "Usuario", predicate: predicate)
        query.sortDescriptors = [sort]
        publicDB.performQuery(query, inZoneWithID: nil) {
            results, error in
            if error != nil {
                dispatch_async(dispatch_get_main_queue()) {
                    self.delegate?.errorUpdating(error)
                    return
                }
            } else {
                self.usuarios.removeAll()
                for record in results{
                    let user = Usuario(record: record as! CKRecord, database: self.publicDB)
                    self.usuarios.append(user)
                }
                if let tmp = insertedRecord as? CKRecord {
                    let usuario = Usuario(record: insertedRecord as CKRecord, database: self.publicDB)
                    self.usuarios.insert(usuario, atIndex: 0)
                }
                dispatch_async(dispatch_get_main_queue()) {
                    self.delegate?.modelUpdated()
                    return
                }
            }
        }

   
    }
}