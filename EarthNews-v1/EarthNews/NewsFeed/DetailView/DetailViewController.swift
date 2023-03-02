//
//  DetailViewController.swift
//  EarthNews
//
//  Created by Justina Siaulyte on 2023-02-21.
//

import UIKit

class DetailViewController: UIViewController {
    

    @UsesAutoLayout private var scrollView = UIScrollView()
    @UsesAutoLayout private var detailView = DetailView()
    
    private var readMoreUrl: URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

extension DetailViewController {
    func setup() {
        setupScrollView()
        setChevronBackNavigationButton()
        detailView.delegate = self
    }
    
    func setupScrollView() {
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

extension DetailViewController: DetailViewDelegate {
    func urlButtonTapped() {
        guard let url = readMoreUrl else { return }
        let webVC = WebViewController(url: url)
        navigationController?.moveInViewControllerAnimated(webVC)
    }
}

extension DetailViewController {
    func configure(with vm: ArticleViewModel) {
        detailView.configure(with: vm)
        readMoreUrl = vm.webUrl
    }
}
