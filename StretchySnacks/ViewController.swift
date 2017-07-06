//
//  ViewController.swift
//  StretchySnacks
//
//  Created by Jimmy Hoang on 2017-07-06.
//  Copyright © 2017 Jimmy Hoang. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    // MARK: Properties
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var headerViewHeightConstraint: NSLayoutConstraint!
    var stackView:UIStackView!
    var snacksList:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stackView = makeStackView()
        
        headerView.addSubview(stackView)
        
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
            stackView.isHidden = false
            
            for constraint in headerView.constraints {
                if constraint.identifier == "centerYSnackTitle" {
                    constraint.constant -= 40
                }
            }
 
            UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: [], animations: {
                self.view.layoutIfNeeded()
                self.addButton.transform = self.addButton.transform.rotated(by: CGFloat.pi/2/2)
            }, completion: nil)
        } else {
            headerViewHeightConstraint.constant = 64
            stackView.isHidden = true
            
            for constraint in headerView.constraints {
                if constraint.identifier == "centerYSnackTitle" {
                    constraint.constant += 40
                }
            }
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: [], animations: {
                self.view.layoutIfNeeded()
                self.addButton.transform = self.addButton.transform.rotated(by: -CGFloat.pi/2/2)
            }, completion: nil)
        }

    }
    
    func stackViewButtonPressed(sender: UIButton) {
        let indexPath = IndexPath(row: snacksList.count, section: 0)
        snacksList.append(sender.currentTitle!)
        
        tableView.insertRows(at: [indexPath], with: .automatic)
    }
    
    // MARK: Helpers
    func makeStackView() -> UIStackView {
        let button1 = UIButton()
        let button2 = UIButton()
        let button3 = UIButton()
        let button4 = UIButton()
        let button5 = UIButton()

        button1.addTarget(self, action: #selector(stackViewButtonPressed(sender:)), for: .touchUpInside)
        button2.addTarget(self, action: #selector(stackViewButtonPressed(sender:)), for: .touchUpInside)
        button3.addTarget(self, action: #selector(stackViewButtonPressed(sender:)), for: .touchUpInside)
        button4.addTarget(self, action: #selector(stackViewButtonPressed(sender:)), for: .touchUpInside)
        button5.addTarget(self, action: #selector(stackViewButtonPressed(sender:)), for: .touchUpInside)

        
        button1.setTitle("Oreos", for: .normal)
        button2.setTitle("Pizza Pockets", for: .normal)
        button3.setTitle("Pop Tarts", for: .normal)
        button4.setTitle("Popsicle", for: .normal)
        button5.setTitle("Ramen", for: .normal)

        button1.setImage(#imageLiteral(resourceName: "oreos"), for: .normal)
        button2.setImage(#imageLiteral(resourceName: "pizza_pockets"), for: .normal)
        button3.setImage(#imageLiteral(resourceName: "pop_tarts"), for: .normal)
        button4.setImage(#imageLiteral(resourceName: "popsicle"), for: .normal)
        button5.setImage(#imageLiteral(resourceName: "ramen"), for: .normal)

        let stackView  = UIStackView(arrangedSubviews: [button1,button2,button3,button4,button5])
        headerView.addSubview(stackView)
        
        stackView.isHidden                                                           = true
        stackView.distribution                                                       = .fillEqually
        stackView.axis                                                               = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints                          = false
        stackView.bottomAnchor.constraint(equalTo: headerView.bottomAnchor).isActive = true
        stackView.leftAnchor.constraint(equalTo: headerView.leftAnchor).isActive     = true
        stackView.rightAnchor.constraint(equalTo: headerView.rightAnchor).isActive   = true
        stackView.heightAnchor.constraint(equalToConstant: 100.0).isActive            = true
    
        return stackView
    }
    

    // MARK: UITableView
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return snacksList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = snacksList[indexPath.row]
        
        return UITableViewCell()
    }
}

