//
//  DetailView.swift
//  EarthNews
//
//  Created by Justina Siaulyte on 2023-02-21.
//

import UIKit

class DetailView: UIView {
    
    private let titleLabel = UILabel()
    private let authorLabel = UILabel()
    private let dateLabel = UILabel()
    private let articleImageView = UIImageView()
    private let bodyLabel = UILabel()
    private let urlLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: 200)
    }
}

extension DetailView {
    
    private func style() {
        translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        titleLabel.numberOfLines = 0
        titleLabel.textColor = .label
        titleLabel.textAlignment = .center
        
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        authorLabel.font = UIFont.preferredFont(forTextStyle: .caption1)
        authorLabel.textColor = .secondaryLabel
        authorLabel.textAlignment = .center
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.font = UIFont.preferredFont(forTextStyle: .caption2)
        dateLabel.textColor = .secondaryLabel
        dateLabel.textAlignment = .center
        
        articleImageView.translatesAutoresizingMaskIntoConstraints = false
        articleImageView.contentMode = .scaleAspectFill
        articleImageView.layer.cornerRadius = 10
        articleImageView.clipsToBounds = true
        

        bodyLabel.translatesAutoresizingMaskIntoConstraints = false
        bodyLabel.font = UIFont.preferredFont(forTextStyle: .body)
        bodyLabel.textColor = .label
        bodyLabel.textAlignment = .left
        bodyLabel.numberOfLines = 0
        
        urlLabel.translatesAutoresizingMaskIntoConstraints = false
        urlLabel.font = UIFont.preferredFont(forTextStyle: .callout)
        urlLabel.textAlignment = .left
    }
    
    private func layout() {
        addSubview(titleLabel)
        addSubview(authorLabel)
        addSubview(dateLabel)
        addSubview(articleImageView)
        addSubview(bodyLabel)
        addSubview(urlLabel)
        
        NSLayoutConstraint.activate([
            
        ])
    }
}

