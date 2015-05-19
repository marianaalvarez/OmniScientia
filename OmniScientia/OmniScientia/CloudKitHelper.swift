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
    var users = [Users]()
    
    init() {
        container = CKContainer.defaultContainer()
        publicDB = container.publicCloudDatabase
        privateDB = container.privateCloudDatabase
    }
    
    class func sharedInstance() -> CloudKitHelper {
        return cloudKitHelper
    }
    
    func salvaUsuario(usuario: String, senha: String, nome: String, email: String, sexo: String, dataNascimento: NSDate) {
        let userRecord = CKRecord(recordType: "Users")
        userRecord.setValue(usuario, forKey: "usuario")
        userRecord.setValue(nome, forKey: "nome")
        userRecord.setValue(senha, forKey: "senha")
        userRecord.setValue(email, forKey: "email")
        userRecord.setValue(sexo, forKey: "sexo")
        userRecord.setValue(dataNascimento, forKey: "dataNascimento")
        
        privateDB.saveRecord(userRecord, completionHandler: { (record, error) -> Void in
            NSLog("Dados salvos no cloud kit.")
        } )
    }
    
    func salvaConteudo(autor: Users, titulo: String, descricao: String, cor: String, objetos: NSArray, data: NSDate) {
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
    
//    func fetchUsers(insertedRecord: CKRecord) {
//        let predicate = NSPredicate(value: true)
//        let sort = NSSortDescriptor(key: "creationDate", ascending: false)
//        let query = CKQuery(recordType: "Users", predicate: predicate)
//        query.sortDescriptors = [sort]
//        privateDB.performQuery(query, inZoneWithID: nil) {
//            results, error in
//            if error != nil {
//                dispatch_async(dispatch_get_main_queue()) {
//                    self.delegate?.errorUpdating(error)
//                    return
//                }
//            } else {
//                self.users.removeAll()
//                for record in results{
//                    let user = Users(record: record as! CKRecord, database: self.privateDB)
//                    self.users.append(user)
//                }
//                if let tmp = insertedRecord {
//                    let todo = Todos(record: insertedRecord! as CKRecord, database: self.privateDB)
//                    self.todos.insert(todo, atIndex: 0)
//                }
//                dispatch_async(dispatch_get_main_queue()) {
//                    self.delegate?.modelUpdated()
//                    return
//                }
//            }
//        }
//
//   
//    }
}