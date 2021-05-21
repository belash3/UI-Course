//
//  ReccCommunitiesTableViewController.swift
//  lesson1g3
//
//  Created by Сергей Беляков on 15.04.2021.
//
import Foundation
import UIKit

class ReccCommunitiesTableViewController: UITableViewController, UISearchBarDelegate {
    
    @IBOutlet weak var reccSearchBar: UISearchBar!
    @IBOutlet weak var popUpLabel: UILabel!
    @IBOutlet weak var popUpView: UIView!
    
    var blurView = UIView()
    var index: IndexPath = []
    var filtredData = [Group](DataStorage.shared.recommendedGroups)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib(nibName: "MyCustomTableViewCell", bundle: nil), forCellReuseIdentifier: myCustomTableViewCellReuse)
        reccSearchBar.delegate = self
        self.navigationController?.delegate = self
    }
    
    @IBAction func pressAddCmntyBtn(_ sender: Any) {
        guard let cell = tableView.cellForRow(at: index) as? MyCustomTableViewCell,
              let group = cell.saveGroup
        else {return}
        var isUnableForAdd = false
        for item in DataStorage.shared.myGroups {
            if item.name == group.name {
                isUnableForAdd = true
            }
        }
        if !isUnableForAdd {
            DataStorage.shared.myGroups.append(group)
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func pressCancelBtn(_ sender: Any) {
        removePopUpView()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filtredData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: myCustomTableViewCellReuse, for: indexPath) as? MyCustomTableViewCell else {return UITableViewCell()}
        cell.configureGroup(group: filtredData[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        index = indexPath
        let tmpGroup = DataStorage.shared.recommendedGroups[indexPath.row]
        popUpLabel.text = tmpGroup.name
        addPopUpView()
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
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filtredData = []
        if searchText == "" {
            filtredData = DataStorage.shared.recommendedGroups
        } else {
            for group in DataStorage.shared.recommendedGroups {
                if group.name!.lowercased().contains(searchText.lowercased()) {
                    filtredData.append(group)
                }
            }
        }
        self.tableView.reloadData()
    }
}

extension ReccCommunitiesTableViewController: UINavigationControllerDelegate{
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        if operation == .push {
            return PushAnimation()
        } else if operation == .pop {
            return PopAnimation()
        } else {return PopAnimation()}
    }
}

