//
//  ViewController.swift
//  StretchySnacks
//
//  Created by Jimmy Hoang on 2017-07-06.
//  Copyright © 2017 Jimmy Hoang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Properties
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var headerViewHeightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addButton.setTitle("➕", for: .normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: Button Actions
    
    @IBAction func addButtonPressed(_ sender: UIButton) {
        if headerViewHeightConstraint.constant == 64 {
            headerViewHeightConstraint.constant = 200
            
            UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: [], animations: {
                self.view.layoutIfNeeded()
                self.addButton.transform = self.addButton.transform.rotated(by: CGFloat.pi/2)
            }, completion: nil)

            
        } else {
            headerViewHeightConstraint.constant = 64
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: [], animations: {
                self.view.layoutIfNeeded()
                self.addButton.transform = self.addButton.transform.rotated(by: -CGFloat.pi/2)
            }, completion: nil)
        }

    }
}

