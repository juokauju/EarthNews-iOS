//
//  ArticleCell.swift
//  EarthNews
//
//  Created by Justina Siaulyte on 2023-02-19.
//

import UIKit

class ArticleCell: UITableViewCell {
    
    // Static
    
    static let reuseID = "ArticleCell"
    static let rowHeight: CGFloat = 400
    
    // Private
    
    private let dividerView = UIView()
    private let dateLabel = UILabel()
    private let articleImageView = UIImageView()
    private let titleLabel = UILabel()
    private let authorLabel = UILabel()
    private let subtitleLabel = UILabel()
    private let saveButton = UIButton()
    
    
    // Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ArticleCell {
    private func setup() {
        contentView.translatesAutoresizingMaskIntoConstraints = true
        
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        dividerView.backgroundColor = .systemGreen
        dividerView.layer.cornerRadius = 2
        dividerView.setContentHuggingPriority(.defaultHigh, for: .vertical)
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.font = UIFont.preferredFont(forTextStyle: .caption2)
        dateLabel.textColor = .secondaryLabel
        dateLabel.textAlignment = .left
        dateLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)
        
        articleImageView.translatesAutoresizingMaskIntoConstraints = false
        articleImageView.contentMode = .scaleAspectFill
        articleImageView.layer.cornerRadius = 10
        articleImageView.clipsToBounds = true
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        titleLabel.numberOfLines = 0
        titleLabel.textColor = .label
        titleLabel.textAlignment = .left
        titleLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)
        
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        authorLabel.font = UIFont.preferredFont(forTextStyle: .caption1)
        authorLabel.textColor = .tertiaryLabel
        authorLabel.textAlignment = .left
        authorLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)
        
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.font = UIFont.preferredFont(forTextStyle: .subheadline)
        subtitleLabel.textColor = .secondaryLabel
        subtitleLabel.textAlignment = .left
        subtitleLabel.numberOfLines = 0
        subtitleLabel.setContentHuggingPriority(.defaultLow, for: .vertical)

        saveButton.translatesAutoresizingMaskIntoConstraints = false
        if let image = UIImage(systemName: "square.and.arrow.down") {
            saveButton.setImage(image, for: .normal)
        }
        saveButton.setTitle(" Save", for: .normal)
        saveButton.setTitleColor(.systemGreen, for: .normal)
        saveButton.tintColor = .systemGreen
        saveButton.setContentHuggingPriority(.defaultHigh, for: .vertical)
    }
    
    private func layout() {
        contentView.addSubview(dividerView)
        contentView.addSubview(dateLabel)
        contentView.addSubview(articleImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(authorLabel)
        contentView.addSubview(subtitleLabel)
        contentView.addSubview(saveButton)
        
        let imageViewWidth = screenWidth * 0.7
        
        NSLayoutConstraint.activate([
            dividerView.heightAnchor.constraint(equalToConstant: 4),
            dividerView.topAnchor.constraint(equalTo: topAnchor),
            dividerView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: dividerView.trailingAnchor, multiplier: 1),
            
            dateLabel.topAnchor.constraint(equalToSystemSpacingBelow: dividerView.bottomAnchor, multiplier: 1),
            dateLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: dividerView.leadingAnchor, multiplier: 2),
            
            articleImageView.heightAnchor.constraint(equalToConstant: imageViewWidth * 0.6),
            articleImageView.topAnchor.constraint(equalToSystemSpacingBelow: dateLabel.bottomAnchor, multiplier: 1),
            articleImageView.leadingAnchor.constraint(equalToSystemSpacingAfter: dividerView.leadingAnchor, multiplier: 1),
            articleImageView.trailingAnchor.constraint(equalTo: dividerView.trailingAnchor, constant: -8),
            
            titleLabel.topAnchor.constraint(equalToSystemSpacingBelow: articleImageView.bottomAnchor, multiplier: 2),
            titleLabel.leadingAnchor.constraint(equalTo: articleImageView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: articleImageView.trailingAnchor),
            
            authorLabel.topAnchor.constraint(equalToSystemSpacingBelow: titleLabel.bottomAnchor, multiplier: 1),
            authorLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            
            subtitleLabel.topAnchor.constraint(equalToSystemSpacingBelow: authorLabel.bottomAnchor, multiplier: 1),
            subtitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            subtitleLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            saveButton.topAnchor.constraint(equalToSystemSpacingBelow: subtitleLabel.bottomAnchor, multiplier: 2),
            saveButton.leadingAnchor.constraint(equalToSystemSpacingAfter: subtitleLabel.leadingAnchor, multiplier: 0),
            saveButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            saveButton.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}

extension ArticleCell {
    func configure(with vm: ArticleViewModel) {
        dateLabel.text = vm.date.formatted()
        articleImageView.image = vm.image
        titleLabel.text = vm.title
        authorLabel.text = vm.getAuthor()
        subtitleLabel.attributedText = vm.getSubtitleAsNonHtml()
    }
}


