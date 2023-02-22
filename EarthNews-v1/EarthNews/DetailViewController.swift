//
//  DetailViewController.swift
//  EarthNews
//
//  Created by Justina Siaulyte on 2023-02-21.
//

import UIKit

class DetailViewController: UIViewController, UIScrollViewDelegate {
    

    private let scrollView = UIScrollView()
    private let detailView = DetailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScrollView()
    }
}

extension DetailViewController {
    func setupScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(scrollView)
        scrollView.addSubview(detailView)
        
        NSLayoutConstraint.activate([
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            detailView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            detailView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            detailView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            detailView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
    }
}

extension DetailViewController {
    func configure(with vm: ArticleViewModel) {
        detailView.configure(with: vm)
    }
}
