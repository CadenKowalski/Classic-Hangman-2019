//
//  Common_Phrases.swift
//  Classic Hangman 2019
//
//  Created by Caden Kowalski on 2/24/19.
//  Copyright © 2019 Caden Kowalski. All rights reserved.
//

import UIKit
import CoreData

class Common_Phrases: UIViewController {
    
    // Setup
    
    @IBOutlet weak var Lvl_View: UIView!
    @IBOutlet weak var Lvl_Number_Lbl: UILabel!
    @IBOutlet weak var Coin_Label: UILabel!
    @IBOutlet weak var Guesses_Remaining_Lbl: UILabel!
    @IBOutlet weak var Stand: UIImageView!
    @IBOutlet weak var Word_Lbl: UILabel!
    var Guesses_Remaining_Num = 6
    let Words = ["Butter my but and call me a biscuit", "Once in a blue moon", "More bang for your buck", "Piece of cake", "Kill two birds with one stone", "Dont judge a book by its cover", "Break a leg", "The appl doesnt fall far from the tree", "Knock on wood", "Its not rocket science", "Couch Potato", "Spill the beans", "Green thumb", "Tell me about it", "The early bird catches the worm", "Dont bite the hand that feeds you", "Under the weather", "Think outside the box", "Its raining cats and dogs", "Dont shoot the messenger"]
    var Stand_Images = ["Stand", "Head", "Body", "One_leg", "Two_Legs", "One_Arm", "Two_Arms"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Lvl_View.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        Lvl_View.isHidden = true
    }
    
    // Navigation
    
    @IBAction func Topic_Back_Btn_Pressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func Level_Back_Btn_Pressed(_ sender: Any) {
        Lvl_View.isHidden = true
    }
    
    // Main Function
    
    func Run_Level (Lvl_Number: Int) {
        Lvl_View.isHidden = false
        Lvl_Number_Lbl.text = String(Lvl_Number)
        Coin_Label.text = String(CoinValue)
        Guesses_Remaining_Lbl.text = String(Guesses_Remaining_Num)
        Stand.image = UIImage(named: Stand_Images[6-Guesses_Remaining_Num])
        var Word_With_Underscoores = ""
        for x in Words[Lvl_Number - 1] {
            if x == " " {
                Word_With_Underscoores.append(" ")
                Word_With_Underscoores.append(" ")
            } else {
                Word_With_Underscoores.append("_")
                Word_With_Underscoores.append(" ")
            }
        }
        Word_Lbl.text = String(Word_With_Underscoores)
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
    
    @IBAction func LVl_9_Btn_Pressed(_ sender: Any) {
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
    
    // Letter presses
    
    @IBAction func Q_Pressed(_ sender: Any) {
    }
    
    @IBAction func W_Pressed(_ sender: Any) {
    }
    
    @IBAction func E_Pressed(_ sender: Any) {
    }
    
    @IBAction func R_Pressed(_ sender: Any) {
    }
    
    @IBAction func T_Pressed(_ sender: Any) {
    }
    
    @IBAction func Y_Pressed(_ sender: Any) {
    }
    
    @IBAction func U_Pressed(_ sender: Any) {
    }
    
    @IBAction func I_Pressed(_ sender: Any) {
    }
    
    @IBAction func O_Pressed(_ sender: Any) {
    }
    
    @IBAction func P_Pressed(_ sender: Any) {
    }
    
    @IBAction func A_Pressed(_ sender: Any) {
    }
    
    @IBAction func S_Pressed(_ sender: Any) {
    }
    
    @IBAction func D_Pressed(_ sender: Any) {
    }
    
    @IBAction func F_Pressed(_ sender: Any) {
    }
    
    @IBAction func G_Pressed(_ sender: Any) {
    }
    
    @IBAction func H_Pressed(_ sender: Any) {
    }
    
    @IBAction func J_Pressed(_ sender: Any) {
    }
    
    @IBAction func K_Pressed(_ sender: Any) {
    }
    
    @IBAction func L_Pressed(_ sender: Any) {
    }
    
    @IBAction func Z_Pressed(_ sender: Any) {
    }
    
    @IBAction func Y_Presse(_ sender: Any) {
    }
    
    @IBAction func C_Pressed(_ sender: Any) {
    }
    
    @IBAction func V_Pressed(_ sender: Any) {
    }
    
    @IBAction func B_Pressed(_ sender: Any) {
    }
    
    @IBAction func N_Pressed(_ sender: Any) {
    }
    
    @IBAction func M_Pressed(_ sender: Any) {
    }
}
