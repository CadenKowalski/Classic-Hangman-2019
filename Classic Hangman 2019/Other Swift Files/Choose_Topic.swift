//
//  Choose_Topic.swift
//  Classic Hangman 2019
//
//  Created by Caden Kowalski on 2/24/19.
//  Copyright © 2019 Caden Kowalski. All rights reserved.
//

import UIKit
import CoreData

class Choose_Topic: UIViewController {

    @IBOutlet weak var Common_Phrases_Btn: UIImageView!
    @IBOutlet weak var Movie_Quotes_Btn: UIImageView!
    @IBOutlet weak var Movies_Btn: UIImageView!
    @IBOutlet weak var Actors_Btn: UIImageView!
    @IBOutlet weak var Foods_Btn: UIImageView!
    @IBOutlet weak var Cities_Btn: UIImageView!
    @IBOutlet weak var DC_Attractions_Btn: UIImageView!
    @IBOutlet weak var Store_Btn: UIImageView!
    @IBOutlet weak var Settings_Btn: UIImageView!
    @IBOutlet weak var Coin_Label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Coin_Label.text = String(CoinValue)
    }
    
    @IBAction func AddCoins(_ sender: Any) {
        CoinValue += 10
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext
        let FetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Currency")
        do {
            let FetchResults = try context.fetch(FetchRequest)
            for data in FetchResults as! [NSManagedObject] {
                let Coins = data
                Coins.setValue((CoinValue), forKey: "quantity")
                Coin_Label.text = String(CoinValue)
            }
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        Common_Phrases_Btn.isUserInteractionEnabled = true
        Movie_Quotes_Btn.isUserInteractionEnabled = true
        Movies_Btn.isUserInteractionEnabled = true
        Actors_Btn.isUserInteractionEnabled = true
        Foods_Btn.isUserInteractionEnabled = true
        Cities_Btn.isUserInteractionEnabled = true
        DC_Attractions_Btn.isUserInteractionEnabled = true
        Store_Btn.isUserInteractionEnabled = true
        Settings_Btn.isUserInteractionEnabled = true
    }
}
