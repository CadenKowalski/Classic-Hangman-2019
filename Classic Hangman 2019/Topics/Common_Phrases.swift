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
    
    @IBOutlet weak var Letter_Q: UIButton!
    @IBOutlet weak var Letter_W: UIButton!
    @IBOutlet weak var Letter_E: UIButton!
    @IBOutlet weak var Letter_R: UIButton!
    @IBOutlet weak var Letter_T: UIButton!
    @IBOutlet weak var Letter_Y: UIButton!
    @IBOutlet weak var Letter_U: UIButton!
    @IBOutlet weak var Letter_I: UIButton!
    @IBOutlet weak var Letter_O: UIButton!
    @IBOutlet weak var Letter_P: UIButton!
    @IBOutlet weak var Letter_A: UIButton!
    @IBOutlet weak var Letter_S: UIButton!
    @IBOutlet weak var Letter_D: UIButton!
    @IBOutlet weak var Letter_F: UIButton!
    @IBOutlet weak var Letter_G: UIButton!
    @IBOutlet weak var Letter_H: UIButton!
    @IBOutlet weak var Letter_J: UIButton!
    @IBOutlet weak var Letter_K: UIButton!
    @IBOutlet weak var Letter_L: UIButton!
    @IBOutlet weak var Letter_Z: UIButton!
    @IBOutlet weak var Letter_X: UIButton!
    @IBOutlet weak var Letter_C: UIButton!
    @IBOutlet weak var Letter_V: UIButton!
    @IBOutlet weak var Letter_B: UIButton!
    @IBOutlet weak var Letter_N: UIButton!
    @IBOutlet weak var Letter_M: UIButton!
    @IBOutlet weak var Lvl_View: UIView!
    @IBOutlet weak var Lvl_Number_Lbl: UILabel!
    @IBOutlet weak var Coin_Label: UILabel!
    @IBOutlet weak var Guesses_Remaining_Lbl: UILabel!
    @IBOutlet weak var Stand: UIImageView!
    @IBOutlet weak var Word_Lbl: UILabel!
    let Words: [Int: String] = [1: "butter my but and call me a biscuit", 2: "once in a blue moon", 3: "more bang for your buck", 4: "piece of cake", 5: "kill two birds with one stone", 6: "don't judge a book by it's cover", 7: "break a leg", 8: "the apple doesn't fall far from the tree", 9: "knock on wood", 10: "it's not rocket science", 11: "couch potato", 12: "spill the beans", 13: "green thumb", 14: "tell me about it", 15: "the early bird catches the worm", 16: "don't bite the hand that feeds you", 17: "under the weather", 18: "think outside the box", 19: "it's raining cats and dogs", 20: "don't shoot the messenger"]
    var Stand_Images = ["Stand", "Head", "Body", "One_Leg", "Two_Legs", "One_Arm", "Two_Arms"]
    var Guesses_Remaining_Num = 6
    var wordDictionary = [Int: String]() // Stores the letters in the word in a random order
    var showWordDictionary = [Int: String]() // Stores the characters in the phrase that is shown
    var showWord = "" // Stores the string that gets passed to the label
    var letterIndex = Array<Int>() // The variable that stores the index of the guessesd letter in the word
    var sortedWordDictionary = [(key: Int, value: String)]()
    var sortedShowWordDictionary = [(key: Int, value: String)]()
    var occurencesInWord = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Lvl_View.isHidden = true
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Background")!)
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
    
    // Supporting Function
    
    func Guess_Letter(Letter: String) {
        letterIndex = []
        occurencesInWord = 0
        for x in sortedWordDictionary {
            if x.value == Letter {
                occurencesInWord += 1
                letterIndex.append(x.key + (-1 * (0 - x.key)))
            }
        }
 
        if occurencesInWord == 1 {
            showWordDictionary[letterIndex[0]] = Letter
            sortedShowWordDictionary = showWordDictionary.sorted  {$0.key < $1.key}
            showWord = ""
            for x in sortedShowWordDictionary {
                showWord.append(x.value)
            }
            Word_Lbl.text = showWord
        } else if occurencesInWord > 1 {
            for x in letterIndex {
                showWordDictionary[x] = Letter
                sortedShowWordDictionary = showWordDictionary.sorted {$0.key < $1.key}
                showWord = ""
                for x in sortedShowWordDictionary {
                    showWord.append(x.value)
                }
                Word_Lbl.text = showWord
            }
        } else {
            Guesses_Remaining_Num -= 1
            Guesses_Remaining_Lbl.text = String(Guesses_Remaining_Num)
            Stand.image = UIImage(named: Stand_Images[6 - Guesses_Remaining_Num])
        }
    }
    
    // Main Function
    
    func Run_Level (Lvl_Number: Int) {
        Lvl_View.isHidden = false
        Lvl_Number_Lbl.text = String(Lvl_Number)
        Coin_Label.text = String(CoinValue)
        Guesses_Remaining_Lbl.text = String(Guesses_Remaining_Num)
        Stand.image = UIImage(named: Stand_Images[6 - Guesses_Remaining_Num])
        showWord = ""
        var key = 0
        for x in Words[Lvl_Number]! {
            wordDictionary[key] = String(x)
            key += 1
        }
        
        sortedWordDictionary = wordDictionary.sorted  {$0.key < $1.key}
        
        var keyTwo = 0
        for x in sortedWordDictionary {
            if x.value == " " {
                showWordDictionary[keyTwo] = " "
            } else if x.value == "'" {
                showWordDictionary[keyTwo] = "'"
            } else {
                showWordDictionary[keyTwo] = "_"
            }
            keyTwo += 1
            showWordDictionary[keyTwo] = " "
            keyTwo += 1
        }
        
        sortedShowWordDictionary = showWordDictionary.sorted  {$0.key < $1.key}
        
        for x in sortedShowWordDictionary {
            showWord.append(x.value)
        }
        Word_Lbl.text = showWord
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
        Guess_Letter(Letter: "q")
        Letter_Q.setTitle("", for: .normal)
        if occurencesInWord > 0 {
            Letter_Q.setImage(UIImage(named: "CorrectGuessedLetter"), for: .normal)
        } else {
            Letter_Q.setImage(UIImage(named: "GuessedLetter"), for: .normal)
        }
    }
    
    @IBAction func W_Pressed(_ sender: Any) {
        Guess_Letter(Letter: "w")
        Letter_W.setTitle("", for: .normal)
        if occurencesInWord > 0 {
            Letter_W.setImage(UIImage(named: "CorrectGuessedLetter"), for: .normal)
        } else {
            Letter_W.setImage(UIImage(named: "GuessedLetter"), for: .normal)
        }
    }
    
    @IBAction func E_Pressed(_ sender: Any) {
        Guess_Letter(Letter: "e")
        Letter_E.setTitle("", for: .normal)
        if occurencesInWord > 0 {
            Letter_E.setImage(UIImage(named: "CorrectGuessedLetter"), for: .normal)
        } else {
            Letter_E.setImage(UIImage(named: "GuessedLetter"), for: .normal)
        }
    }
    
    @IBAction func R_Pressed(_ sender: Any) {
        Guess_Letter(Letter: "r")
        Letter_R.setTitle("", for: .normal)
        if occurencesInWord > 0 {
            Letter_R.setImage(UIImage(named: "CorrectGuessedLetter"), for: .normal)
        } else {
            Letter_R.setImage(UIImage(named: "GuessedLetter"), for: .normal)
        }
    }
    
    @IBAction func T_Pressed(_ sender: Any) {
        Guess_Letter(Letter: "t")
        Letter_T.setTitle("", for: .normal)
        if occurencesInWord > 0 {
            Letter_T.setImage(UIImage(named: "CorrectGuessedLetter"), for: .normal)
        } else {
            Letter_T.setImage(UIImage(named: "GuessedLetter"), for: .normal)
        }
    }
    
    @IBAction func Y_Pressed(_ sender: Any) {
        Guess_Letter(Letter: "y")
        Letter_Y.setTitle("", for: .normal)
        if occurencesInWord > 0 {
            Letter_Y.setImage(UIImage(named: "CorrectGuessedLetter"), for: .normal)
        } else {
            Letter_Y.setImage(UIImage(named: "GuessedLetter"), for: .normal)
        }
    }
    
    @IBAction func U_Pressed(_ sender: Any) {
        Guess_Letter(Letter: "u")
        Letter_U.setTitle("", for: .normal)
        if occurencesInWord > 0 {
            Letter_U.setImage(UIImage(named: "CorrectGuessedLetter"), for: .normal)
        } else {
            Letter_U.setImage(UIImage(named: "GuessedLetter"), for: .normal)
        }
    }
    
    @IBAction func I_Pressed(_ sender: Any) {
        Guess_Letter(Letter: "i")
        Letter_I.setTitle("", for: .normal)
        if occurencesInWord > 0 {
            Letter_I.setImage(UIImage(named: "CorrectGuessedLetter"), for: .normal)
        } else {
            Letter_I.setImage(UIImage(named: "GuessedLetter"), for: .normal)
        }
    }
    
    @IBAction func O_Pressed(_ sender: Any) {
        Guess_Letter(Letter: "o")
        Letter_O.setTitle("", for: .normal)
        if occurencesInWord > 0 {
            Letter_O.setImage(UIImage(named: "CorrectGuessedLetter"), for: .normal)
        } else {
            Letter_O.setImage(UIImage(named: "GuessedLetter"), for: .normal)
        }
    }
    
    @IBAction func P_Pressed(_ sender: Any) {
        Guess_Letter(Letter: "p")
        Letter_P.setTitle("", for: .normal)
        if occurencesInWord > 0 {
            Letter_P.setImage(UIImage(named: "CorrectGuessedLetter"), for: .normal)
        } else {
            Letter_P.setImage(UIImage(named: "GuessedLetter"), for: .normal)
        }
    }
    
    @IBAction func A_Pressed(_ sender: Any) {
        Guess_Letter(Letter: "a")
        Letter_A.setTitle("", for: .normal)
        if occurencesInWord > 0 {
            Letter_A.setImage(UIImage(named: "CorrectGuessedLetter"), for: .normal)
        } else {
            Letter_A.setImage(UIImage(named: "GuessedLetter"), for: .normal)
        }
    }
    
    @IBAction func S_Pressed(_ sender: Any) {
        Guess_Letter(Letter: "s")
        Letter_S.setTitle("", for: .normal)
        if occurencesInWord > 0 {
            Letter_S.setImage(UIImage(named: "CorrectGuessedLetter"), for: .normal)
        } else {
            Letter_S.setImage(UIImage(named: "GuessedLetter"), for: .normal)
        }
    }
    
    @IBAction func D_Pressed(_ sender: Any) {
        Guess_Letter(Letter: "d")
        Letter_D.setTitle("", for: .normal)
        if occurencesInWord > 0 {
            Letter_D.setImage(UIImage(named: "CorrectGuessedLetter"), for: .normal)
        } else {
            Letter_D.setImage(UIImage(named: "GuessedLetter"), for: .normal)
        }
    }
    
    @IBAction func F_Pressed(_ sender: Any) {
        Guess_Letter(Letter: "f")
        Letter_F.setTitle("", for: .normal)
        if occurencesInWord > 0 {
            Letter_F.setImage(UIImage(named: "CorrectGuessedLetter"), for: .normal)
        } else {
            Letter_F.setImage(UIImage(named: "GuessedLetter"), for: .normal)
        }
    }
    
    @IBAction func G_Pressed(_ sender: Any) {
        Guess_Letter(Letter: "g")
        Letter_G.setTitle("", for: .normal)
        if occurencesInWord > 0 {
            Letter_G.setImage(UIImage(named: "CorrectGuessedLetter"), for: .normal)
        } else {
            Letter_G.setImage(UIImage(named: "GuessedLetter"), for: .normal)
        }
    }
    
    @IBAction func H_Pressed(_ sender: Any) {
        Guess_Letter(Letter: "h")
        Letter_H.setTitle("", for: .normal)
        if occurencesInWord > 0 {
            Letter_H.setImage(UIImage(named: "CorrectGuessedLetter"), for: .normal)
        } else {
            Letter_H.setImage(UIImage(named: "GuessedLetter"), for: .normal)
        }
    }
    
    @IBAction func J_Pressed(_ sender: Any) {
        Guess_Letter(Letter: "j")
        Letter_J.setTitle("", for: .normal)
        if occurencesInWord > 0 {
            Letter_J.setImage(UIImage(named: "CorrectGuessedLetter"), for: .normal)
        } else {
            Letter_J.setImage(UIImage(named: "GuessedLetter"), for: .normal)
        }
    }
    
    @IBAction func K_Pressed(_ sender: Any) {
        Guess_Letter(Letter: "k")
        Letter_K.setTitle("", for: .normal)
        if occurencesInWord > 0 {
            Letter_K.setImage(UIImage(named: "CorrectGuessedLetter"), for: .normal)
        } else {
            Letter_K.setImage(UIImage(named: "GuessedLetter"), for: .normal)
        }
    }
    
    @IBAction func L_Pressed(_ sender: Any) {
        Guess_Letter(Letter: "l")
        Letter_L.setTitle("", for: .normal)
        if occurencesInWord > 0 {
            Letter_L.setImage(UIImage(named: "CorrectGuessedLetter"), for: .normal)
        } else {
            Letter_L.setImage(UIImage(named: "GuessedLetter"), for: .normal)
        }
    }
    
    @IBAction func Z_Pressed(_ sender: Any) {
        Guess_Letter(Letter: "z")
        Letter_Z.setTitle("", for: .normal)
        if occurencesInWord > 0 {
            Letter_Z.setImage(UIImage(named: "CorrectGuessedLetter"), for: .normal)
        } else {
            Letter_Z.setImage(UIImage(named: "GuessedLetter"), for: .normal)
        }
    }
    
    @IBAction func X_Pressed(_ sender: Any) {
        Guess_Letter(Letter: "x")
        Letter_X.setTitle("", for: .normal)
        if occurencesInWord > 0 {
            Letter_X.setImage(UIImage(named: "CorrectGuessedLetter"), for: .normal)
        } else {
            Letter_X.setImage(UIImage(named: "GuessedLetter"), for: .normal)
        }
    }
    
    @IBAction func C_Pressed(_ sender: Any) {
        Guess_Letter(Letter: "c")
        Letter_C.setTitle("", for: .normal)
        if occurencesInWord > 0 {
            Letter_C.setImage(UIImage(named: "CorrectGuessedLetter"), for: .normal)
        } else {
            Letter_C.setImage(UIImage(named: "GuessedLetter"), for: .normal)
        }
    }
    
    @IBAction func V_Pressed(_ sender: Any) {
        Guess_Letter(Letter: "v")
        Letter_V.setTitle("", for: .normal)
        if occurencesInWord > 0 {
            Letter_V.setImage(UIImage(named: "CorrectGuessedLetter"), for: .normal)
        } else {
            Letter_V.setImage(UIImage(named: "GuessedLetter"), for: .normal)
        }
    }
    
    @IBAction func B_Pressed(_ sender: Any) {
        Guess_Letter(Letter: "b")
        Letter_B.setTitle("", for: .normal)
        if occurencesInWord > 0 {
            Letter_B.setImage(UIImage(named: "CorrectGuessedLetter"), for: .normal)
        } else {
            Letter_B.setImage(UIImage(named: "GuessedLetter"), for: .normal)
        }
    }
    
    @IBAction func N_Pressed(_ sender: Any) {
        Guess_Letter(Letter: "n")
        Letter_N.setTitle("", for: .normal)
        if occurencesInWord > 0 {
            Letter_N.setImage(UIImage(named: "CorrectGuessedLetter"), for: .normal)
        } else {
            Letter_N.setImage(UIImage(named: "GuessedLetter"), for: .normal)
        }
    }
    
    @IBAction func M_Pressed(_ sender: Any) {
        Guess_Letter(Letter: "m")
        Letter_M.setTitle("", for: .normal)
        if occurencesInWord > 0 {
            Letter_M.setImage(UIImage(named: "CorrectGuessedLetter"), for: .normal)
        } else {
            Letter_M.setImage(UIImage(named: "GuessedLetter"), for: .normal)
        }
    }
}
