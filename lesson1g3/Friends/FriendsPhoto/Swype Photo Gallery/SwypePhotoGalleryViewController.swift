//
//  SwypePhotoGalleryViewController.swift
//  lesson1g3
//
//  Created by Сергей Беляков on 02.05.2021.
//

import UIKit
var images = [UIImage]()

class SwypePhotoGalleryViewController: UIViewController {
    
    @IBOutlet weak var galleryView: HorizontalSwypeView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        galleryView.setImages(images: images)
        self.navigationController?.delegate = self
    }
}
extension SwypePhotoGalleryViewController: UINavigationControllerDelegate{
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        if operation == .push {
            return PushAnimation()
        //} else if operation == .pop {
       //     return PopAnimation()
        } else {
            return PopAnimation()
            
        }
    }
}
