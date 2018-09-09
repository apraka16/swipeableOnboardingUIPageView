//
//  OnboardingViewController.swift
//  testPageView
//
//  Created by Abhinav Prakash on 24/12/17.
//  Copyright © 2017 Abhinav Prakash. All rights reserved.
//

import UIKit

class OnboardingViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    enum PageViews: String {
        case firstPV
        case secondPV
        case thirdPV
        case fourthPV
    }
        
    fileprivate lazy var orderedViewController: [UIViewController] = {
        return [self.getViewController(withIdentifier: PageViews.firstPV.rawValue),
                self.getViewController(withIdentifier: PageViews.secondPV.rawValue),
                self.getViewController(withIdentifier: PageViews.thirdPV.rawValue),
                self.getViewController(withIdentifier: PageViews.fourthPV.rawValue)]
    }()
    
    fileprivate func getViewController(withIdentifier identifier: String) -> UIViewController
    {
        return (storyboard?.instantiateViewController(withIdentifier: identifier))!
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewController.index(of: viewController) else { return nil }
        let previousIndex = viewControllerIndex - 1
        guard previousIndex >= 0 else { return orderedViewController.last }
        guard orderedViewController.count > previousIndex else { return nil }
        return orderedViewController[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewController.index(of: viewController) else { return nil }
        let nextIndex = viewControllerIndex + 1
        guard nextIndex < orderedViewController.count else { return orderedViewController.first }
        guard orderedViewController.count > nextIndex else { return nil }
        return orderedViewController[nextIndex]
    }
    
    func presentationCount(for: UIPageViewController) -> Int {
        return orderedViewController.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        self.delegate = self
        
        if let firstVC = orderedViewController.first {
            setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
