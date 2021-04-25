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
    
    @IBOutlet weak var likeButton: UIButton!
    
    @IBAction func likeButton(_ sender: Any) {
        if !isLiked {
            likeLabel.text = String(numberOfLikes + 1)
            likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            likeButton.tintColor = UIColor.red
        } else if isLiked {
            likeLabel.text = String(numberOfLikes)
            likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
            likeButton.tintColor = UIColor.black
        }
        isLiked = !isLiked
    }
    
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var photoUIView: UIImageView!
    
    var saveImage: UIImage?
    
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
}
