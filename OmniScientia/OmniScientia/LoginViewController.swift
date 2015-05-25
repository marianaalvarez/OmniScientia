//
//  LoginViewController.swift
//  OmniScientia
//
//  Created by Mariana Alvarez on 24/05/15.
//  Copyright (c) 2015 Mariana Alvarez. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var usuario: UITextField!
    @IBOutlet weak var senha: UITextField!
    @IBAction func entrar(sender: AnyObject) {
        cloudKitHelper.fetchUsuario(usuario.text, senha: senha.text)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
