//
//  UsuarioViewController.swift
//  OmniScientia
//
//  Created by Guilherme Ferreira de Souza on 5/25/15.
//  Copyright (c) 2015 Mariana Alvarez. All rights reserved.
//

import UIKit

class UsuarioViewController: UITableViewController {

    var usuarioLogado = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alterarBotoesNavigation()
    }
    
    func alterarBotoesNavigation() {
      
        if usuarioLogado {
            
            let botaoDeslogar = UIBarButtonItem(title: "Deslogar", style: UIBarButtonItemStyle.Plain, target: self, action: nil)
            botaoDeslogar.tintColor = UIColor.whiteColor()
            self.navigationItem.leftBarButtonItem = botaoDeslogar
            self.navigationItem.rightBarButtonItem = nil
        }
    }


    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            if !usuarioLogado {
                return 0
            }
            else {
                return 5
            }
        }
        else if section == 1 {
            return 2
        }
        else {
            return 0
        }
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 && !usuarioLogado {
            return UIView(frame: CGRectZero)
        }
        
        return nil
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if section == 0 && !usuarioLogado {
            return 1
        }
        
        return 32
    }
}