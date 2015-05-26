//
//  CadastroTableViewController.swift
//  OmniScientia
//
//  Created by Mariana Alvarez on 19/05/15.
//  Copyright (c) 2015 Mariana Alvarez. All rights reserved.
//

import UIKit

class CadastroTableViewController: UITableViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    var usuarioExistente = false
    let opcoesPickerSexo = ["Feminino", "Masculino", "Outros (Ex: Matraca)"]
    var sexoSelecionado: String = "Não selecionado" {
        didSet {
            txtSexo.text! = sexoSelecionado
        }
    }
    
    @IBOutlet weak var table: UITableView!
    
    @IBOutlet weak var txtNome: UITextField!
    @IBOutlet weak var txtUsuario: UITextField!
    @IBOutlet weak var txtSenha: UITextField!
    @IBOutlet weak var txtSenhaConfirm: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtSexo: UITextField!
    @IBOutlet weak var dtNascimento: UITextField!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    @IBOutlet weak var btnSalvar: UIButton!
    
    @IBAction func salvarDados(sender: AnyObject) {
        if (txtNome.text == "" || txtUsuario.text == "" || txtSenha.text == "" || txtEmail.text == "" || txtSenha.text == "" || dtNascimento.text == "" || txtSenhaConfirm.text == "" ) {
            
            let alerta = UIAlertController(title: "Atenção", message: "Todos os dados devem ser preenchidos!", preferredStyle:
                UIAlertControllerStyle.Alert)
            let acao = UIAlertAction(title: "Ok", style: .Default) { action -> Void in }
            alerta.addAction(acao)
            
            self.presentViewController(alerta, animated: true, completion: nil)
        
        } else {
            if (self.txtSenha.text != self.txtSenhaConfirm.text) {
                
                let alerta = UIAlertController(title: "Atenção", message: "Confirmação de senha incorreta!", preferredStyle:
                UIAlertControllerStyle.Alert)
                let acao = UIAlertAction(title: "Ok", style: .Default) { action -> Void in }
                alerta.addAction(acao)
                
                self.presentViewController(alerta, animated: true, completion: nil)
                
            } else {
                cloudKitHelper.usuarioExistente(self.txtUsuario.text)
            }
                
        }
        
    }
    @IBAction func verificaUsuario(sender: AnyObject) {
        if (txtUsuario.text == "") {
            let alerta = UIAlertController(title: "Atenção", message: "Usuário deve ser preenchido!", preferredStyle:
                UIAlertControllerStyle.Alert)
            let acao = UIAlertAction(title: "Ok", style: .Default) { action -> Void in }
            alerta.addAction(acao)
            
            self.presentViewController(alerta, animated: true, completion: nil)
        } else {
            cloudKitHelper.usuarioExistente(self.txtUsuario.text)
        }
    }
    
    @IBAction func botaoCancelar(sender: AnyObject) {
        self.navigationController!.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "usuarioEncontrado:", name: "usuarioEncontrado", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "usuarioNaoEncontrado:", name: "usuarioNaoEncontrado", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "dadosSalvos:", name: "dadosSalvos", object: nil)
        txtUsuario.delegate = self
        btnSalvar.enabled = false

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK - Alerta com picker para selecionar sexo
    @IBAction func selecionarSexo() {
        
        let alertaSexo = UIAlertController(title: "", message: "\n\n\n\n\n\n\n\n\n", preferredStyle: UIAlertControllerStyle.Alert)
        alertaSexo.modalInPopover = true
        
        let pickerFrame: CGRect = CGRectMake(0, 0, 270, 100)
        var pickerSexo: UIPickerView = UIPickerView(frame: pickerFrame)
        pickerSexo.delegate = self
        pickerSexo.dataSource = self
        alertaSexo.view.addSubview(pickerSexo);

        let toolFrame = CGRectMake(0, 145, 270, 45)
        var toolView: UIView = UIView(frame: toolFrame)
        var btnConfirmarFrame: CGRect = CGRectMake(0, 7, 270, 30)
        var btnConfirmar: UIButton = UIButton(frame: btnConfirmarFrame)
        btnConfirmar.setTitle("Confirmar", forState: UIControlState.Normal)
        btnConfirmar.setTitleColor(UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1), forState: UIControlState.Normal)
        toolView.addSubview(btnConfirmar)
        btnConfirmar.addTarget(self, action: "btnConfirmarSexo:", forControlEvents: UIControlEvents.TouchDown)
        alertaSexo.view.addSubview(toolView)

        self.presentViewController(alertaSexo, animated: true, completion: nil);

    }
    
    func btnConfirmarSexo(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return opcoesPickerSexo.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return opcoesPickerSexo[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        sexoSelecionado = opcoesPickerSexo[row]
    }
    
    
    func usuarioEncontrado(notification: NSNotificationCenter) {
        let alerta = UIAlertController(title: "Atenção", message: "Usuário já existe!", preferredStyle:
            UIAlertControllerStyle.Alert)
        let acao = UIAlertAction(title: "Ok", style: .Default) { action -> Void in }
        alerta.addAction(acao)
        
        self.presentViewController(alerta, animated: true, completion: nil)
        
        btnSalvar.enabled = false
    }
    
    func usuarioNaoEncontrado(notification: NSNotificationCenter) {
        if (btnSalvar.enabled == true) {
            cloudKitHelper.salvaUsuario(self.txtUsuario.text, senha: self.txtSenha.text, nome: self.txtNome.text, email: self.txtEmail.text, sexo: self.txtSexo.text)
            NSLog("Salvou")
        } else {
            btnSalvar.enabled = true
        }
    }
    
    func dadosSalvos(notification: NSNotificationCenter) {
        let alerta = UIAlertController(title: "Atenção", message: "Dados salvos!", preferredStyle:
            UIAlertControllerStyle.Alert)
        let acao = UIAlertAction(title: "Ok", style: .Default) { action -> Void in }
        alerta.addAction(acao)
        
        self.presentViewController(alerta, animated: true, completion: nil)
    }
    
    


}
