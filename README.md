# Swipeable Card Onboarding UIPageView iOS
## Swipeable cards lookalike used for onboarding. 
The code is still rough but can be used with some tweaking.
Code wherein the onboarding screen will be used only once during the lifetime of application, is not introduced in the applicationDidLaunch method (within AppDelegate). It is expected that people using it might introduce that, as it is hardly 4 lines of code. Please note that main purpose was to keep the main View appearing behind the PageViews (or onboarding screens, so that customers always have a glimpse of the good stuff lurking behind). 
 
## Result

## (Portrait)
[![enter image description here][2]][2]

## (Landscape)
[![enter image description here][3]][3]
 
Main ViewController is the entry point. Within the main VC, Container VC is used. UIPageViewController is dragged in underlying which three are VCs which would be the pages within the UIPageViewController. After removing the ContainerView's default controller, UIPageViewController is embedded (Enbed Segue) into the ContainerView (which in within the main VC).
The whole arrangement looks like:

[![enter image description here][1]][1]

This way my mainVC can remain the initial VC. I can make my three views smaller with a corner radius, which looks like a popover arrangement, as is what I needed. I did not use the default UIPageControl which is used by UIPageViewController. Instead, I dragged in a UIPageViewControl onto my main VC (not the container VC within). This way, I was able able to add whatever buttons (such as "Skip") which probably is not possible when using default UIPageControl. Meaning thereby, I did not use these in my UIPageViewController code. 

    func presentationCount(for pageViewController: UIPageViewController) -> Int {}
        
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {}

In order to control the new UIPageControl which I had dragged in, I introduced delegation protocol within my UIPageViewController and made my main VC follow the protocol. Then, I could basically send message to my main VC (UIPageControl is an outlet in the main VC) when the user was swiping the pages. 

    protocol OnboardingViewControllerDelegate: class {
        func onboardingPageViewController(onboardingPageViewController: OnboardingViewController, didUpdatePageCount count: Int)
        func onboardingPageViewController(onboardingPageViewController: OnboardingViewController, didUpdatePageIndex index: Int)
    }

At the end of it, the result above is the following which is exactly what I want. In case anyone is interest, putting in a pub repo. Tx. 

  [1]: https://cdn-images-1.medium.com/max/800/1*roIpdolj3JhoM1jjnBQTjw.png
  [2]: https://cdn-images-1.medium.com/max/800/1*YLByIhWCI5_NnjgeyU87tA.gif
  [3]: https://cdn-images-1.medium.com/max/800/1*d8_cZqZssKjXX3ERht4UQQ.gif
  
  Icons made by Freepik from www.flaticon.com 



