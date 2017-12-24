//
//  OnboardingViewController.swift
//  testPageView
//
//  Created by Abhinav Prakash on 24/12/17.
//  Copyright © 2017 Abhinav Prakash. All rights reserved.
//

import UIKit

class OnboardingViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    weak var onboardingDelegate: OnboardingViewControllerDelegate?
    
    private lazy var orderedViewController: [UIViewController] = {
        return [instantiatePV1(),
                instantiatePV2(),
                instantiatePV3()]
    }()
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if viewController.restorationIdentifier == "3rdPV" {
            return instantiatePV2()
        } else if viewController.restorationIdentifier == "2ndPV" {
            onboardingDelegate?.onboardingPageViewController(onboardingPageViewController: self, didUpdatePageIndex: 1)
            return instantiatePV1()
        } else {
            onboardingDelegate?.onboardingPageViewController(onboardingPageViewController: self, didUpdatePageIndex: 0)
            return nil
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if viewController.restorationIdentifier == "1stPV" {
            return instantiatePV2()
        } else if viewController.restorationIdentifier == "2ndPV" {
            onboardingDelegate?.onboardingPageViewController(onboardingPageViewController: self, didUpdatePageIndex: 1)
            return instantiatePV3()
        } else {
            onboardingDelegate?.onboardingPageViewController(onboardingPageViewController: self, didUpdatePageIndex: 2)
            return nil
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
//        print(viewControllers)
//        if let firstViewController = viewControllers?.first, let index = orderedViewController.index(of: firstViewController) {
//            onboardingDelegate?.onboardingPageViewController(onboardingPageViewController: self, didUpdatePageIndex: index)
//        }
        
    }
    
//    func presentationCount(for pageViewController: UIPageViewController) -> Int {
//        return 3
//    }
    
//    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
//        return 0
//    }
//
    func instantiatePV1() -> UIViewController {
//        onboardingDelegate?.onboardingPageViewController(onboardingPageViewController: self, didUpdatePageIndex: 0)
        return (storyboard?.instantiateViewController(withIdentifier: "1stPV"))!
    }
    
    func instantiatePV2() -> UIViewController {
//        onboardingDelegate?.onboardingPageViewController(onboardingPageViewController: self, didUpdatePageIndex: 1)
        return (storyboard?.instantiateViewController(withIdentifier: "2ndPV"))!
    }
    
    func instantiatePV3() -> UIViewController {
//        onboardingDelegate?.onboardingPageViewController(onboardingPageViewController: self, didUpdatePageIndex: 2)
        return (storyboard?.instantiateViewController(withIdentifier: "3rdPV"))!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        delegate = self
        onboardingDelegate?.onboardingPageViewController(onboardingPageViewController: self, didUpdatePageCount: orderedViewController.count)
        if let firstViewController = orderedViewController.first {
            setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

protocol OnboardingViewControllerDelegate: class {
    func onboardingPageViewController(onboardingPageViewController: OnboardingViewController, didUpdatePageCount count: Int)
    func onboardingPageViewController(onboardingPageViewController: OnboardingViewController, didUpdatePageIndex index: Int)
}
