//
//  ConteudoViewController.swift
//  OmniScientia
//
//  Created by Victor Travassos Ferreira on 5/28/15.
//  Copyright (c) 2015 Mariana Alvarez. All rights reserved.
//

import UIKit

class ConteudoViewController: UIViewController {

    var pageIndex:Int!
    static var pageCount:Int!
    
    @IBOutlet weak var pageControl: UIPageControl!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    override func viewWillAppear(animated: Bool) {
        self.pageControl.currentPage = pageIndex
        self.pageControl.numberOfPages = ConteudoViewController.pageCount
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func adicionaLearningObject(sender: AdicionaButton!) {
    
        
        let alertController = UIAlertController(title: nil, message: "Escolha um objeto de aprendizagem", preferredStyle: UIAlertControllerStyle.ActionSheet)
        

    
        
        var cancelaAction = UIAlertAction(title: "Cancela", style: UIAlertActionStyle.Cancel, handler: nil)
        
        alertController.addAction(cancelaAction)
    
        
        var addImgAction = UIAlertAction(title: "Adiciona Imagem", style: UIAlertActionStyle.Default) { (action) -> Void in
            
        
            
        }

        

        alertController.addAction(addImgAction)
        
        var frameSize = sender.superview!.bounds as CGRect
        
        var addTextAction = UIAlertAction(title: "Adiciona Texto", style: UIAlertActionStyle.Default) { (action) -> Void in
            
            var textView = UITextView(frame: frameSize)
            textView.editable = true
            textView.text = "Digite seu resumo"
                
            sender.superview!.addSubview(textView)
            
        }
        
        alertController.addAction(addTextAction)
        
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    

}
