//
//  ConteudosViewController.swift
//  OmniScientia
//
//  Created by Guilherme Ferreira de Souza on 5/19/15.
//  Copyright (c) 2015 Mariana Alvarez. All rights reserved.
//

import UIKit

class ConteudosViewController: UITableViewController {
    
    @IBOutlet weak var scrollFavoritados: UIScrollView!
    
    @IBOutlet weak var scrollSeusConteudos: UIScrollView!
    
    @IBOutlet weak var scrollHistorico: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dummyConteudos()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    func dummyConteudos() {
        
        var botao = UIButton(frame: CGRect(x: 16, y: 41, width: 220, height: 132))
        botao.backgroundColor = UIColor.blueColor()
        botao.layer.cornerRadius = 8.8
        botao.clipsToBounds = true
        scrollFavoritados.addSubview(botao)
        scrollSeusConteudos.addSubview(botao)
        scrollHistorico.addSubview(botao)
        
        var botao2 = UIButton(frame: CGRect(x: 16 + (botao.frame.width + botao.frame.origin.x), y: 41, width: 220, height: 132))
        botao2.backgroundColor = UIColor.yellowColor()
        botao2.layer.cornerRadius = 8.8
        botao2.clipsToBounds = true
        scrollFavoritados.addSubview(botao2)
        scrollSeusConteudos.addSubview(botao2)
        scrollHistorico.addSubview(botao2)
        
        var botao3 = UIButton(frame: CGRect(x: 16 + (botao2.frame.width + botao2.frame.origin.x) , y: 41, width: 220, height: 132))
        botao3.backgroundColor = UIColor.grayColor()
        botao3.layer.cornerRadius = 8.8
        botao3.clipsToBounds = true
        scrollFavoritados.addSubview(botao3)
        scrollSeusConteudos.addSubview(botao3)
        scrollHistorico.addSubview(botao3)
        
        var botao4 = UIButton(frame: CGRect(x: 16 + (botao3.frame.width + botao3.frame.origin.x), y: 41, width: 220, height: 132))
        botao4.backgroundColor = UIColor.redColor()
        botao4.layer.cornerRadius = 8.8
        botao4.clipsToBounds = true
        scrollFavoritados.addSubview(botao4)
        scrollSeusConteudos.addSubview(botao4)
        scrollHistorico.addSubview(botao4)
        
        var botao5 = UIButton(frame: CGRect(x: 16 + (botao4.frame.width + botao4.frame.origin.x), y: 41, width: 220, height: 132))
        botao5.backgroundColor = UIColor.greenColor()
        botao5.layer.cornerRadius = 8.8
        botao5.clipsToBounds = true
        scrollFavoritados.addSubview(botao5)
        scrollSeusConteudos.addSubview(botao5)
        scrollHistorico.addSubview(botao5)
        
        scrollFavoritados.contentSize = CGSize(width: botao.frame.width + botao2.frame.width + botao3.frame.width + botao4.frame.width + botao5.frame.width + (16 * 5) + 20, height: 214)
        scrollSeusConteudos.contentSize = CGSize(width: botao.frame.width + botao2.frame.width + botao3.frame.width + botao4.frame.width + botao5.frame.width + (16 * 5) + 20, height: 214)
        scrollHistorico.contentSize = CGSize(width: botao.frame.width + botao2.frame.width + botao3.frame.width + botao4.frame.width + botao5.frame.width + (16 * 5) + 20, height: 214)
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        // #warning Potentially incomplete method implementation.
//        // Return the number of sections.
//        return 3
//    }
//
//    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete method implementation.
//        // Return the number of rows in the section.
//        return 1
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

