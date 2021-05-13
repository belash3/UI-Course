//
//  PushAnimation.swift
//  lesson1g3
//
//  Created by Сергей Беляков on 08.05.2021.
//

import UIKit

class PushAnimation: NSObject {

}
extension PushAnimation: UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let sourceViewController = transitionContext.viewController(forKey: .from),
              let destinationViewController = transitionContext.viewController(forKey: .to) else {return}
        
        let containerViewFrame = transitionContext.containerView.frame
        let offScreenRotateIn = CGAffineTransform(rotationAngle: -.pi/2)
        let offScreenRotateOut = CGAffineTransform(rotationAngle: .pi/2)
//        let offScreenRight = CGAffineTransform(translationX: transitionContext.containerView.frame.width, y: 0)
//        let offScreenLeft = CGAffineTransform(translationX: -transitionContext.containerView.frame.width, y: 0)
        
        transitionContext.containerView.addSubview(destinationViewController.view)
        destinationViewController.view.transform = CGAffineTransform(rotationAngle: -.pi / 2)
        destinationViewController.view.frame = CGRect(x: containerViewFrame.width, y: -containerViewFrame.width/2, width: containerViewFrame.width, height: containerViewFrame.height)
        
           UIView.animate(withDuration: self.transitionDuration(using: transitionContext),
                       delay: 0.0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 0.8,
                       options: [], animations: {
                        sourceViewController.view.layer.anchorPoint = CGPoint(x: 0, y: 0)
                        sourceViewController.view.transform = offScreenRotateOut
                        destinationViewController.view.transform = .identity
                        destinationViewController.view.layer.anchorPoint = CGPoint(x: 0, y: 0)
                        sourceViewController.view.layer.position = CGPoint(x: 0, y: 0)
                        destinationViewController.view.layer.position = CGPoint(x: 0, y: 0)
                        transitionContext.completeTransition(true)
                        
                       }, completion: {finished in
                        transitionContext.completeTransition(finished)
                       })
         //*/
       /* UIView.animate(withDuration: self.transitionDuration(using: transitionContext),
                       animations: {
                        destinationViewController.view.frame = CGRect(x: 0, y: 0, width: containerViewFrame.width, height: containerViewFrame.width)
                        destinationViewController.view.transform = CGAffineTransform(rotationAngle: 0)},
                       completion: {secondFinished in
                        transitionContext.completeTransition(secondFinished)
                                           })
 */
    }
}
