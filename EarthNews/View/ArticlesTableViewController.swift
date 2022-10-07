//
//  ArticlesTableViewController.swift
//  EarthNews
//
//  Created by Justina Siaulyte on 2022-09-30.
//

import UIKit

class ArticlesTableViewController: UITableViewController {
    let dataModel: ArticlesViewModel
    
    init(dataModel: ArticlesViewModel) {
        self.dataModel = dataModel
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(ArticleTableViewCell.nib, forCellReuseIdentifier: ArticleTableViewCell.identifier)
        
        dataModel.fetchArticles()
    }

    // MARK: TableView DataSource methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModel.articles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ArticleTableViewCell.identifier,
                                                       for: indexPath) as? ArticleTableViewCell else {
            fatalError("Failed to add a custom cell to tableview.")
        }
        
        cell.configure(with: dataModel.articles[indexPath.row])
       
        return cell
    }
}

