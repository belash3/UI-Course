//
//  SwypePhotoGalleryViewController.swift
//  lesson1g3
//
//  Created by Сергей Беляков on 02.05.2021.
//

import UIKit
var images = [UIImage]()

class SwypePhotoGalleryViewController: UIViewController {
    var delegate: SwypeVCDelegate?
    
//    func fillGallery(of user: User) {
//        images = user.userPhotoGallery
//    }
    

    @IBOutlet weak var galleryView: HorizontalSwypeView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        galleryView.setImages(images: images)
        // Do any additional setup after loading the view.
    }
//    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "fromFriendsToSwypeGallery" {
//            let destinationVC = segue.destination as! MyFriendsTableViewController
//            destinationVC.delegate = self
//        }
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
protocol SwypeVCDelegate {
    func fillGallery(of user: User)
}
