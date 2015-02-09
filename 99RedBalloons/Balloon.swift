//
//  Balloon.swift
//  99RedBalloons
//
//  Created by JIAN WANG on 2/8/15.
//  Copyright (c) 2015 JACY WANG. All rights reserved.
//

import Foundation
import UIKit

struct Balloon {
    var number = 0
    var image = UIImage(named: "")
    
    func createBalloonString() -> String {
        var balloonNumber: Int
        
        do {
            balloonNumber = Int(arc4random_uniform(UInt32(99)))
        } while balloonNumber == 0
        
        if balloonNumber == 1 {
            return "1 Balloon"
        } else {
            return "\(balloonNumber) Balloons"
        }
    }
}