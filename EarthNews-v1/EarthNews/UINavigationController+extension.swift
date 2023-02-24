//
//  UINavigationController+extension.swift
//  EarthNews
//
//  Created by Justina Siaulyte on 2023-02-22.
//

import UIKit

extension UIViewController {
    func setChevronBackNavigationButton() {
        let barButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .done, target: self, action: #selector(barButtonItemTapped))
            navigationController?.navigationBar.tintColor = .systemGreen
        navigationItem.setLeftBarButton(barButtonItem, animated: false)
    }
    
    @objc private func barButtonItemTapped() {
        navigationController?.moveOutViewController()
    }
}

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

