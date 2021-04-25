//
//  MyCustomTableViewCell.swift
//  lesson1g3
//
//  Created by Сергей Беляков on 12.04.2021.
//

import UIKit

class MyCustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var myBackview: UIView!
    @IBInspectable weak var myImageView: UIImageView!
    @IBOutlet weak var myLabel1: UILabel!
    @IBOutlet weak var myLabel2: UILabel!
    @IBOutlet weak var myLabel3: UILabel!
    @IBInspectable var shadowOpacity: Float = 0.9
    @IBInspectable var shadowColor: UIColor = UIColor.black //.cgColor
    @IBInspectable var shadowRadius: CGFloat = 10


    var saveUser: User?
    var saveGroup: Group?
    
    
    
    func clearCustomCell() {
        myImageView = nil
        myLabel1 = nil
        myLabel2 = nil
        myLabel3 = nil
        saveUser = nil
        saveGroup = nil
    }
    
    override func prepareForReuse() {
      //  clearCustomCell()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
       // clearCustomCell()
        // Initialization code
        myBackview.layer.cornerRadius = myBackview.frame.size.width / 2
        myBackview.layer.shadowColor = shadowColor.cgColor
        myBackview.layer.shadowOpacity = shadowOpacity
        myBackview.layer.shadowRadius = shadowRadius
        myBackview.layer.shadowOffset = CGSize.zero        
        myImageView.layer.cornerRadius = myImageView.frame.size.width / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    
    
    
    func configureUser(user: User) {
        
        myLabel1.text = user.name
        
        myLabel2.text = "Пол: " + user.gender.rawValue
        if let age = user.age {
            myLabel3.text = "Возраст: " + String(age)
        }
        if let image = user.avatar {
            myImageView.image = image
        }
        saveUser = user
    }
    
    func configureGroup(group: Group) {
        
        if let name = group.name {
            myLabel1.text = String(name) }
        
        myLabel2.text = " "
        if let descr = group.description {
            myLabel3.text = String(descr)
        }
        if let image = group.groupAvatar {
            myImageView.image = image
        }
        saveGroup = group
    }
    
}

