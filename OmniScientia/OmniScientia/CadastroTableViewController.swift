//
//  CadastroTableViewController.swift
//  OmniScientia
//
//  Created by Mariana Alvarez on 19/05/15.
//  Copyright (c) 2015 Mariana Alvarez. All rights reserved.
//

import UIKit

class CadastroTableViewController: UITableViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {

    
    let opcoesPickerSexo = ["Feminino", "Masculino", "Outros (Ex: Matraca)"]
    var sexoSelecionado: String = "Não selecionado" {
        didSet {
            txtSexo.text! = sexoSelecionado
        }
    }
    
    var usuarioExistente = false
    
    @IBOutlet weak var table: UITableView!
    
    @IBOutlet weak var txtNome: UITextField!
    @IBOutlet weak var txtUsuario: UITextField!
    @IBOutlet weak var txtSenha: UITextField!
    @IBOutlet weak var txtSenhaConfirm: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtSexo: UITextField!
    @IBOutlet weak var dtNascimento: UITextField!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    
    @IBAction func salvarDados(sender: AnyObject) {
        
        if (txtNome.text == "" || txtUsuario.text == "" || txtSenha.text == "" || txtEmail.text == "" || txtSenha.text == "" || dtNascimento.text == "" || txtSenhaConfirm.text == "" ) {
            
            let alerta = UIAlertController(title: "Atenção", message: "Todos os dados devem ser preenchidos!", preferredStyle:
                UIAlertControllerStyle.Alert)
            let acao = UIAlertAction(title: "Ok", style: .Default) { action -> Void in }
            alerta.addAction(acao)
            
            self.presentViewController(alerta, animated: true, completion: nil)
        
        } else {
            self.loading.startAnimating()
            
            let novaQueue = dispatch_queue_create("validarUsuarioQueue", DISPATCH_QUEUE_SERIAL)
            dispatch_sync(novaQueue) {
                cloudKitHelper.usuarioExistente(self.txtUsuario.text)
                self.loading.stopAnimating()
            }
            
            if (self.usuarioExistente == true) {
                let alerta = UIAlertController(title: "Atenção", message: "Nome de usuário já existe!", preferredStyle:
                UIAlertControllerStyle.Alert)
                let acao = UIAlertAction(title: "Ok", style: .Default) { action -> Void in }
                alerta.addAction(acao)
            
                self.presentViewController(alerta, animated: true, completion: nil)
        
            } else if (self.txtSenha.text != self.txtSenhaConfirm.text) {
                
                let alerta = UIAlertController(title: "Atenção", message: "Confirmação de senha incorreta!", preferredStyle:
                UIAlertControllerStyle.Alert)
                let acao = UIAlertAction(title: "Ok", style: .Default) { action -> Void in }
                alerta.addAction(acao)
                
                self.presentViewController(alerta, animated: true, completion: nil)
                
            }
                
        }
        
        //cloudKitHelper.salvaUsuario(self.txtNome.text, senha: self.txtSenha.text, nome: self.txtNome.text, email: self.txtEmail.text, sexo: self.txtSexo.text)
        //NSLog("Salvou")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "usuarioEncontrado:", name: "usuarioEncontrado", object: nil)
        txtUsuario.delegate = self
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
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
    
    

    func btnConfirmarSenha(sender: UIButton) {
        
    }
    
    func usuarioEncontrado(notification: NSNotificationCenter) {
        usuarioExistente = true
    }
    
    
//    @IBAction func digitandoUsuario(sender: AnyObject) {
//        usuarioExistente = false
//    }
//    @IBAction func verificaUsuario(sender: AnyObject) {
//        cloudKitHelper.usuarioExistente(txtUsuario.text)
//    }
    
    
    // MARK: - Table view data source

//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        // #warning Potentially incomplete method implementation.
//        // Return the number of sections.
//        return 0
//    }
//
//    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete method implementation.
//        // Return the number of rows in the section.
//        return 0
//    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as! UITableViewCell

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
