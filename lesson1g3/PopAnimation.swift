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
        destinationViewController.view.layer.anchorPoint = CGPoint(x: 0, y: 0)
        destinationViewController.view.transform = CGAffineTransform(rotationAngle: .pi / 2)
        //sourceViewController.view.layer.anchorPoint = CGPoint(x: 0, y: 0)
        
        
     // /*
         UIView.animate(withDuration: self.transitionDuration(using: transitionContext),
                       delay: 0.0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 0.8,
                       options: [], animations: {
                        sourceViewController.view.transform = offScreenRotateIn
                        destinationViewController.view.transform = .identity
                        destinationViewController.view.layer.position = CGPoint(x: 0, y: 0)
                        destinationViewController.view.layer.anchorPoint = CGPoint(x: 0, y: 0)
                        sourceViewController.view.layer.position = CGPoint(x: 0, y: 0)
                        sourceViewController.view.layer.anchorPoint = CGPoint(x: 0, y: 0)
                        transitionContext.completeTransition(true)
                        
                       }, completion: {
                        finished in
                        transitionContext.completeTransition(finished)
                       })
        // */
        
         /* UIView.animate(withDuration: self.transitionDuration(using: transitionContext),
                       animations: {
                        
                        destinationViewController.view.transform = .identity
                        
                        //sourceViewController.view.layer.anchorPoint = CGPoint(x: 0, y: 0)
                        
                        sourceViewController.view.transform = CGAffineTransform(rotationAngle: -.pi / 2)
                        sourceViewController.view.frame = CGRect(x: containerViewFrame.width, y: -containerViewFrame.width, width: containerViewFrame.width, height: containerViewFrame.height)
                       },
                       completion: {finished in
                        transitionContext.containerView.addSubview(destinationViewController.view)
                        transitionContext.completeTransition(finished)
                       })
 */
    }
}
