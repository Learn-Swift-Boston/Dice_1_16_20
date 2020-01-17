//
//  ViewController.swift
//  Dice
//
//  Created by Matt Dias on 1/16/20.
//  Copyright © 2020 Matt Dias. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var d100Button: UIButton!

    var result: Int = 0 {
        didSet {
            resultLabel.text = "\(result)"
        }
    }
    var selectedDie = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tappedD100(_ sender: Any) {
        selectedDie = 100
    }

    @IBAction func tappedRoll(_ sender: Any) {
        let alert = UIAlertController(title: "ERROR!", message: "You must select a die before rolling", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

        guard selectedDie != 0 else {
            present(alert, animated: true, completion: nil)
            return
        }

        result = Int.random(in: 1..<selectedDie)

        UIView.animate(withDuration: 0.3) {
            DispatchQueue.main.async {
                self.d100Button.transform = CGAffineTransform(rotationAngle: CGFloat.pi/2)
                self.view.backgroundColor = .orange
            }
        }
    }
}

