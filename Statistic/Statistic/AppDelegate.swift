//
//  AppDelegate.swift
//  Statistic
//
//  Created by winify on 4/28/16.
//  Copyright © 2016 Costraci Mihail. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?
	var user: User = User.sharedInstance
	


	func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
		// Override point for customization after application launch.
		return true
	}

	func applicationWillResignActive(application: UIApplication) {
		// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
		// Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
	}

	func applicationDidEnterBackground(application: UIApplication) {
		// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
		// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
	
        let visibleVC = self.getVisibleViewController(STMainViewController)
        if let visibleVC = visibleVC {
            (visibleVC as! STMainViewController).timer.invalidate()
            
        }
    
    }

	func applicationWillEnterForeground(application: UIApplication) {
		// Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
	}

	func applicationDidBecomeActive(application: UIApplication) {
		// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
		
        var visibleVC = self.getVisibleViewController(STMainViewController)
        if let visibleVC = visibleVC {
            (visibleVC as! STMainViewController).getStatisticInfo()
            
        }
        
        visibleVC = self.getVisibleViewController(STChartViewController)
        if let visibleVC = visibleVC {
            (visibleVC as! STChartViewController).getStatistic()
        }
        
//		
//		let navC = window!.rootViewController as! UINavigationController
//
//		if let tabBar = navC.visibleViewController as? UITabBarController {
//			
//			if let activeVC = tabBar.selectedViewController {
//				
//				if activeVC.isMemberOfClass(STMainViewController) {
//					(activeVC as! STMainViewController).startTimer()
//				}
//				
//				if activeVC.isMemberOfClass(STChartViewController) {
//					(activeVC as! STChartViewController).getStatistic()
//				}
//				
//			}
//		}
		
		
	}

	func applicationWillTerminate(application: UIApplication) {
		// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
	}


    func getVisibleViewController(classNameVC: AnyClass) -> UIViewController? {
        
        let navC = window!.rootViewController as! UINavigationController
        
        if let tabBar = navC.visibleViewController as? UITabBarController {
            
            if let activeVC = tabBar.selectedViewController {
                if activeVC.isMemberOfClass(classNameVC) {
                    return activeVC
                }
            }
        }
    
        return nil
    }
    
    
    
}

