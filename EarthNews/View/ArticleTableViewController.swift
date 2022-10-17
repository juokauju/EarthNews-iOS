//
//  ArticleTableViewController.swift
//  EarthNews
//
//  Created by Justina Siaulyte on 2022-09-30.
//

import UIKit

class ArticleTableViewController: UITableViewController {
    var viewModel: ArticleViewModel?
    
    init(viewModel: ArticleViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
        }

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let viewModel = viewModel else {
            fatalError("The viewModel is not implemented")
        }

        tableView.register(ArticleTableViewCell.nib, forCellReuseIdentifier: ArticleTableViewCell.identifier)
        
        viewModel.fetchArticles()
    }

    // MARK: TableView DataSource methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.articles.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ArticleTableViewCell.identifier,
                                                       for: indexPath) as? ArticleTableViewCell else {
            fatalError("Failed to add a custom cell to tableview.")
        }
        
        guard let viewModel = viewModel else {
            fatalError("The viewModel is not implemented")
        }

        cell.configure(with: viewModel.articles[indexPath.row])
       
        return cell
    }
}

