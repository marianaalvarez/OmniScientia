//
//  NovoAprendizadoViewController.swift
//  OmniScientia
//
//  Created by Guilherme Ferreira de Souza on 6/22/15.
//  Copyright (c) 2015 Mariana Alvarez. All rights reserved.
//

import UIKit

class NovoAprendizadoViewController: UIViewController {

    
    @IBOutlet weak var txtTitulo: UITextField!
    
    @IBAction func btnCancelar(sender: AnyObject) {
        self.removeFromParentViewController()
    }
    
    @IBAction func btnSalvar(sender: AnyObject) {
        if txtTitulo.text != nil {
            
            var dicionario = NSDictionary(object: txtTitulo.text, forKey: "titulo")
            
            NSNotificationCenter.defaultCenter().postNotificationName("NovoAprendizado", object: nil, userInfo: dicionario as [NSObject: AnyObject])
        }
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
