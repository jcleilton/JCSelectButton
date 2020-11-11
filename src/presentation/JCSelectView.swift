//
//  JCSelectView.swift
//  JCSelectButton
//
//  Created by Cleilton Feitosa on 11/11/20.
//

import UIKit

public class JCSelectView: UIView, UITableViewDelegate, UITableViewDataSource  {
    private var options = [String]() {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    var tableView = UITableView()
    
    weak var delegate: JCSelectViewProtocol?
    
    public init(options: [String]) {
        super.init(frame: CGRect.zero)
        self.options = options
        self.backgroundColor = UIColor.darkGray
        
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.backgroundColor = UIColor.darkGray
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(tableView)
        
        self.tableView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        self.tableView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        self.tableView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        
        tableView.reloadData()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = options[indexPath.row]
        cell.backgroundColor = UIColor.darkGray
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.dropDownPressed(string: options[indexPath.row])
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
    
    public func setOptions(with values: [String]) {
        self.options = values
    }
}

