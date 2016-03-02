//
//  AppDelegate.swift
//  test
//
//  Created by DcBunny on 16/1/11.
//  Copyright © 2016年 IOTeam. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate
{
    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Init and set app window
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = UIColor.whiteColor()
        
        // Set root view controller
        window?.rootViewController = HomeViewController()
        
        return true
    }
}

