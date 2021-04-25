//
//  TabBarController.swift
//  lesson1g3
//
//  Created by Сергей Беляков on 14.04.2021.
//

import UIKit

class TabBarController: UITabBarController {
    
    func fillArrays() {
    
    let user1 = setNewUser(userNumber: 1, name: "Elon Musk", age: 49, gender: .male)
    let user2 = setNewUser(userNumber: 2, name: "Quentin Tarantino", age: 58, gender: .male)
    let user3 = setNewUser(userNumber: 3, name: "Tim Cook", age: 60, gender: .male)
    let user4 = setNewUser(userNumber: 4, name: "Selena Gomez", age: 28, gender: .female)
    let user5 = setNewUser(userNumber: 5, name: "Scarlett Johansson", age: 36, gender: .female)

    let usersArray = [user1, user2, user3, user4, user5]
        
    let group1 = Group(name: "Фильмы", description: "Отборные фильмы на каждый день", groupAvatar: UIImage(named: "films"))
    let group2 = Group(name: "Музыка", description: "Музыкальные новинки недели", groupAvatar: UIImage(named: "music"))
    let group3 = Group(name: "Интересные факты", description: "Как много ты знаешь о мире?", groupAvatar: UIImage(named: "facts"))
    let group4 = Group(name: "Рецепты", description: "Готовь вкусно вместе с нами", groupAvatar: UIImage(named: "food"))

    let groupArray = [group1, group2, group3, group4]

        
        DataStorage.shared.usersArray = usersArray
        DataStorage.shared.recommendedGroups = groupArray
    }
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillArrays()

    
    }
    

   

}
