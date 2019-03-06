//
//  ViewController.swift
//  Classic Hangman 2019
//
//  Created by Caden Kowalski on 2/24/19.
//  Copyright © 2019 Caden Kowalski. All rights reserved.
//

import UIKit

class Loading_Screen: UIViewController {

    let Time = 6.0
    var Current_Time = 0.0
    
    @IBOutlet weak var Progress_Bar: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        Progress_Bar.setProgress(Float(Current_Time), animated: false)
        perform(#selector(updateProgress))
    }
    
    @objc func updateProgress() {
        Current_Time += 1.0
        Progress_Bar.progress = Float(Current_Time/Time)
        if Current_Time <= Time {
            perform(#selector(updateProgress), with: nil, afterDelay: 0.5)
        } else {
            Segue_From_Loading(Progress_Bar)
        }
    }
    func Segue_From_Loading(_ sender: Any) {
        performSegue(withIdentifier: "Move_To_Topics", sender: sender)
    }
}
