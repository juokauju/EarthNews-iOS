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
        titleLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
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
            titleLabel.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            authorLabel.topAnchor.constraint(equalToSystemSpacingBelow: titleLabel.bottomAnchor, multiplier: 2),
            authorLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22),
            authorLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22),
            
            dateLabel.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 4),
            dateLabel.leadingAnchor.constraint(equalTo: authorLabel.leadingAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: authorLabel.trailingAnchor),
            
            articleImageView.heightAnchor.constraint(equalToConstant: screenWidth * 0.7),
            articleImageView.topAnchor.constraint(equalToSystemSpacingBelow: dateLabel.bottomAnchor, multiplier: 2),
            articleImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            articleImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            bodyLabel.topAnchor.constraint(equalToSystemSpacingBelow: articleImageView.bottomAnchor, multiplier: 1),
            bodyLabel.leadingAnchor.constraint(equalTo: articleImageView.leadingAnchor, constant: 8),
            bodyLabel.trailingAnchor.constraint(equalTo: articleImageView.trailingAnchor, constant: -8),
            
            urlLabel.topAnchor.constraint(equalToSystemSpacingBelow: bodyLabel.bottomAnchor, multiplier: 3),
            urlLabel.leadingAnchor.constraint(equalTo: bodyLabel.leadingAnchor),
            urlLabel.trailingAnchor.constraint(equalTo: bodyLabel.trailingAnchor),
            urlLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30)
        ])
    }
}

extension DetailView {
    func configure(with vm: ArticleViewModel) {
        titleLabel.text = vm.title
        authorLabel.text = vm.getAuthor()
        dateLabel.text = vm.date.formatted()
        articleImageView.image = vm.image
        bodyLabel.attributedText = vm.getBodyAsNonHtml()
        urlLabel.text = "some url"
    }
}
