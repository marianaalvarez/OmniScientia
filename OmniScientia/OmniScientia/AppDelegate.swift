//
//  AppDelegate.swift
//  OmniScientia
//
//  Created by Mariana Alvarez on 15/05/15.
//  Copyright (c) 2015 Mariana Alvarez. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var coreDataStack: CoreDataStack!


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        coreDataStack = CoreDataStack.sharedInstance
        return true
    }

    func applicationDidEnterBackground(application: UIApplication) {
        coreDataStack.saveContext()
    }


    func applicationWillTerminate(application: UIApplication) {

        coreDataStack.saveContext()
    }

 }

