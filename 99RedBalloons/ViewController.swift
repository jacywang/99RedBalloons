//
//  ViewController.swift
//  99RedBalloons
//
//  Created by JIAN WANG on 2/8/15.
//  Copyright (c) 2015 JACY WANG. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textLabel: UILabel!
    
    var balloons: [Balloon] = []
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.createBalloons()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextBarButtonPressed(sender: UIBarButtonItem) {
        
        let balloon = balloons[currentIndex]
        
        UIView.transitionWithView(self.view, duration: 2, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
                self.imageView.image = balloon.image
                self.textLabel.text = "\(balloon.number) Balloons"
            }, completion: {
                (finished: Bool) -> () in
        })
        
        currentIndex += 1
    }

    func createBalloons() {
        for var balloonCount = 0; balloonCount <= 99; balloonCount++ {
            var balloon = Balloon()
            balloon.number = balloonCount
            
            let randomIndex = Int(arc4random_uniform(UInt32(4)))
            
            switch randomIndex {
            case 1:
                balloon.image = UIImage(named: "RedBalloon1.jpg")
            case 2:
                balloon.image = UIImage(named: "RedBalloon2.jpg")
            case 3:
                balloon.image = UIImage(named: "RedBalloon3.jpg")
            default:
                balloon.image = UIImage(named: "RedBalloon4.jpg")
            }
            self.balloons.append(balloon)
        }
    }
}

