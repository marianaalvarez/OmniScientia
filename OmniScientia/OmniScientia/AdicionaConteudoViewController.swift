//
//  AdicionaConteudoViewController.swift
//  OmniScientia
//
//  Created by Victor Travassos Ferreira on 5/28/15.
//  Copyright (c) 2015 Mariana Alvarez. All rights reserved.
//

import UIKit

class AdicionaConteudoViewController: UIViewController,UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    var pageViewController: UIPageViewController?
    
    
    var viewControllers: [ConteudoViewController]! = []
    
    var pageCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pageViewController = UIPageViewController(transitionStyle: .Scroll, navigationOrientation: .Horizontal, options: nil)
        
        self.pageViewController!.delegate = self
        
        let viewControllers = [viewControllerAtIndex(0)!]
        pageCount++
        
        self.pageViewController?.setViewControllers(viewControllers, direction: .Forward, animated: true, completion: nil)
        
        self.pageViewController?.dataSource = self
        self.pageViewController!.doubleSided = true
        self.addChildViewController(self.pageViewController!)
        self.view.addSubview(self.pageViewController!.view)
        
        var pageViewRect = self.view.bounds
        
        self.pageViewController!.view.frame = pageViewRect
        
        self.pageViewController?.doubleSided = true
        
        self.pageViewController?.didMoveToParentViewController(self)
        
        self.view.gestureRecognizers = self.pageViewController!.gestureRecognizers
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        var conteudoViewController = viewController as! ConteudoViewController
        
        var index = conteudoViewController.pageIndex!
        
        
        if index == NSNotFound {
            return nil
        }
        
        index++

        
        if index == self.pageCount {
            self.pageCount++
            return viewControllerAtIndex(index)
        }
        
        let conteudosViewsControllers = pageViewController.viewControllers as! [ConteudoViewController]
        
        return conteudosViewsControllers[index]
        
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        var conteudoViewController = viewController as! ConteudoViewController
        
        var index = conteudoViewController.pageIndex!
        
        
        if (index == 0) || (index == NSNotFound) {
            return nil
        }
        
        index--
        
        return viewControllers[index]
        
    }
    
    
    func viewControllerAtIndex(index:Int) -> ConteudoViewController? {
        
        let conteudoViewController = storyboard?.instantiateViewControllerWithIdentifier("ConteudoViewController") as! ConteudoViewController
        conteudoViewController.pageIndex = index
        ConteudoViewController.pageCount = pageCount
        viewControllers.append(conteudoViewController)
        return conteudoViewController
    }
    

}
