//
//  News.swift
//  lesson1g3
//
//  Created by Сергей Беляков on 27.04.2021.
//

import Foundation
import UIKit

struct News {
    var user: User
    var newsTitle: String
    var newsText: String
    var image: UIImage?
}

func setNewNews(user: User, newsTitle: String, newsText: String) -> News {
    var newNews = News(user: user, newsTitle: newsTitle, newsText: newsText)
    
    newNews.user = user
    newNews.newsTitle = newsTitle
    newNews.newsText = newsText
    
    let imagename = String(user.name) + "_news"
    if let picture = UIImage(named: imagename) {
        newNews.image = picture
    }
    return newNews
}
