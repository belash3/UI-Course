//
//  MyFriendsTableViewController.swift
//  lesson1g3
//
//  Created by Сергей Беляков on 12.04.2021.
//

import UIKit
let myCustomTableViewCellReuse = "MyCustomTableViewCell"
let fromFriendsToPhotoSegue = "fromFriendsToPhoto"
let photoCollectionViewControllerID = "PhotoCollectionViewController"
class MyFriendsTableViewController: UITableViewController {
    
    var photoGlryindex: IndexPath = []
    var firstNameLettersArray = [String]()
    var usersDict = [String: [String]]()
    var userSectionTitles = [String]()
    
    
    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var myFriends: UITableView!
    @IBOutlet weak var popUpLabel: UILabel!
    
    @IBAction func shwPhotoGllryButton(_ sender: Any) {
        
        guard let cell = tableView.cellForRow(at: photoGlryindex) as? MyCustomTableViewCell,
              let user = cell.saveUser
        else {return}
        performSegue(withIdentifier: fromFriendsToPhotoSegue, sender: user)
        removePopUpView()
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        removePopUpView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nibFile = UINib(nibName: "MyCustomTableViewCell", bundle: nil)
        self.tableView.register(nibFile, forCellReuseIdentifier: myCustomTableViewCellReuse)
        createUsersDictionary()
        DataStorage.shared.usersArray.sort(by: {$0.name < $1.name})
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return userSectionTitles.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let userKey = userSectionTitles[section]
        guard let userValues = usersDict[userKey] else {return 0}
        
        return userValues.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: myCustomTableViewCellReuse, for: indexPath) as? MyCustomTableViewCell
        else {return UITableViewCell()}
        let usersKey = userSectionTitles[indexPath.section]
        
        for user in DataStorage.shared.usersArray {
            if usersKey == user.name.prefix(1) {
                cell.configureUser(user: user)
            }
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return userSectionTitles[section]
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == fromFriendsToPhotoSegue {
            guard let user = sender as? User,
                  let destination = segue.destination as? PhotoCollectionViewController
            else {return}
            destination.user = user
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        photoGlryindex = indexPath
        popUpLabel.text = "Hello!"
            //popUpLabel.text = DataStorage.shared.usersArray[indexPath.row].name
        addPopUpView()
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        
        for index in DataStorage.shared.usersArray {
            let username = index.name
            if !firstNameLettersArray.contains(String(username.prefix(1))) {
                firstNameLettersArray.append(String(username.prefix(1)))
            }
        }
        firstNameLettersArray.sort {$0 < $1}
        return firstNameLettersArray
    }
    
    
    func addPopUpView () {
        
        self.tableView.addSubview(popUpView)
        popUpView.center = self.tableView.center
        popUpView.layer.cornerRadius = 10
        popUpView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        popUpView.alpha = 0
        UIView.animate(withDuration: 0.5) {
            self.popUpView.alpha = 1
            self.popUpView.transform = CGAffineTransform.identity
        }
    }
    
    func removePopUpView() {
        UIView.animate(withDuration: 0.5, animations: {
            self.popUpView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.popUpView.alpha = 0
            
        }) { (success: Bool) in
            self.popUpView.removeFromSuperview()
        }
    }
    
    func createUsersDictionary() {
        
        var namesArray = [String]()
        for user in DataStorage.shared.usersArray {
            namesArray.append(user.name)
        }
        
        for name in namesArray {
            let firstLetterIndex = name.index(name.startIndex, offsetBy: 1)
            let nameKey = String(name[..<firstLetterIndex])
            
            if var nameValues = usersDict[nameKey] {
                nameValues.append(name)
                usersDict[nameKey] = nameValues
            } else {
                usersDict[nameKey] = [name]
            }
        }
        
        userSectionTitles = [String] (usersDict.keys)
        userSectionTitles = userSectionTitles.sorted(by: {$0 < $1})
        
    }
}