//
//  ViewController.swift
//  ErmakAS_HW2.1
//
//  Created by Артем Ермак on 3/23/21.
//

import UIKit

enum CurrentLight {
    case red, yellow, green
}

class ViewController: UIViewController {
 
    @IBOutlet var redColor: UIView!
    @IBOutlet var yellowColor: UIView!
    @IBOutlet var greenColor: UIView!
    
    @IBOutlet var nextButton: UIButton!
    
    private var currentLight = CurrentLight.red
    private let lightIsOn: CGFloat = 1
    private let lightIsOff: CGFloat = 0.3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //nextButton.layer.cornerRadius = 10
        redColor.alpha = lightIsOff
        yellowColor.alpha = lightIsOff
        greenColor.alpha = lightIsOff
        //print("Размер стороны доступный в методе viewDidLoad: \(redColor.frame.height)")
    }

    override func viewDidLayoutSubviews() {
        redColor.layer.cornerRadius = redColor.frame.width / 2
        yellowColor.layer.cornerRadius = redColor.frame.width / 2
        greenColor.layer.cornerRadius = redColor.frame.width / 2
        nextButton.layer.cornerRadius = nextButton.frame.height / 2
        //print("Размер стороны доступный в методе viewDidLayoutSubviews: \(redColor.frame.height)")
    }
    
    
    @IBAction func nextColorPressed() {
        if nextButton.currentTitle == "START" {
            nextButton.setTitle("Next", for: .normal)
        }
        
        switch currentLight {
        case .red:
            greenColor.alpha = lightIsOff
            redColor.alpha = lightIsOn
            currentLight = .yellow
        case .yellow:
            redColor.alpha = lightIsOff
            yellowColor.alpha = lightIsOn
            currentLight = .green
        case .green:
            yellowColor.alpha = lightIsOff
            greenColor.alpha = lightIsOn
            currentLight = .red
        }
    }
    
}

