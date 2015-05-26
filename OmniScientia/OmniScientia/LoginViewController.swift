//
//  LoginViewController.swift
//  OmniScientia
//
//  Created by Mariana Alvarez on 24/05/15.
//  Copyright (c) 2015 Mariana Alvarez. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    let userDefaults = NSUserDefaults.standardUserDefaults()

    @IBOutlet weak var usuario: UITextField!
    @IBOutlet weak var senha: UITextField!
    @IBAction func entrar(sender: AnyObject) {
        if (usuario.text == "" || senha.text == "" ) {
            
            let alerta = UIAlertController(title: "Atenção", message: "Todos os dados devem ser preenchidos!", preferredStyle:
                UIAlertControllerStyle.Alert)
            let acao = UIAlertAction(title: "Ok", style: .Default) { action -> Void in }
            alerta.addAction(acao)
            
            self.presentViewController(alerta, animated: true, completion: nil)
            
        } else {
            cloudKitHelper.fetchUsuario(usuario.text, senha: senha.text)
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "usuarioLogado:", name: "usuarioLogado", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "usuarioInexistente:", name: "usuarioInexistente", object: nil)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func usuarioLogado(notification: NSNotification) {
        let info : Dictionary<String,Usuario!> = notification.userInfo as! Dictionary<String,Usuario!>
        let usuario : Usuario = info["Usuario"]!
         userDefaults.setObject(info["Usuario"], forKey: "user_name")
        println("\(usuario.email)")
        
    }
    func usuarioInexistente(notification: NSNotification) {
        let alerta = UIAlertController(title: "Atenção", message: "Usuário não encontrado!", preferredStyle:
            UIAlertControllerStyle.Alert)
        let acao = UIAlertAction(title: "Ok", style: .Default) { action -> Void in }
        alerta.addAction(acao)
        
        self.presentViewController(alerta, animated: true, completion: nil)
    }
    
    @IBAction func botaoCancelar(sender: AnyObject) {
        self.navigationController!.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func usuarioLogin() -> Usuario {
        return userDefaults.objectForKey("user") as! Usuario
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
