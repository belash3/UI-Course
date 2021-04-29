//
//  NewsTableViewCell.swift
//  lesson1g3
//
//  Created by Сергей Беляков on 27.04.2021.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var userAvatar: UIImageView!    
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var commentsLabel: UILabel!
    
    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var newsTextLabel: UILabel!
    @IBOutlet weak var newsImageView: UIImageView!
    @IBInspectable var shadowOpacity: Float = 0.9
    @IBInspectable var shadowColor: UIColor = UIColor.black //.cgColor
    @IBInspectable var shadowRadius: CGFloat = 10
    
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var viewsLabel: UILabel!
    @IBOutlet weak var myBackView: UIView!
    
    var isLiked = false
    var numberOfLikes = Int.random(in: 1...100)
    var numberOfViews = Int.random(in: 100...2000)
    var numberOfComments = Int.random(in: 1...50)
    
    @IBAction func likeButton(_ sender: Any) {
        if !isLiked {
        UIView.transition(with: self.likeLabel,
                          duration: 0.3,
                          options: .transitionCurlDown,
                          animations: {[weak self] in
                            guard let self = self else {return}
                            self.likeLabel.text = String(self.numberOfLikes + 1)},
                          completion: nil)
        //likeLabel.text = String(numberOfLikes + 1)
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
        //likeLabel.text = String(numberOfLikes)
        likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
        likeButton.tintColor = UIColor.systemBlue
    }
    isLiked = !isLiked
    
//        if !isLiked {
//            likeLabel.text = String(numberOfLikes + 1)
//            likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
//            likeButton.tintColor = UIColor.red
//        } else if isLiked {
//            likeLabel.text = String(numberOfLikes)
//            likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
//            likeButton.tintColor = UIColor.systemBlue
//        }
//        isLiked = !isLiked
    }
    func configureNews(news: News) {
        userAvatar.image = news.user.avatar
        
        myBackView.layer.cornerRadius = myBackView.frame.size.width / 2
        myBackView.layer.shadowColor = shadowColor.cgColor
        myBackView.layer.shadowOpacity = shadowOpacity
        myBackView.layer.shadowRadius = shadowRadius
        myBackView.layer.shadowOffset = CGSize.zero
        userAvatar.layer.cornerRadius = userAvatar.frame.height / 2
        userNameLabel.text = news.user.name
        newsTitleLabel.text = news.newsTitle
        newsTextLabel.text = news.newsText
        newsImageView.image = news.image
        likeLabel.text = String(numberOfLikes)
        viewsLabel.text = String(numberOfViews)
        commentsLabel.text = String(numberOfComments)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
