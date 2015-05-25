//
//  UsuarioTableViewCell.swift
//  OmniScientia
//
//  Created by Guilherme Ferreira de Souza on 5/25/15.
//  Copyright (c) 2015 Mariana Alvarez. All rights reserved.
//

import UIKit

class UsuarioTableViewCell: UITableViewController {
    
    @IBOutlet weak var celulaImagem: UITableViewCell!
    
    var usuarioLogado = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alterarBotoesDaNavigation()
    }
    
    
    func alterarBotoesDaNavigation() {
        
        if usuarioLogado {
        
            let botaoDeslogar = UIBarButtonItem(title: "Deslogar", style: UIBarButtonItemStyle.Plain, target: self, action: nil)
            botaoDeslogar.tintColor = UIColor.whiteColor()
            self.navigationItem.setLeftBarButtonItem(botaoDeslogar, animated: true)
            self.navigationItem.setRightBarButtonItem(nil, animated: false)
        }
    }
    
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
        
        if !usuarioLogado && section == 0 {
            return UIView(frame: CGRectZero)
        }
        
        return nil
        
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if !usuarioLogado && section == 0 {
            return 1
        }
        
        return 32
    }
    

}
