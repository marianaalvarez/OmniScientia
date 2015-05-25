//
//  NovoConteudoViewController.swift
//  OmniScientia
//
//  Created by Guilherme Ferreira de Souza on 5/19/15.
//  Copyright (c) 2015 Mariana Alvarez. All rights reserved.
//

import UIKit

class NovoConteudoViewController: UITableViewController, UITextViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        txtTitulo.delegate = self
        txtDescricao.delegate = self
        
        efeitosView()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return 3
    }
    
    @IBOutlet weak var txtTitulo: UITextView!
    @IBOutlet weak var txtDescricao: UITextView!
    @IBOutlet weak var coresScrollView: UIScrollView!
    
    func efeitosView() {
        coresScrollView.contentSize = CGSize(width: 1000, height: 81)
        
        
    }
    
    func textViewDidBeginEditing(textView: UITextView) {
        
        if textView == txtTitulo {
            if textView.text! == "Título" { textView.text! = ""}
        }
        else if textView == txtDescricao {
            if textView.text! == "Descrição" { textView.text! = ""}
        }
        
        textView.textColor = UIColor.darkTextColor()
    }
    
    
    func textViewDidEndEditing(textView: UITextView) {
        
        if textView.text! == ""{
            
            if textView == txtTitulo {
                textView.text! = "Título"
            }
            else if textView == txtDescricao {
                textView.text! == "Descrição"
            }
            textView.textColor = UIColor.lightGrayColor()
        }
        
        self.resignFirstResponder()
    }
    
    @IBAction func botaoCancelar(sender: AnyObject) {
        
        self.navigationController!.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.resignFirstResponder()
    }
    

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
