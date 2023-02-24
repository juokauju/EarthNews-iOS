//
//  NewsFeedViewController.swift
//  EarthNews
//
//  Created by Justina Siaulyte on 2023-02-13.
//

import UIKit

class NewsFeedViewController: UIViewController {
    
    let service = GuardianAPIService()
    
    // Private
    
    private let tableView = UITableView()
    private var articleViewModels: [ArticleViewModel] = []
    
    // Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        loadArticles()
    }
}

// MARK: - TableView setup
extension NewsFeedViewController {
    private func setup() {
        self.title = "Earth News"
        setupTableView()
        setupRefreshControl()
    }
    
    private func setupTableView() {
        tableView.backgroundColor = .systemBackground
        tableView.delegate = self
        tableView.dataSource = self
        
        registerCell()
        
        view.addSubview(tableView)
        addTableViewConstraints()
    }
    
    private func registerCell() {
        tableView.register(ArticleCell.self,
                           forCellReuseIdentifier: ArticleCell.reuseID)
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.rowHeight = ArticleCell.rowHeight
        tableView.tableFooterView = UIView()
    }
    
    private func addTableViewConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func setupRefreshControl() {
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = .systemGreen
        refreshControl.addTarget(self, action: #selector(refreshContent), for: .valueChanged)
        tableView.refreshControl = refreshControl
    }
}

// MARK: - TableView Data Source
extension NewsFeedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard !articleViewModels.isEmpty else { return UITableViewCell() }
        let article = articleViewModels[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ArticleCell.reuseID, for: indexPath) as! ArticleCell
        cell.configure(with: article)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        articleViewModels.count
    }
}

// MARK: - TableView Delegate
extension NewsFeedViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let articleViewModel = articleViewModels[indexPath.row]
        let detailVC = DetailViewController()
        detailVC.configure(with: articleViewModel)
        navigationController?.moveInViewControllerAnimated(detailVC)
    }
}

extension NewsFeedViewController {
    @objc private func refreshContent() {
        loadArticles()
    }
}

// MARK: - Networking
extension NewsFeedViewController {
    private func loadArticles() {
        service.fetchArticleViewModels { articles in
            self.articleViewModels = articles
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}
