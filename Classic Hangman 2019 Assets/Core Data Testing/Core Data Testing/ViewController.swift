//
//  ViewController.swift
//  Core Data Testing
//
//  Created by Caden Kowalski on 3/2/19.
//  Copyright © 2019 Caden Kowalski. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func AddCoins(_ sender: Any) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext
        let CurrencyObject = NSEntityDescription.entity(forEntityName: "Currency", in: context)
        let Coins = NSManagedObject(entity: CurrencyObject!, insertInto: context)
        try! context.save()
        let FetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Currency")
        let FetchResults =  try! context.fetch(FetchRequest)
        for data in FetchResults as! [NSManagedObject] {
            var CoinValue = (data.value(forKey: "quantity") as! Int)
            print(CoinValue)
            
        }
    }
}
