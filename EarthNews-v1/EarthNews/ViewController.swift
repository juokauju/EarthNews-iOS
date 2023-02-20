//
//  ViewController.swift
//  EarthNews
//
//  Created by Justina Siaulyte on 2023-02-13.
//

import UIKit

class ViewController: UIViewController {
    
    let service = GuardianAPIService()
    
    // Private
    
    private let tableView = UITableView()
    private var articleViewModels: [ArticleViewModel] = []

    // Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }

    override func viewWillAppear(_ animated: Bool) {
        loadArticles()
    }
}

// MARK: - TableView setup
extension ViewController {
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
        tableView.estimatedRowHeight = 500
        tableView.rowHeight = 400
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
}

// MARK: - TableView Data Source
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard !articleViewModels.isEmpty else { return UITableViewCell() }
        let article = articleViewModels[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ArticleCell.reuseID, for: indexPath) as! ArticleCell
        cell.configure(with: article)

        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
}

// MARK: - TableView Delegate
extension ViewController: UITableViewDelegate {
 
}

// MARK: - Networking
extension ViewController {
    private func loadArticles() {
        service.fetchArticleViewModels { articles in
            self.articleViewModels = articles
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}
