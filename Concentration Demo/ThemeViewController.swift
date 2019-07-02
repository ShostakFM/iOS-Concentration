//
//  ThemeViewController.swift
//  Concentration Demo
//
//  Created by Android on 7/2/19.
//  Copyright © 2019 Marina Shostak. All rights reserved.
//

import UIKit

class ThemeViewController: UIViewController {

    let themes = [
        "Animals" : "🦊🐠🐵🐹🐝🐶🦁🐮🐷🐱",
        "Nature" : "☘️🍁🍄🌸🌹🌼☁️🌈🌪☀️",
        "Food" : "🍖🥩🌭🍕🍟🍔🥪🌮🍣🍙🎂🍿🍩"
    ]
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Choose Theme" {
            if let themeTag = (sender as? UIButton)?.tag {
                let theme: String?
                switch themeTag {
                case 0: theme = themes["Animals"]
                case 1: theme = themes["Nature"]
                case 2: theme = themes["Food"]
                default: theme = themes["Animals"]
                }
                if let cvc = segue.destination as? ConcentrationViewController {
                    cvc.theme = theme
                }
            }
        }
    }


}
