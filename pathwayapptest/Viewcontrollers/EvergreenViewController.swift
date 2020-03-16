//
//  EvergreenViewController.swift
//  pathwayapptest
//
//  Created by Orlando Mairena on 3/11/20.
//  Copyright © 2020 Orlando Mairena. All rights reserved.
//

import UIKit

class EvergreenViewController: UITabBarController {

    let transition = SlideInTransition()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    
    @IBAction func didTapMenu(_ sender: UIBarButtonItem) {
        guard let menuTableViewController = storyboard?.instantiateViewController(withIdentifier: "MenuTableViewController") as? MenuTableViewController else {return}
        menuTableViewController.didTapMenuType = { menuType in
            self.transitionToNew(menuType)
        }
        menuTableViewController.modalPresentationStyle = .overCurrentContext
        menuTableViewController.transitioningDelegate = self
        present(menuTableViewController, animated: true)
        // Orlando: This code up here allows us to present the "MenuTableViewController" without the using story board elements, such as; connecting it with lines
    }
    var topView: UIView?
    func transitionToNew (_ menuType: MenuType) {
        topView?.removeFromSuperview()
        
        switch menuType {
        case .feed:
            guard let feedVC = self.storyboard?.instantiateViewController(withIdentifier: "Feed") else {return}
            view.frame = self.view.bounds
            view.addSubview(feedVC.view)
            self.topView = feedVC.view
            addChild(feedVC)
        case .resources:
            guard let resourcesVC = self.storyboard?.instantiateViewController(withIdentifier: "Resources") else {return}
            view.frame = self.view.bounds
            view.addSubview(resourcesVC.view)
            self.topView = resourcesVC.view
            addChild(resourcesVC)
        case .studentlife:
            guard let studentlifeVC = self.storyboard?.instantiateViewController(withIdentifier: "StudentLife") else {return}
            view.frame = self.view.bounds
            view.addSubview(studentlifeVC.view)
            self.topView = studentlifeVC.view
            addChild(studentlifeVC)
        case .messages:
            guard let messagesVC = self.storyboard?.instantiateViewController(withIdentifier: "Messages") else {return}
            view.frame = self.view.bounds
            view.addSubview(messagesVC.view)
            self.topView = messagesVC.view
            addChild(messagesVC)
        case .account:
            guard let accountVC = self.storyboard?.instantiateViewController(withIdentifier: "NoAccount") else {return}
        view.frame = self.view.bounds
        view.addSubview(accountVC.view)
        self.topView = accountVC.view
        addChild(accountVC)
    
        }
    }
    //Orlando: Function to transition to a new storyboard from menu above ^
    

    
}

extension EvergreenViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition .isPresenting = true
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition .isPresenting = false
        return transition
    }
}
