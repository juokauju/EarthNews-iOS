//
//  LatestArticleViewController.swift
//  EarthNews
//
//  Created by Justina Siaulyte on 2022-09-30.
//

import UIKit

class LatestArticleViewController: UIViewController, UITableViewDelegate {

    let viewModel = LatestArticleViewModel()
    
//    private var tableView: UITableView = {
//        let tableView = UITableView()
//        tableView.register(ArticleTableViewCell.nib,
//                           forCellReuseIdentifier: ArticleTableViewCell.identifier)
//        return tableView
//    }()
    
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ArticleCell.self,
                           forCellReuseIdentifier: ArticleCell.reuseID)
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
}

// MARK: - TableView DataSource methods

extension LatestArticleViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.articles.count
    }
    
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let cell = tableView.dequeueReusableCell(withIdentifier: ArticleCell.reuseID,
                                                      for: indexPath) as? ArticleCell else {
           return UITableViewCell()
       }
       
//       cell.configure(with: viewModel.articles[indexPath.row], databaseIcon: viewModel.actionOnDatabaseIcon)
       cell.configure(with: viewModel.articles[indexPath.row], vm: viewModel)
       
//       cell.delegate = self
       return cell
   }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
}

extension LatestArticleViewController: ArticleTableViewCellDelegate {
    func didTapIcon(with article: ArticleWithImage) {
        viewModel.actOnDatabase(with: article)
    }
}
