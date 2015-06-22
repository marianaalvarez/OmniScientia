//
//  LOViewController.swift
//  OmniScientia
//
//  Created by Victor Travassos on 6/22/15.
//  Copyright (c) 2015 Mariana Alvarez. All rights reserved.
//

import UIKit

class LOViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var currentCollectionCell: UICollectionViewCell!
    
    let imagePicker = UIImagePickerController()
    
    var imageView:UIImageView!
    
    var conteudos:[UIView]=[UIView()]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.imagePicker.delegate = self
    }

    override func viewDidAppear(animated: Bool) {
        currentCollectionCell = getLOInView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        
        for cell in self.collectionView.visibleCells() {
            var cell2 = cell as! UICollectionViewCell
            
            currentCollectionCell = cell2
            var indexPath = self.collectionView.indexPathForCell(cell2)
            println(indexPath)
        }
        
    }
    

    func getLOInView() -> UICollectionViewCell {
        
        var collectionViewCells = self.collectionView.visibleCells() as! [UICollectionViewCell]
        
        return collectionViewCells.first!
    }
    
    
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return conteudos.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("learningObject", forIndexPath: indexPath) as! LOCollectionViewCell
        
        return cell
    }
    
    @IBAction func cancelarButton(sender: AnyObject) {
        
        self.navigationController?.popViewControllerAnimated(true)
        
    }
    
    @IBAction func addTextLO(sender: AnyObject) {
        
        var textView = UITextView()
        textView.editable = true
        textView.text = "Digite seu resumo"
        
        
        
        conteudos.append(textView)
        
        collectionView.reloadData()

        
        textView.frame = currentCollectionCell.superview!.bounds as! CGRect
        
        currentCollectionCell.addSubview(textView)

    }
    
    
    @IBAction func addImageLO(sender: AnyObject) {

   
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .PhotoLibrary
        
        presentViewController(imagePicker, animated: true, completion: nil)
        
        imageView = UIImageView()
        
        conteudos.append(imageView)
        
        collectionView.reloadData()
        
        imageView.frame = currentCollectionCell.superview!.bounds as! CGRect
    
        currentCollectionCell.addSubview(imageView)
    
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageView.contentMode = .ScaleAspectFill
            imageView.image = pickedImage
            
            
        }
        
        dismissViewControllerAnimated(true, completion: nil)
    }

    
    @IBAction func addQuiz(sender: AnyObject) {
        
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
