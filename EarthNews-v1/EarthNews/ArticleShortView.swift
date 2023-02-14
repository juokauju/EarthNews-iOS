//
//  ArticleShortView.swift
//  EarthNews
//
//  Created by Justina Siaulyte on 2023-02-13.
//

import UIKit

import UIKit

class ArticleShortView: UIView {
    
    let dividerView = UIView()
    let dateLabel = UILabel()
    let imageView = UIImageView()
    let titleLabel = UILabel()
    let authorLabel = UILabel()
    let subtitleLabel = UILabel()
    let saveButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ArticleShortView {
    
    private func style() {
        backgroundColor = .secondarySystemFill
        translatesAutoresizingMaskIntoConstraints = false
        
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        dividerView.backgroundColor = .systemGray4
        dividerView.layer.cornerRadius = 2
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.font = UIFont.preferredFont(forTextStyle: .caption2)
        dateLabel.textColor = .tertiaryLabel
        dateLabel.textAlignment = .left
        dateLabel.text = "XXXX/XX/XX XX:XX"
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "IMG_0524")!
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        titleLabel.textColor = .label
        titleLabel.textAlignment = .left
        titleLabel.text = "Article title"
        
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        authorLabel.font = UIFont.preferredFont(forTextStyle: .caption1)
        authorLabel.textColor = .tertiaryLabel
        authorLabel.textAlignment = .left
        authorLabel.text = "Author"
        
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.font = UIFont.preferredFont(forTextStyle: .body)
        subtitleLabel.textColor = .secondaryLabel
        subtitleLabel.textAlignment = .left
        subtitleLabel.numberOfLines = 0
        subtitleLabel.text = "hgjhdcf khdtdjytd ktfjytdytd jtydjyrtdyt tjydydty  tdjtdjgxgx kfht"
        
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        if let image = UIImage(systemName: "square.and.arrow.down") {
            saveButton.setImage(image, for: .normal)
        }
        saveButton.setTitle(" Save", for: .normal)
        saveButton.setTitleColor(.systemGreen, for: .normal)
        saveButton.tintColor = .systemGreen
    }
    
    private func layout() {
        addSubview(dividerView)
        addSubview(dateLabel)
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(authorLabel)
        addSubview(subtitleLabel)
        addSubview(saveButton)
        
        let imageViewWidth = screenWidth * 0.7
        
        NSLayoutConstraint.activate([
            dividerView.heightAnchor.constraint(equalToConstant: 4),
            dividerView.topAnchor.constraint(equalTo: topAnchor),
            dividerView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: dividerView.trailingAnchor, multiplier: 1),
            
            dateLabel.topAnchor.constraint(equalToSystemSpacingBelow: dividerView.bottomAnchor, multiplier: 1),
            dateLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: dividerView.leadingAnchor, multiplier: 2),
            
            
            imageView.widthAnchor.constraint(equalToConstant: imageViewWidth),
            imageView.heightAnchor.constraint(equalToConstant: imageViewWidth * 0.6),
            imageView.topAnchor.constraint(equalToSystemSpacingBelow: dateLabel.bottomAnchor, multiplier: 1),
            imageView.leadingAnchor.constraint(equalToSystemSpacingAfter: dividerView.leadingAnchor, multiplier: 1),
            imageView.trailingAnchor.constraint(equalTo: dividerView.trailingAnchor, constant: -8),
            
            titleLabel.topAnchor.constraint(equalToSystemSpacingBelow: imageView.bottomAnchor, multiplier: 1),
            titleLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
            
            authorLabel.topAnchor.constraint(equalToSystemSpacingBelow: titleLabel.bottomAnchor, multiplier: 1),
            authorLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            
            subtitleLabel.topAnchor.constraint(equalToSystemSpacingBelow: authorLabel.bottomAnchor, multiplier: 1),
            subtitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            subtitleLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            saveButton.topAnchor.constraint(equalToSystemSpacingBelow: subtitleLabel.bottomAnchor, multiplier: 2),
            saveButton.leadingAnchor.constraint(equalToSystemSpacingAfter: subtitleLabel.leadingAnchor, multiplier: 0),
            
            
        ])
    }
}

