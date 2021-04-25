//
//  user.swift
//  lesson1g3
//
//  Created by Сергей Беляков on 14.04.2021.
//

import Foundation
import UIKit

enum Gender: String {
    case male = "мужской"
    case female = "женский"
}

struct User {
    var name: String
    var age: UInt?
    var gender: Gender
    var avatar: UIImage?
    var userPhotoGallery = [UIImage]()
}

func setNewUser(userNumber: Int, name: String, age: UInt, gender: Gender) -> User {
    var newUser = User(name: name, gender: gender)
    newUser.age = age
    
    var imageName = String(userNumber) + "_1"
    newUser.avatar = UIImage(named: imageName)
    
    for index in 2...5 {
        imageName = String(userNumber) + "_" + String(index)
        if let image = UIImage(named: imageName) {
            newUser.userPhotoGallery.append(image)
        }
    }
    return newUser
}
