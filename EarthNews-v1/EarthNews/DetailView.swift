//
//  DetailView.swift
//  EarthNews
//
//  Created by Justina Siaulyte on 2023-02-21.
//

import UIKit

protocol DetailViewDelegate: NSObject {
    func urlButtonTapped()
}

class DetailView: UIView {
    
    weak var delegate: DetailViewDelegate?
    
    private let dividerView = UIView()
    private let titleLabel = UILabel()
    private let authorLabel = UILabel()
    private let dateLabel = UILabel()
    private let articleImageView = UIImageView()
    private let bodyLabel = UILabel()
    private let urlButton = UIButton()
    
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
        
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        dividerView.backgroundColor = .systemGreen
        dividerView.layer.cornerRadius = 2
        
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
        articleImageView.clipsToBounds = true
        
        bodyLabel.translatesAutoresizingMaskIntoConstraints = false
        bodyLabel.font = UIFont.preferredFont(forTextStyle: .body)
        bodyLabel.textColor = .label
        bodyLabel.textAlignment = .left
        bodyLabel.numberOfLines = 0
        
        urlButton.translatesAutoresizingMaskIntoConstraints = false
        urlButton.setTitle("Read more...", for: .normal)
        urlButton.setTitleColor(.link, for: .normal)
        urlButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: .callout)
        urlButton.addTarget(self, action:#selector(self.urlButtonTapped), for: .touchUpInside)
    }
    
    private func layout() {
        addSubview(dividerView)
        addSubview(titleLabel)
        addSubview(authorLabel)
        addSubview(dateLabel)
        addSubview(articleImageView)
        addSubview(bodyLabel)
        addSubview(urlButton)
        
        NSLayoutConstraint.activate([
            dividerView.heightAnchor.constraint(equalToConstant: 4),
            dividerView.topAnchor.constraint(equalTo: topAnchor),
            dividerView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: dividerView.trailingAnchor, multiplier: 1),
            
            titleLabel.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            authorLabel.topAnchor.constraint(equalToSystemSpacingBelow: titleLabel.bottomAnchor, multiplier: 2),
            authorLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22),
            authorLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22),
            
            dateLabel.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 4),
            dateLabel.leadingAnchor.constraint(equalTo: authorLabel.leadingAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: authorLabel.trailingAnchor),
            
            articleImageView.heightAnchor.constraint(equalToConstant: screenWidth * 0.5),
            articleImageView.topAnchor.constraint(equalToSystemSpacingBelow: dateLabel.bottomAnchor, multiplier: 2),
            articleImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            articleImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            
            bodyLabel.topAnchor.constraint(equalToSystemSpacingBelow: articleImageView.bottomAnchor, multiplier: 1),
            bodyLabel.leadingAnchor.constraint(equalTo: articleImageView.leadingAnchor),
            bodyLabel.trailingAnchor.constraint(equalTo: articleImageView.trailingAnchor),
            
            urlButton.topAnchor.constraint(equalToSystemSpacingBelow: bodyLabel.bottomAnchor, multiplier: 1),
            urlButton.leadingAnchor.constraint(equalTo: bodyLabel.leadingAnchor),
            urlButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30),
            urlButton.heightAnchor.constraint(equalToConstant: 16)
        ])
    }
}

// MARK: - Actions
extension DetailView {
    @objc private func urlButtonTapped(_ sender: UIButton) {
        delegate?.urlButtonTapped()
    }
}

// MARK: - Configuration
extension DetailView {
    func configure(with vm: ArticleViewModel) {
        titleLabel.text = vm.title
        authorLabel.text = vm.getAuthor()
        dateLabel.text = vm.date.formatted()
        articleImageView.image = vm.image
        bodyLabel.attributedText = vm.getBodyAsNonHtml()
        
    }
}
