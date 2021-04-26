//
//  CommunitiesTableView.swift
//  lesson1g3
//
//  Created by Сергей Беляков on 12.04.2021.
//

import UIKit
let myCustomTableViewCellIdentifier = "MyCustomTableViewCell"
class MyCommunitiesTableView: UITableViewController {
    

    @IBOutlet weak var myCommunitiesTableView: UITableView!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib(nibName: "MyCustomTableViewCell", bundle: nil), forCellReuseIdentifier: myCustomTableViewCellReuse)

    
    

    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        DataStorage.shared.myGroups.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: myCustomTableViewCellReuse, for: indexPath) as? MyCustomTableViewCell else {return UITableViewCell()}
        
        cell.configureGroup(group: DataStorage.shared.myGroups[indexPath.row])

        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        DataStorage.shared.myGroups.remove(at: indexPath.row)
        self.tableView.reloadData()
    }
}
