//
//  MainTabBar.swift
//  OmniScientia
//
//  Created by Victor Travassos Ferreira on 5/21/15.
//  Copyright (c) 2015 Mariana Alvarez. All rights reserved.
//

import UIKit

class MainTabBar: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        var conteudoStoryboard = UIStoryboard(name: "conteudo", bundle: nil)
        var rootConteudoVC = conteudoStoryboard.instantiateInitialViewController() as! UINavigationController
        
        var usuarioStoryboard = UIStoryboard(name: "usuario", bundle: nil)
        var rootUsuarioVC = usuarioStoryboard.instantiateInitialViewController() as! UINavigationController
        
        var configStoryboard = UIStoryboard(name: "configuracoes", bundle: nil)
        var rootConfigVC = configStoryboard.instantiateInitialViewController() as! UINavigationController
        
//        var inicioStoryboard = UIStoryboard(name: "inicio", bundle: nil)
//        var rootInicioVC = inicioStoryboard.instantiateInitialViewController() as! UINavigationController
        
        self.setViewControllers([rootConteudoVC,rootConfigVC], animated: true)
    }
    
    func tabBarController(tabBarController: UITabBarController, shouldSelectViewController viewController: UIViewController) -> Bool {
        return viewController != tabBarController.selectedViewController
    }
}
