//
//  MyNavigationViewControllerWithAnimations.swift
//  lesson1g3
//
//  Created by Сергей Беляков on 09.05.2021.
//

import UIKit

class MyNavigationViewControllerWithAnimations: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        
    }
    
    let interactiveTransition = InteractiveTransitionClass()

}

extension MyNavigationViewControllerWithAnimations: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == .push {
            self.interactiveTransition.viewController = toVC
            return PushAnimation()
        } else if operation == .pop {
            if navigationController.viewControllers.first != toVC {
                self.interactiveTransition.viewController = toVC
            }
            return PopAnimation()
        } else {return PopAnimation()}
    }
    
    func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactiveTransition.isStarted ? interactiveTransition : nil
    }
}
