//
//  String+Extension.swift
//  EarthNews
//
//  Created by Justina Siaulyte on 2023-02-20.
//

import UIKit

extension String {
    func makeAttributedString() -> NSMutableAttributedString {
        guard let attributedString = try? NSMutableAttributedString(
            data: Data(self.utf8),
            options: [.documentType: NSAttributedString.DocumentType.html,
                      .characterEncoding: String.Encoding.utf8.rawValue],
            documentAttributes: nil
        ) else {
            return .init(string: "Invalid content")
        }
        
        let range = NSRange(location: 0, length: attributedString.length)
        
        attributedString.enumerateAttribute(NSAttributedString.Key.font, in: range) { value, range, pointer in
            
            let replacementFont = UIFont.preferredFont(forTextStyle: .body)
            let textColor = UIColor.secondaryLabel
            
            let replacementAttribute = [NSAttributedString.Key.font: replacementFont, .foregroundColor: textColor]
            attributedString.addAttributes(replacementAttribute, range: range)
            }
            
            return attributedString
        }
}
