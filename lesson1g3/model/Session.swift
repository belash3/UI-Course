//
//  Session.swift
//  lesson1g3
//
//  Created by Сергей Беляков on 23.05.2021.
//

import UIKit

final class Session: NSObject {
    private override init () {}
    static let shared = Session()
    
    var token = String()
    var userId = Int()
}
