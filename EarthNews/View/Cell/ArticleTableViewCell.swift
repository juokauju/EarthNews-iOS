//
//  ArticleTableViewCell.swift
//  EarthNews
//
//  Created by Justina Siaulyte on 2022-09-30.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {
    static let identifier = "ArticleTableViewCell"
    
    static var nib: UINib {
        UINib(nibName: "ArticleTableViewCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBOutlet var date: UILabel!
    @IBOutlet var title: UILabel!
    @IBOutlet var subtitle: UILabel!
    @IBOutlet var source: UILabel!

    @IBOutlet var cellImageView: UIImageView!
    @IBOutlet weak var databseIconImage: UIImageView!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension ArticleTableViewCell {
    func configure(with article: ArticleWithImage, databaseIcon: UIImage) {
        title.text = article.title
        subtitle.text = article.description
        date.text = article.date.formatted()
        source.text = article.source.name
        
        cellImageView.image = article.image
        databseIconImage.image = databaseIcon
    }
}
