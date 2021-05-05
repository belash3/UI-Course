//
//  FriendsPhotoCollectionViewCell.swift
//  lesson1g3
//
//  Created by Сергей Беляков on 15.04.2021.
//

import UIKit

class FriendsPhotoCollectionViewCell: UICollectionViewCell {
    
    var isLiked = false
    var numberOfLikes = Int.random(in: 1...100)
    var saveImage: UIImage?
    
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var photoUIView: UIImageView!
        
    func clearCell() {
        photoUIView.image = nil
        saveImage = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        clearCell()
    }

    override func prepareForReuse() {
        clearCell()
    }
    
    func configure(image: UIImage) {
        photoUIView.image = image
        saveImage = image
        likeLabel.text = String(numberOfLikes)
    }
    
    @IBAction func likeButton(_ sender: Any) {
        if !isLiked {
            UIView.transition(with: self.likeLabel,
                              duration: 0.3,
                              options: .transitionCurlDown,
                              animations: {[weak self] in
                                guard let self = self else {return}
                                self.likeLabel.text = String(self.numberOfLikes + 1)},
                              completion: nil)
            likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            likeButton.tintColor = UIColor.red
        } else if isLiked {
            UIView.transition(with: self.likeLabel,
                              duration: 0.3,
                              options: .transitionCurlUp,
                              animations: {[weak self] in
                                guard let self = self else {return}
                                self.likeLabel.text = String(self.numberOfLikes)},
                              completion: nil)
            likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
            likeButton.tintColor = UIColor.systemBlue
        }
        isLiked = !isLiked
    }
}
