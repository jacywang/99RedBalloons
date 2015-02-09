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
    
    var myBalloons: [Balloon] = []
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        imageView.image = UIImage(named: "BerlinTVTower.jpg")
        textLabel.text = "0 Balloons"
        
        var firstBalloon = Balloon()
        firstBalloon.number = 1
        firstBalloon.image = UIImage(named: "RedBalloon1.jpg")
        
        var secondBalloon = Balloon()
        secondBalloon.number = 2
        secondBalloon.image = UIImage(named: "RedBalloon2.jpg")
        
        var thirdBalloon = Balloon()
        thirdBalloon.number = 3
        thirdBalloon.image = UIImage(named: "RedBalloon3.jpg")
        
        var fourthBalloon = Balloon()
        fourthBalloon.number = 4
        fourthBalloon.image = UIImage(named: "RedBalloon4.jpg")
        
        myBalloons += [firstBalloon, secondBalloon, thirdBalloon, fourthBalloon]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextBarButtonPressed(sender: UIBarButtonItem) {
        var randomIndex: Int
        
        do {
            randomIndex = Int(arc4random_uniform(UInt32(4)))
        } while currentIndex == randomIndex
        
        currentIndex = randomIndex
        
        let balloon = myBalloons[randomIndex]
        
        UIView.transitionWithView(self.view, duration: 2, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
                self.imageView.image = balloon.image
                self.textLabel.text = balloon.createBalloonString()
            }, completion: {
                (finished: Bool) -> () in
        })
        
    }

}

