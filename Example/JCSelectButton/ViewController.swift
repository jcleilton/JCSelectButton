//
//  ViewController.swift
//  JCSelectButton
//
//  Created by jcleilton@gmail.com on 11/11/2020.
//  Copyright (c) 2020 jcleilton@gmail.com. All rights reserved.
//

import UIKit
import JCSelectButton

class ViewController: UIViewController {
    
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var button: JCSelectButton = { [weak self] in
        let button = JCSelectButton(options: ["Um", "Dois", "Três", "Quatro"], onClick: {
            print("Didtouch button")
        }) { title in
            self?.label.text = title
        }
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(button)
        button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        self.view.addSubview(label)
        label.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

