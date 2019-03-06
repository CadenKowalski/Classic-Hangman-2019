//
//  AppDelegate.swift
//  Classic Hangman 2019
//
//  Created by Caden Kowalski on 3/2/19.
//  Copyright © 2019 Caden Kowalski. All rights reserved.
//

import UIKit
import CoreData

var CoinValue: Int = 0

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func SaveContext(ContextName: NSManagedObjectContext) {
        if ContextName.hasChanges {
            do {
                try ContextName.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        func InitiateCoinObject() {
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
            let context = appDelegate.persistentContainer.viewContext
            let CreateCurrencyObject = NSEntityDescription.entity(forEntityName: "Currency", in: context)
            let Coins = NSManagedObject(entity: CreateCurrencyObject!, insertInto: context)
            Coins.setValue(100, forKey: "quantity")
            CoinValue = 100
            SaveContext(ContextName: context)
        }
        InitiateCoinObject()
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
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext
        let FetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Currency")
        do {
            let FetchResults = try context.fetch(FetchRequest)
            let FirstInstance: Currency = FetchResults[0] as! Currency
            let FirstValue = (FirstInstance.value(forKey: "quantity") as! Int)
            CoinValue = FirstValue
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext
        SaveContext(ContextName: context)
        
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Classic_Hangman_2019")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
}
