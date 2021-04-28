//
//  DataStorage.swift
//  lesson1g3
//
//  Created by Сергей Беляков on 14.04.2021.
//

import UIKit

class DataStorage: NSObject {
    static let shared = DataStorage()
    private override init () {
        super.init()
    }
    
    var usersArray = [User]()
    var recommendedGroups = [Group]()
    var myGroups = [Group]()
    var newsArray = [News]()
}
