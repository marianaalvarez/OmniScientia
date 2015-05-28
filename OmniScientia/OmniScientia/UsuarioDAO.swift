//
//  UsuarioDAO.swift
//  OmniScientia
//
//  Created by Guilherme Ferreira de Souza on 5/26/15.
//  Copyright (c) 2015 Mariana Alvarez. All rights reserved.
//

import CloudKit

let usuarioDAO = UsuarioDAO()

class UsuarioDAO {
    
    var container : CKContainer
    var publicDB : CKDatabase
    let privateDB : CKDatabase
    
    init() {
        container = CKContainer.defaultContainer()
        publicDB = container.publicCloudDatabase
        privateDB = container.privateCloudDatabase
    }
    
    func salvaUsuario(usuario: Usuario) {
        let userRecord = CKRecord(recordType: "Usuario")
        userRecord.setValue(usuario.usuario, forKey: "usuario")
        userRecord.setValue(usuario.nome, forKey: "nome")
        userRecord.setValue(usuario.senha, forKey: "senha")
        userRecord.setValue(usuario.email, forKey: "email")
        userRecord.setValue(usuario.sexo, forKey: "sexo")
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
                            let user = Usuario(record: record as CKRecord, database: self.publicDB)
                            var usuario: NSDictionary = NSDictionary(object: user, forKey: "Usuario")
                            NSNotificationCenter.defaultCenter().postNotificationName("usuarioEncontrado", object: self, userInfo: nil)
                        }
                        
                    } else {
                        dispatch_async(dispatch_get_main_queue()) {
                            NSLog("Usuário não encontrado.")
                            NSNotificationCenter.defaultCenter().postNotificationName("usuarioNaoEncontrado", object: self, userInfo: nil)
                        }
                    }
                }
            })
        )
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


    
}
