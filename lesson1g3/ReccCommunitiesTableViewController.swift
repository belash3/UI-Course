//
//  ReccCommunitiesTableViewController.swift
//  lesson1g3
//
//  Created by Сергей Беляков on 15.04.2021.
//
import Foundation
import UIKit

class ReccCommunitiesTableViewController: UITableViewController {
    
    var index: IndexPath = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib(nibName: "MyCustomTableViewCell", bundle: nil), forCellReuseIdentifier: myCustomTableViewCellReuse)
        
    }
    @IBOutlet weak var popUpLabel: UILabel!
    
    @IBOutlet weak var popUpView: UIView!
    
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
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataStorage.shared.recommendedGroups.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: myCustomTableViewCellReuse, for: indexPath) as? MyCustomTableViewCell else {return UITableViewCell()}
        cell.configureGroup(group: DataStorage.shared.recommendedGroups[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    
    }
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        var nameArray = [String]()
        for index in DataStorage.shared.recommendedGroups {
            let username = index.name
            nameArray.append(username!)
        }
        
        var firstLettersArray = [String]()
        for name in nameArray {
            let letter = name.prefix(1)
            firstLettersArray.append(String(letter))
        }
        
        return firstLettersArray
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        index = indexPath
        let tmpGroup = DataStorage.shared.recommendedGroups[indexPath.row]
        popUpLabel.text = tmpGroup.name
        addPopUpView()
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
}
