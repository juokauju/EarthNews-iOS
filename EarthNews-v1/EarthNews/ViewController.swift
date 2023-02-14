//
//  ViewController.swift
//  EarthNews
//
//  Created by Justina Siaulyte on 2023-02-13.
//

import UIKit

class ViewController: UIViewController {
    
    let articleView = ArticleShortView()
    let service = GuardianAPIService()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Task {
            try await service.fetch()
        }
        
        view.addSubview(articleView)
        NSLayoutConstraint.activate([
            articleView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            articleView.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 5),
            articleView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            articleView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }


}

