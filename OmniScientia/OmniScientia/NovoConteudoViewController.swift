//
//  NovoConteudoViewController.swift
//  OmniScientia
//
//  Created by Guilherme Ferreira de Souza on 5/19/15.
//  Copyright (c) 2015 Mariana Alvarez. All rights reserved.
//

import UIKit

class NovoConteudoViewController: UITableViewController, UITextViewDelegate {

    @IBOutlet weak var txtTitulo: UITextView!
    @IBOutlet weak var txtDescricao: UITextView!
    @IBOutlet weak var scrollCores: UIScrollView!
    var pageViewController: UIPageViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: "esconderTeclado")
        self.tableView.addGestureRecognizer(gestureRecognizer)
        
    }
    
    func esconderTeclado() {
        
        txtTitulo.resignFirstResponder()
        txtDescricao.resignFirstResponder()
    }
    
    @IBAction func botaoCancelar(sender: AnyObject) {
        self.navigationController!.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func textViewDidBeginEditing(textView: UITextView) {
        
        if textView.text! == "" || textView.text! == "Título" || textView.text! == "Descrição" {
            textView.text! = ""
            textView.textColor = UIColor.darkTextColor()
        }
    }
    
    func textViewDidEndEditing(textView: UITextView) {
        
        if textView.text! == "Título" || textView.text! == "Descrição" || textView.text! == "" || textView.text == nil {
            if textView == txtTitulo {
                textView.text! = "Título"
            }
            else if textView == txtDescricao {
                textView.text! = "Descrição"
            }
            
            textView.textColor = UIColor.lightGrayColor()
        }
        
        textView.resignFirstResponder()
        
    }
    


}
