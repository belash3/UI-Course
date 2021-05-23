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
    
    func fillGallery(of user: User) {
        images = user.userPhotoGallery
    }
    
    
    var blurView = UIView()
    var photoGlryindex: IndexPath = []
    var firstNameLettersArray = [String]()
    var usersDict = [String: [User]]()
    var userSectionTitles = [String]()
    
    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var myFriends: UITableView!
    @IBOutlet weak var popUpLabel: UILabel!
    @IBOutlet weak var swypeGlryBtn: UIButton!
    
    @IBAction func shwPhotoGllryButton(_ sender: Any) {
        guard let cell = tableView.cellForRow(at: photoGlryindex) as? MyCustomTableViewCell,
              let user = cell.saveUser
        else {return}
        performSegue(withIdentifier: fromFriendsToPhotoSegue, sender: user)
        removePopUpView()
    }
    
    
    @IBAction func swypeGlryBtn(_ sender: Any) {
        guard let cell = tableView.cellForRow(at: photoGlryindex) as? MyCustomTableViewCell,
              let user = cell.saveUser
        else {return}
        fillGallery(of: user)
        performSegue(withIdentifier: "fromFriendsToSwypeGallery", sender: user)
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
        self.navigationController?.delegate = self
        (self.navigationController as? MyNavigationViewControllerWithAnimations)?.interactiveTransition.viewController = self
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
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
        if let usersValues = usersDict[usersKey] {
            cell.configureUser(user: usersValues[indexPath.row])
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
        guard let cell = tableView.cellForRow(at: indexPath) as? MyCustomTableViewCell,
              let user = cell.saveUser
        else {return}
        photoGlryindex = indexPath
        popUpLabel.text = user.name
        addPopUpView()
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return userSectionTitles
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else {return}
        header.tintColor = UIColor.init(white: 1.5, alpha: 0.5)
    }
    
    func addPopUpView () {
        self.tableView.addSubview(popUpView)
        popUpView.layer.position = CGPoint(x: self.tableView.frame.size.width/2, y: self.tableView.frame.size.height/2.5)
        popUpView.layer.cornerRadius = 10
        popUpView.transform = CGAffineTransform.init(scaleX: 1.5, y: 1.5)
        popUpView.alpha = 0
        
        let darkBlur = UIBlurEffect(style: UIBlurEffect.Style.regular)
        blurView = UIVisualEffectView(effect: darkBlur)
        blurView.frame = self.tableView.frame
        blurView.alpha = 0
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.8, options: .curveEaseOut, animations: {
            self.popUpView.alpha = 0.8
            self.popUpView.transform = CGAffineTransform.identity
            self.tableView.addSubview(self.blurView)
            self.blurView.alpha = 1
            self.tableView.bringSubviewToFront(self.popUpView)
        }, completion: nil)
    }
    
    
    func removePopUpView() {
        UIView.animate(withDuration: 0.3,
                       animations: {
                        self.popUpView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
                        self.popUpView.alpha = 0
                        self.blurView.alpha = 0
                       }) {(success: Bool) in
            self.popUpView.removeFromSuperview()
            self.blurView.removeFromSuperview()
            
        }
    }
    
    func createUsersDictionary() {
        var usersArray = [User]()
        for user in DataStorage.shared.usersArray {
            usersArray.append(user)
        }
        for user in usersArray {
            let firstLetterIndex = user.name.index(user.name.startIndex, offsetBy: 1)
            let userKey = String(user.name[..<firstLetterIndex])
            if var usersValues = usersDict[userKey] {
                usersValues.append(user)
                usersDict[userKey] = usersValues
            } else {
                usersDict[userKey] = [user]
            }
        }
        userSectionTitles = [String] (usersDict.keys)
        userSectionTitles = userSectionTitles.sorted(by: {$0 < $1})
    }
}

extension MyFriendsTableViewController: UINavigationControllerDelegate{
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        if operation == .push {
            return PushAnimation()
        } else if operation == .pop {
            return PopAnimation()
        } else {return PopAnimation()}
    }
}

