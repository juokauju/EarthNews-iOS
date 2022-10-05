//
//  CustomTableViewCell.swift
//  EarthNews
//
//  Created by jimi bird on 2022-09-30.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    static let identifier = "CustomTableViewCell"
    
    static var nib: UINib {
        UINib(nibName: "CustomTableViewCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBOutlet var date: UILabel!
    @IBOutlet var title: UILabel!
    @IBOutlet var subtitle: UILabel!
    @IBOutlet var source: UILabel!
    
    @IBOutlet var cellImage: UIImageView!
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension CustomTableViewCell {
    func configure(with article: Article) {
        title.text = article.title
        subtitle.text = article.description
        date.text = article.date.formatted()
        source.text = article.source.name
        
        cellImage.image = article.articleImage
    }
}
