//
//  MyTabBarController.swift
//  Madrid 2019
//
//  Created by Cameron on 15/05/2019.
//  Copyright © 2019 Cameron. All rights reserved.
//

import Foundation
import UIKit

class MyTabBarController: UITabBarController, UITabBarControllerDelegate {
    var check = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // tell our UITabBarController subclass to handle its own delegate methods
        self.delegate = self
    }
    
    // called whenever a tab button is tapped
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
        if viewController is FirstViewController {
            print("First tab")
            check = 0
        } else if viewController is SecondViewController {
            print("Second tab")
            check = 2
        }
    }
}
