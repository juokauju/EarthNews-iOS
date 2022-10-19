//
//  ArticleTableViewController.swift
//  EarthNews
//
//  Created by Justina Siaulyte on 2022-09-30.
//

import UIKit

class ArticleTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let viewModel = LiveDataArticleViewModel()
    
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ArticleTableViewCell.nib,
                           forCellReuseIdentifier: ArticleTableViewCell.identifier)
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
//        guard let viewModel = viewModel else {
//            fatalError("The viewModel is not implemented")
//        }
        viewModel.fetchArticles(completion: { result in
            if result {
                print("Articles succsessfully fetched.")
                self.view.addSubview(self.tableView)
            } else {
                print("Articles failed to fetch.")
            }
        })
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }

    // MARK: TableView DataSource methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(viewModel.articles.count)
        return viewModel.articles.count
    }
    
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ArticleTableViewCell.identifier,
                                                       for: indexPath) as? ArticleTableViewCell else {
            fatalError("Failed to add a custom cell to tableview.")
        }
        
//        guard let viewModel = viewModel else {
//            fatalError("The viewModel is not implemented")
//        }
        
        cell.configure(with: viewModel.articles[indexPath.row])
        
        return cell
    }
}

