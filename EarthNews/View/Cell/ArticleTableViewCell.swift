//
//  ArticleTableViewCell.swift
//  EarthNews
//
//  Created by Justina Siaulyte on 2022-09-30.
//

import UIKit

protocol ArticleTableViewCellDelegate: AnyObject {
    func didTapIcon(with article: ArticleWithImage)
}

class ArticleTableViewCell: UITableViewCell {
    weak var delegate: ArticleTableViewCellDelegate?
    
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
    @IBOutlet var databaseActionButton: UIButton!
    
    private var article: ArticleWithImage?
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    

    @IBAction func didTapIcon(_ sender: UIButton) {
        if let article = article {
            delegate?.didTapIcon(with: article)
        }
        print("did tap button in cell")
    }
   

    func configure(with article: ArticleWithImage, databaseIcon: UIImage) {
        self.article = article
        
        title.text = article.title
        subtitle.text = article.description
        date.text = article.date.formatted()
        source.text = article.source.name
        
        cellImageView.image = article.image
        databaseActionButton.setImage(databaseIcon, for: .normal)
        databaseActionButton.tintColor = .systemTeal
    }
    
}
