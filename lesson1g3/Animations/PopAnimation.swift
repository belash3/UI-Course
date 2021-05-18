//
//  PopAnimation.swift
//  lesson1g3
//
//  Created by Сергей Беляков on 08.05.2021.
//

import UIKit

class PopAnimation: NSObject {

}
extension PopAnimation: UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let sourceViewController = transitionContext.viewController(forKey: .from),
              let destinationViewController = transitionContext.viewController(forKey: .to) else {return}
        
        let containerViewFrame = transitionContext.containerView.frame
        let offScreenRotateIn = CGAffineTransform(rotationAngle: -.pi/2)
        let offScreenRotateOut = CGAffineTransform(rotationAngle: .pi/2)
        transitionContext.containerView.addSubview(destinationViewController.view)
        
        destinationViewController.view.setAnchorPoint(anchorPoint: CGPoint(x: 1, y: 0))
        destinationViewController.view.transform = offScreenRotateOut
        sourceViewController.view.setAnchorPoint(anchorPoint: CGPoint(x: 1, y: 0))
        transitionContext.containerView.backgroundColor = UIColor.lightGray
        
         UIView.animate(withDuration: self.transitionDuration(using: transitionContext),
                       delay: 0.0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 0.8,
                       options: [], animations: {
                        destinationViewController.view.transform = .identity
                        destinationViewController.view.frame = CGRect(x: 0, y: 0, width: containerViewFrame.width, height: containerViewFrame.height)
                        sourceViewController.view.transform = offScreenRotateIn
                        }, completion: {
                        finished in
                        transitionContext.completeTransition(finished)
                       })
    }
}
