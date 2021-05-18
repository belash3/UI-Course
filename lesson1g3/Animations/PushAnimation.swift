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
        
        let offScreenRotateIn = CGAffineTransform(rotationAngle: -.pi/2)
        let offScreenRotateOut = CGAffineTransform(rotationAngle: .pi/2)
        
        transitionContext.containerView.backgroundColor = UIColor.lightGray
        transitionContext.containerView.addSubview(destinationViewController.view)
        destinationViewController.view.setAnchorPoint(anchorPoint: CGPoint(x: 1, y: 0))
        destinationViewController.view.transform = offScreenRotateIn
        sourceViewController.view.setAnchorPoint(anchorPoint: CGPoint(x: 1, y: 0))
        
           UIView.animate(withDuration: self.transitionDuration(using: transitionContext),
                       delay: 0.0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 0.8,
                       options: [], animations: {
                        destinationViewController.view.transform = .identity
                        sourceViewController.view.transform = offScreenRotateOut
                       }, completion: {finished in
                        transitionContext.completeTransition(finished)
                       })
    }
}

extension UIView{
    func setAnchorPoint(anchorPoint: CGPoint) {

        var newPoint = CGPoint(x: self.bounds.size.width * anchorPoint.x, y: self.bounds.size.height * anchorPoint.y)
        var oldPoint = CGPoint(x: self.bounds.size.width * self.layer.anchorPoint.x, y: self.bounds.size.height * self.layer.anchorPoint.y)

        newPoint = newPoint.applying(self.transform)
        oldPoint = oldPoint.applying(self.transform)

        var position : CGPoint = self.layer.position

        position.x -= oldPoint.x
        position.x += newPoint.x;

        position.y -= oldPoint.y;
        position.y += newPoint.y;

        self.layer.position = position;
        self.layer.anchorPoint = anchorPoint;
    }
}
