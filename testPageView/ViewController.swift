//
//  ViewController.swift
//  testPageView
//
//  Created by Abhinav Prakash on 24/12/17.
//  Copyright © 2017 Abhinav Prakash. All rights reserved.
//

import UIKit

class ViewController: UIViewController, OnboardingViewControllerDelegate {

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var onboardingContainer: UIView!
    @IBOutlet weak var skipBtn: UIButton!
    
    
    @IBAction func skipOnboarding(_ sender: UIButton) {
        pageControl.removeFromSuperview()
        sender.removeFromSuperview()
        onboardingContainer.removeFromSuperview()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let onboardingViewController = segue.destination as? OnboardingViewController {
            onboardingViewController.onboardingDelegate = self
        }
    }
    
    func onboardingPageViewController(onboardingPageViewController: OnboardingViewController, didUpdatePageCount count: Int) {
        pageControl.numberOfPages = count
    }
    
    func onboardingPageViewController(onboardingPageViewController: OnboardingViewController, didUpdatePageIndex index: Int) {
        pageControl.currentPage = index
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

