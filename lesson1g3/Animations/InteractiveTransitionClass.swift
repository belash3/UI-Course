//
//  InteractiveTransitionClass.swift
//  lesson1g3
//
//  Created by Сергей Беляков on 09.05.2021.
//

import UIKit

class InteractiveTransitionClass: UIPercentDrivenInteractiveTransition {
    var viewController: UIViewController? {
        didSet {
            let recognizer = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(onPan(_:)))
            recognizer.edges = [.left]
            viewController?.view.addGestureRecognizer(recognizer)
        }
    }
    
    var isStarted = false
    var shouldFinished = false
    
    @objc func onPan(_ recognizer: UIScreenEdgePanGestureRecognizer) {
        switch recognizer.state {
        
        case .began:
            self.isStarted = true
            self.viewController?.navigationController?.popViewController(animated: true)
        
        case .changed:
            var translation = recognizer.translation(in: recognizer.view)
            if translation.x < 0 {
                translation.x = -translation.x
            }
            let relativeTransition = translation.x / (recognizer.view?.bounds.width ?? 1)
            let progress = max(0, min(1, relativeTransition))
            self.shouldFinished = progress > 0.33
            self.update(progress)
            
        case .ended:
            self.isStarted = false
            self.shouldFinished ? self.finish() : self.cancel()
            
        case .cancelled:
            self.isStarted = false
            self.cancel()
            
        default: return
        }
    }
}
