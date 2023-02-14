//
//  ArticleCell.swift
//  EarthNews
//
//  Created by jimi bird on 2023-02-06.
//

import UIKit

class ArticleCell: UITableViewCell {
    static let reuseID = "ArticleCell"
    static let rowHeight: CGFloat = 200
    
    private let stackView = UIStackView()
    private let iconImageStackView = UIStackView()
    private let iconImageView = UIImageView()
    private let emptyView = UIView()
    private let labelStackView = UIStackView()
    private let dateLabel = UILabel()
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    private let sourceLabel = UILabel()
    private let articleImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupStackView()
        layoutStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ArticleCell {
    private func setupStackView() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 8
        
        setupIconImageStackView()
        stackView.addArrangedSubview(iconImageStackView)
        setupLabelStackView()
        stackView.addArrangedSubview(labelStackView)
        setupArticleImageView()
        stackView.addArrangedSubview(articleImageView)
        
        contentView.addSubview(stackView)
    }
    
    private func layoutStackView() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        layoutIconImageStackViewConstraints()
        layoutLabelStackViewConstraints()
        layoutArticleImageViewConstraints()
    }
    
    private func setupIconImageStackView() {
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        emptyView.translatesAutoresizingMaskIntoConstraints = false
        iconImageStackView.translatesAutoresizingMaskIntoConstraints = false
        
        iconImageStackView.axis = .vertical
        iconImageStackView.spacing = 0
        iconImageStackView.addArrangedSubview(iconImageView)
        iconImageStackView.addArrangedSubview(emptyView)
    }
    
    private func layoutIconImageStackViewConstraints() {
        NSLayoutConstraint.activate([
            iconImageStackView.topAnchor.constraint(equalTo: stackView.topAnchor),
            iconImageStackView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            iconImageStackView.bottomAnchor.constraint(equalTo: stackView.bottomAnchor),
            iconImageStackView.trailingAnchor.constraint(equalToSystemSpacingAfter: labelStackView.leadingAnchor, multiplier: -1),
            
            iconImageView.topAnchor.constraint(equalToSystemSpacingBelow: iconImageStackView.topAnchor, multiplier: 3),
            iconImageView.leadingAnchor.constraint(equalToSystemSpacingAfter: iconImageStackView.leadingAnchor, multiplier: 1),
            
            emptyView.leadingAnchor.constraint(equalTo: iconImageStackView.leadingAnchor),
            emptyView.bottomAnchor.constraint(equalTo: iconImageStackView.bottomAnchor)
        ])

        iconImageView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
    }
    
    private func setupArticleImageView() {
        articleImageView.translatesAutoresizingMaskIntoConstraints = false
        articleImageView.layer.cornerRadius = 75
        articleImageView.layer.masksToBounds = true
        articleImageView.contentMode = .scaleAspectFill
        articleImageView.clipsToBounds = true
    }
    
    private func layoutArticleImageViewConstraints() {
        NSLayoutConstraint.activate([
            articleImageView.heightAnchor.constraint(equalToConstant: 150),
            articleImageView.widthAnchor.constraint(equalToConstant: 150),
            
            articleImageView.topAnchor.constraint(equalToSystemSpacingBelow: stackView.topAnchor, multiplier: 1),
//            articleImageView.bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: -1),
            stackView.trailingAnchor.constraint(equalToSystemSpacingAfter: articleImageView.trailingAnchor, multiplier: 1)
        ])
    }
    
    private func setupLabelStackView() {
        labelStackView.translatesAutoresizingMaskIntoConstraints = false
        labelStackView.axis = .vertical
        labelStackView.spacing = 0
        setupLabels()
    }
    
    private func layoutLabelStackViewConstraints() {
        NSLayoutConstraint.activate([
            labelStackView.topAnchor.constraint(equalTo: stackView.topAnchor),
            labelStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: iconImageView.trailingAnchor, multiplier: 1),
            articleImageView.leadingAnchor.constraint(equalToSystemSpacingAfter: labelStackView.trailingAnchor, multiplier: 1)
        ])
        
        layoutDateLabelConstraints()
        layoutTitleLabelConstraints()
        layoutSubtitleLabelContraints()
        layoutSourceLabelContraints()
    }
    
    private func setupLabels() {
        setupDateLabel()
        labelStackView.addArrangedSubview(dateLabel)
        setupTitleLabel()
        labelStackView.addArrangedSubview(titleLabel)
        setupSubtitleLabel()
        labelStackView.addArrangedSubview(subtitleLabel)
        setupSourceLabel()
        labelStackView.addArrangedSubview(sourceLabel)
    }
    
    private func setupDateLabel() {
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.font = UIFont.preferredFont(forTextStyle: .caption1)
        dateLabel.textAlignment = .left
        dateLabel.text = "X/X/XXXX XX:XX XX"
    }
    
    private func layoutDateLabelConstraints() {
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: labelStackView.topAnchor),
            dateLabel.leadingAnchor.constraint(equalTo: labelStackView.leadingAnchor)
        ])
    }
    
    private func setupTitleLabel() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        titleLabel.textAlignment = .left
        titleLabel.numberOfLines = 0
        titleLabel.adjustsFontForContentSizeCategory = true
    }
    
    private func layoutTitleLabelConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: labelStackView.leadingAnchor)
        ])
    }
    
    private func setupSubtitleLabel() {
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.font = UIFont.preferredFont(forTextStyle: .subheadline)
        subtitleLabel.numberOfLines = 2
        subtitleLabel.textAlignment = .left
    }
    
    private func layoutSubtitleLabelContraints() {
        NSLayoutConstraint.activate([
            subtitleLabel.topAnchor.constraint(equalToSystemSpacingBelow: titleLabel.bottomAnchor, multiplier: 1),
            subtitleLabel.leadingAnchor.constraint(equalTo: labelStackView.leadingAnchor),
            labelStackView.bottomAnchor.constraint(equalToSystemSpacingBelow: subtitleLabel.bottomAnchor, multiplier: 3)
        ])
    }
    
    private func setupSourceLabel() {
        sourceLabel.translatesAutoresizingMaskIntoConstraints = false
        sourceLabel.font = UIFont.preferredFont(forTextStyle: .caption2)
        sourceLabel.textAlignment = .right
    }
    
    private func layoutSourceLabelContraints() {
        NSLayoutConstraint.activate([
            sourceLabel.trailingAnchor.constraint(equalTo: labelStackView.trailingAnchor),
            sourceLabel.bottomAnchor.constraint(equalTo: labelStackView.bottomAnchor)
        ])
    }
}

extension ArticleCell {
    func configure(with article: ArticleWithImage, vm: ArticleViewModel) {
        dateLabel.text = article.date.formatted()
        titleLabel.text = article.title
        subtitleLabel.text = article.description
        sourceLabel.text = article.source.name
        articleImageView.image =  article.image
        iconImageView.image = vm.actionOnDatabaseIcon
    }
}
