//
//  CadastroTableViewController.swift
//  OmniScientia
//
//  Created by Mariana Alvarez on 19/05/15.
//  Copyright (c) 2015 Mariana Alvarez. All rights reserved.
//

import UIKit

class CadastroTableViewController: UITableViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBAction func salvarDados(sender: AnyObject) {
        
        cloudKitHelper.salvaUsuario(self.txtNome.text, senha: self.txtSenha.text, nome: self.txtNome.text, email: self.txtEmail.text, sexo: self.txtSexo.text)
        NSLog("Passou")
    }
    
    let opcoesPickerSexo = ["Feminino", "Masculino", "Outros (Ex: Matraca)"]
    var sexoSelecionado: String = "Não selecionado" {
        didSet {
            txtSexo.text! = sexoSelecionado
        }
    }
    
    @IBOutlet weak var txtNome: UITextField!
    @IBOutlet weak var txtUsuario: UITextField!
    @IBOutlet weak var txtSenha: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtSexo: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    
    //MARK - Alerta com 2 textfields para digitação e confirmação da senha
    @IBAction func digitarSenha(sender: AnyObject) {
        let alertaSenha = UIAlertController(title: "", message: "", preferredStyle: UIAlertControllerStyle.Alert)
        alertaSenha.modalInPopover = true
        
        alertaSenha.addTextFieldWithConfigurationHandler { (textField) in
            textField.placeholder = "Digite a senha"
            textField.secureTextEntry = true
        }
        
        alertaSenha.addTextFieldWithConfigurationHandler { (textField) in
            textField.placeholder = "Digite novamente a senha"
            textField.secureTextEntry = true
            //textField.addTarget(self, action: "", forControlEvents: <#UIControlEvents#>)
        }
        
       // alertaSenha.add
        
        // let OKAction = UIAlertAction(title: "Salvar", style: .Default) { (action) in
        //              let valorTextField = alertController.textFields![0] as! UITextField
        
        let toolFrame = CGRectMake(0, 145, 270, 45)
        var toolView: UIView = UIView(frame: toolFrame)
        var btnConfirmarFrame: CGRect = CGRectMake(0, 7, 270, 30)
        var btnConfirmar: UIButton = UIButton(frame: btnConfirmarFrame)
        btnConfirmar.setTitle("Confirmar", forState: UIControlState.Normal)
        btnConfirmar.setTitleColor(UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1), forState: UIControlState.Normal)
        toolView.addSubview(btnConfirmar)
        btnConfirmar.addTarget(self, action: "btnConfirmarSexo:", forControlEvents: UIControlEvents.TouchDown)
        alertaSenha.view.addSubview(toolView)
        
        self.presentViewController(alertaSenha, animated: true, completion: nil)
        
    }
//    func digitarSenha() {
//        
//        let alertaSenha = UIAlertController(title: "", message: "", preferredStyle: UIAlertControllerStyle.Alert)
//        alertaSenha.modalInPopover = true
//        
//        alertaSenha.addTextFieldWithConfigurationHandler { (textField) in
//            textField.placeholder = "Digite a senha"
//            textField.secureTextEntry = true
//        }
//        
//        alertaSenha.addTextFieldWithConfigurationHandler { (textField) in
//            textField.placeholder = "Digite novamente a senha"
//            textField.secureTextEntry = true
//            //textField.addTarget(self, action: "", forControlEvents: <#UIControlEvents#>)
//        }
//
//        
//        // let OKAction = UIAlertAction(title: "Salvar", style: .Default) { (action) in
//          //              let valorTextField = alertController.textFields![0] as! UITextField
//        
//        let toolFrame = CGRectMake(0, 145, 270, 45)
//        var toolView: UIView = UIView(frame: toolFrame)
//        var btnConfirmarFrame: CGRect = CGRectMake(0, 7, 270, 30)
//        var btnConfirmar: UIButton = UIButton(frame: btnConfirmarFrame)
//        btnConfirmar.setTitle("Confirmar", forState: UIControlState.Normal)
//        btnConfirmar.setTitleColor(UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1), forState: UIControlState.Normal)
//        toolView.addSubview(btnConfirmar)
//        btnConfirmar.addTarget(self, action: "btnConfirmarSenha:", forControlEvents: UIControlEvents.TouchDown)
//        alertaSenha.view.addSubview(toolView)
//    }
    
    func btnConfirmarSenha(sender: UIButton) {
        
    }
    
    
    
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
