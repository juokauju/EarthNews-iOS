//
//  UINavigationController+extension.swift
//  EarthNews
//
//  Created by Justina Siaulyte on 2023-02-22.
//

import UIKit

extension UINavigationController {
    func moveInViewControllerAnimated(_ viewController: UIViewController) {
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = .moveIn
        transition.subtype = .fromRight
        transition.timingFunction = CAMediaTimingFunction(name: .default)
        view.window!.layer.add(transition, forKey: kCATransition)
        pushViewController(viewController, animated: false)
    }
    
    func moveOutViewController() {
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = .push
        transition.subtype = .fromLeft
        transition.timingFunction = CAMediaTimingFunction(name: .default)
        view.window!.layer.add(transition, forKey: kCATransition)
        popViewController(animated: false)
    }
}

