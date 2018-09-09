//
//  ViewController.swift
//  testPageView
//
//  Created by Abhinav Prakash on 24/12/17.
//  Copyright © 2017 Abhinav Prakash. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var onboardingContainer: UIView!
    @IBOutlet weak var skipBtn: UIButton!
    
    
    @IBAction func skipOnboarding(_ sender: UIButton) {
        sender.removeFromSuperview()
        onboardingContainer.removeFromSuperview()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

