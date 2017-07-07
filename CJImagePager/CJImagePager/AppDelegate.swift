//
//  AppDelegate.swift
//  CJImagePager
//
//  Created by CJ on 2017/6/22.
//  Copyright © 2017年 CJ. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    /*
    // MARK:UIScrollViewDelegate
    
    extension CJImagePager: UIScrollViewDelegate {
        
        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            //        setCollectionViewContentOffset(scrollView: scrollView)
        }
        
        func setCollectionViewContentOffset(scrollView:UIScrollView) {
            
            let itemWidth:CGFloat = self.bounds.width - leftRightMargin * 2
            let itemWidthHalf:CGFloat = itemWidth / 2
            
            let offsetX:CGFloat = scrollView.contentOffset.x
            
            guard offsetX > 0 else {
                return
            }
            
            guard offsetX <= (itemWidth + imageMargin) * CGFloat(imageUrls.count - 1) else {
                return
            }
            
            if offsetX < itemWidthHalf {
                collectionView.scrollToItem(at: IndexPath.init(row: 0, section: 0), at: UICollectionViewScrollPosition.centeredHorizontally, animated: true)
                return
            }
            
            let index = Int((offsetX - itemWidthHalf) / (itemWidth + imageMargin)) + 1
            
            collectionView.scrollToItem(at: IndexPath.init(row: index, section: 0), at: UICollectionViewScrollPosition.centeredHorizontally, animated: true)
        }
    }
     
    */

}

