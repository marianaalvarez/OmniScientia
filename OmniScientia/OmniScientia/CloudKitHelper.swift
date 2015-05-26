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
    var objetos = [Objetos]()
    
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
                dispatch_async(dispatch_get_main_queue()) {
                    println("Deu Ruim + \(error)")
                }
            }
            else {
                dispatch_async(dispatch_get_main_queue()) {
                    println("Salvou")
                    NSNotificationCenter.defaultCenter().postNotificationName("dadosSalvos", object: self, userInfo: nil)
                }
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
    
    func fetchUsuario(usuario: String, senha: String) {
        let predicate = NSPredicate(format: "usuario = %@ && senha == %@", usuario, senha)
        
        let query = CKQuery(recordType: "Usuario", predicate: predicate)
        
        publicDB.performQuery(query, inZoneWithID: nil,
            completionHandler: ({results, error in
                if (error != nil) {
                    dispatch_async(dispatch_get_main_queue()) {
                        NSLog("Erro")
                    }
                } else {
                    if results.count > 0 {
                        
                        var record = results[0] as! CKRecord

                        dispatch_async(dispatch_get_main_queue()) {
                            
                            let user = Usuario(record: record as CKRecord, database: self.publicDB)
                            var usuario: NSDictionary = NSDictionary(object: user, forKey: "Usuario")
                            NSNotificationCenter.defaultCenter().postNotificationName("usuarioLogado", object: self, userInfo: usuario as [NSObject : AnyObject])
                            println("Achou")
                            
                        }
                    } else {
                        dispatch_async(dispatch_get_main_queue()) {
                            NSLog("Usuário não encontrado.")
                            NSNotificationCenter.defaultCenter().postNotificationName("usuarioInexistente", object: self, userInfo: nil)
                        }
                    }
                }
            }))
    }

    
    func usuarioExistente(usuario: String) {
        let predicate = NSPredicate(format: "usuario == %@", usuario)
        
        let query = CKQuery(recordType: "Usuario", predicate: predicate)
    
        publicDB.performQuery(query, inZoneWithID: nil,
            completionHandler: ({results, error in
                if (error != nil) {
                    dispatch_async(dispatch_get_main_queue()) {
                        NSLog("Erro \(error.description)")
                    }
                } else {
                    if results.count > 0 {
                        
                        var record = results[0] as! CKRecord
                        
                        dispatch_async(dispatch_get_main_queue()) {
                            NSLog("Achou")
                            NSNotificationCenter.defaultCenter().postNotificationName("usuarioEncontrado", object: self, userInfo: nil)
                        }
                        
                    } else {
                        dispatch_async(dispatch_get_main_queue()) {
                            NSLog("Usuário não encontrado.")
                            NSNotificationCenter.defaultCenter().postNotificationName("usuarioNaoEncontrado", object: self, userInfo: nil)
                        }
                    }
                }
            }))
    }
    
    
    
    
}