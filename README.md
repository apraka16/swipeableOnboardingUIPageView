# Swipeable Card Onboarding UIPageView iOS
## Swipeable cards lookalike used for onboarding. 
Code wherein the onboarding screen will be used only once during the lifetime of application, is not introduced in the applicationDidLaunch method (within AppDelegate). It is expected that people using it might introduce that, as it is hardly 4 lines of code. Please note that main purpose was to keep the main View appearing behind the PageViews (or onboarding screens, so that users always have a glimpse of the good stuff lurking behind). 
 
## Result

## (iPhone Portrait)
[![enter image description here][2]][2]

## (iPad Landscape)
[![enter image description here][3]][3]

## (iPhone Landscape)
[![enter image description here][4]][4]

Main ViewController is the entry point. Within the main VC, Container VC is used. UIPageViewController is dragged in underlying which three are VCs which would be the pages within the UIPageViewController. After removing the ContainerView's default controller, UIPageViewController is embedded (Enbed Segue) into the ContainerView (which in within the main VC).
The whole arrangement looks like:

[![enter image description here][1]][1]

This way my mainVC can remain the initial VC. I can make my three views smaller with a corner radius, which looks like a popover arrangement, as is what I needed. 
At the end of it, the result above is the following which is exactly what I want. In case anyone is interest, putting in a pub repo. Tx. 

  [1]: https://cdn-images-1.medium.com/max/800/1*ScnS7M2cat3wVwpZWR450g.png
  [2]: https://cdn-images-1.medium.com/max/800/1*YLByIhWCI5_NnjgeyU87tA.gif
  [3]: https://cdn-images-1.medium.com/max/800/1*hdgol8ucOiOXZGgk-xiAdg.gif
  [4]: https://cdn-images-1.medium.com/max/800/1*FE8nh7faBBlXNv2wV8B80Q.gif
  
  Icons made by Freepik from www.flaticon.com 
  I am reachable at https://twitter.com/abhinavpraksh for further assistance/ conversation. 

