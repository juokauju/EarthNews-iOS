//
//  LiveArticleViewController.swift
//  EarthNews
//
//  Created by Justina Siaulyte on 2022-09-30.
//

import UIKit

class LiveArticleViewController: UIViewController, UITableViewDelegate {

    let viewModel = LiveArticleViewModel()
    
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

        viewModel.fetchArticles(completion: { result in
            if result {
                self.view.addSubview(self.tableView)
            } else {
                fatalError("Articles was not fetched.")
            }
        })
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }

    // MARK: TableView DataSource methods
}

extension LiveArticleViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(viewModel.articles.count)
        return viewModel.articles.count
    }
    
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier:ArticleTableViewCell.identifier,
                                                       for: indexPath) as? ArticleTableViewCell else {
            fatalError("Failed to add a custom cell to tableview.")
        }
        
        cell.configure(with: viewModel.articles[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
}

