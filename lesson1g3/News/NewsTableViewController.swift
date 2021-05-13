//
//  NewsTableViewController.swift
//  lesson1g3
//
//  Created by Сергей Беляков on 27.04.2021.
//

import UIKit

let newsTableViewCellReuse = "NewsTableViewCell"

class NewsTableViewController: UITableViewController {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.delegate = self
        let nibFile = UINib(nibName: "NewsTableViewCell", bundle: nil)
        self.tableView.register(nibFile, forCellReuseIdentifier: newsTableViewCellReuse)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 500
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataStorage.shared.newsArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: newsTableViewCellReuse, for: indexPath) as? NewsTableViewCell else {return UITableViewCell()}
        cell.configureNews(news: DataStorage.shared.newsArray[indexPath.row])
        return cell
    }
}

extension NewsTableViewController: UINavigationControllerDelegate{
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        if operation == .push {
            return PushAnimation()
        } else if operation == .pop {
            return PushAnimation()
        } else {return PopAnimation()}
    }
}
