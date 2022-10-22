//
//  ArchiveArticleViewController.swift
//  EarthNews
//
//  Created by Justina Siaulyte on 2022-10-22.
//

import Foundation

import UIKit

class ArchiveArticleViewController: UIViewController {

    let viewModel = ArchiveArticleViewModel()
    
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
                print("Articles succsessfully fetched.")
                print(self.viewModel.articles[0].image)
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
}

extension ArchiveArticleViewController: UITableViewDataSource {
    
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
        return 200
    }
}

extension ArchiveArticleViewController: UITableViewDelegate {
   
    
}

