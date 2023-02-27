//
//  UIImageValueTransformer.swift
//  EarthNews
//
//  Created by Justina Siaulyte on 2023-02-27.
//

import UIKit

@objc(UIImageValueTransformer)
final public class UIImageValueTransformer: ValueTransformer {
    override public class func transformedValueClass() -> AnyClass {
        return UIImage.self
    }
    
    override public class func allowsReverseTransformation() -> Bool {
        return true
    }
    
    override public func transformedValue(_ value: Any?) -> Any? {
        guard let image = value as? UIImage else { return nil }
        
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: image, requiringSecureCoding: true)
            return data
        } catch {
            assertionFailure("Failed to transform `UIImage` to `Data`")
            return nil
        }
    }
    
    override public func reverseTransformedValue(_ value: Any?) -> Any? {
        guard let data = value as? NSData else { return nil }
        
        do {
            let image = try NSKeyedUnarchiver.unarchivedObject(ofClass: UIImage.self, from: data as Data)
            return image
        } catch {
            assertionFailure("Failed to transform `Data` to `UIImage`")
            return nil
        }
    }
}

extension UIImageValueTransformer {

    static let name = NSValueTransformerName(rawValue: String(describing: UIImageValueTransformer.self))

    public static func register() {
        let transformer = UIImageValueTransformer()
        ValueTransformer.setValueTransformer(transformer, forName: name)
    }
}
