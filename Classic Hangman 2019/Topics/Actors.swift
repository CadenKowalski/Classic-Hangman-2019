//
//  Actors.swift
//  Classic Hangman 2019
//
//  Created by Caden Kowalski on 2/24/19.
//  Copyright © 2019 Caden Kowalski. All rights reserved.
//

import UIKit

class Actors: UIViewController {

    // Setup
    
    @IBOutlet weak var Lvl_View: UIView!
    @IBOutlet weak var Lvl_Number_Lbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Lvl_View.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        Lvl_View.isHidden = true
    }
    
    // Main Function
    
    func Run_Level (Lvl_Number: Int) {
        Lvl_View.isHidden = false
        Lvl_Number_Lbl.text = String(Lvl_Number)
    }
    
    // Navigation
    
    @IBAction func Topic_Back_Btn_Pressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func Level_Back_Btn_Pressed(_ sender: Any) {
        Lvl_View.isHidden = true
    }
    
    // Levels
    
    @IBAction func Lvl_1_Btn_Pressed(_ sender: Any) {
        Run_Level(Lvl_Number: 1)
    }
    
    @IBAction func Lvl_2_Btn_Pressed(_ sender: Any) {
        Run_Level(Lvl_Number: 2)
    }
    
    @IBAction func Lvl_3_Btn_Pressed(_ sender: Any) {
        Run_Level(Lvl_Number: 3)
    }
    
    @IBAction func Lvl_4_Btn_Pressed(_ sender: Any) {
        Run_Level(Lvl_Number: 4)
    }
    
    @IBAction func Lvl_5_Btn_Pressed(_ sender: Any) {
        Run_Level(Lvl_Number: 5)
    }
    
    @IBAction func Lvl_6_Btn_Pressed(_ sender: Any) {
        Run_Level(Lvl_Number: 6)
    }
    
    @IBAction func Lvl_7_Btn_Pressed(_ sender: Any) {
        Run_Level(Lvl_Number: 7)
    }
    
    @IBAction func Lvl_8_Btn_Pressed(_ sender: Any) {
        Run_Level(Lvl_Number: 8)
    }
    
    @IBAction func Lvl_9_Btn_Pressed(_ sender: Any) {
        Run_Level(Lvl_Number: 9)
    }
    
    @IBAction func Lvl_10_Btn_Pressed(_ sender: Any) {
        Run_Level(Lvl_Number: 10)
    }
    
    @IBAction func Lvl_11_Btn_Pressed(_ sender: Any) {
        Run_Level(Lvl_Number: 11)
    }
    
    @IBAction func Lvl_12_Btn_Pressed(_ sender: Any) {
        Run_Level(Lvl_Number: 12)
    }
    
    @IBAction func Lvl_13_Btn_Pressed(_ sender: Any) {
        Run_Level(Lvl_Number: 13)
    }
    
    @IBAction func Lvl_14_Btn_Pressed(_ sender: Any) {
        Run_Level(Lvl_Number: 14)
    }
    
    @IBAction func Lvl_15_Btn_Pressed(_ sender: Any) {
        Run_Level(Lvl_Number: 15)
    }
    
    @IBAction func Lvl_16_Btn_Pressed(_ sender: Any) {
        Run_Level(Lvl_Number: 16)
    }
    
    @IBAction func Lvl_17_Btn_Pressed(_ sender: Any) {
        Run_Level(Lvl_Number: 17)
    }
    
    @IBAction func Lvl_18_Btn_Pressed(_ sender: Any) {
        Run_Level(Lvl_Number: 18)
    }
    
    @IBAction func Lvl_19_Btn_Pressed(_ sender: Any) {
        Run_Level(Lvl_Number: 19)
    }
    
    @IBAction func Lvl_20_Btn_Pressed(_ sender: Any) {
        Run_Level(Lvl_Number: 20)
    }
}
