//
//  JCSelectButton.swift
//  JCSelectButton
//
//  Created by Cleilton Feitosa on 11/11/20.
//

import UIKit

public class JCSelectButton: UIButton {
    private let dropView: JCSelectView
    
    var height = NSLayoutConstraint()
    
    var isOpen = false
    
    var onClick: (() -> Void) = { }
    
    var onSelectOption: ((String) -> Void) = { _ in }
    
    
    public init(
        options: [String],
        onClick: @escaping (() -> Void) = { },
        onSelectOption: @escaping ((String) -> Void) = { _ in }) {
        self.dropView = JCSelectView(options: options)
        super.init(frame: CGRect.zero)
        self.backgroundColor = UIColor.darkGray
        dropView.delegate = self
        dropView.translatesAutoresizingMaskIntoConstraints = false
        dropView.setOptions(with: options)
        self.onClick = onClick
        self.onSelectOption = onSelectOption
    }
    
    override public func didMoveToSuperview() {
        self.superview?.addSubview(dropView)
        dropView.topAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        dropView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        dropView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        height = dropView.heightAnchor.constraint(equalToConstant: 0)
    }
    
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if isOpen == false {
            
            isOpen = true
            
            NSLayoutConstraint.deactivate([self.height])
            
            if self.dropView.tableView.contentSize.height > 150 {
                self.height.constant = 150
            } else {
                self.height.constant = self.dropView.tableView.contentSize.height
            }
            
            
            NSLayoutConstraint.activate([self.height])
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
                self.dropView.layoutIfNeeded()
                self.dropView.center.y += self.dropView.frame.height / 2
            }, completion: nil)
            
        } else {
            isOpen = false
            
            NSLayoutConstraint.deactivate([self.height])
            self.height.constant = 0
            NSLayoutConstraint.activate([self.height])
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
                self.dropView.center.y -= self.dropView.frame.height / 2
                self.dropView.layoutIfNeeded()
            }, completion: nil)
            
        }
        self.onClick()
    }
    
    func dismissDropDown() {
        isOpen = false
        NSLayoutConstraint.deactivate([self.height])
        self.height.constant = 0
        NSLayoutConstraint.activate([self.height])
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
            self.dropView.center.y -= self.dropView.frame.height / 2
            self.dropView.layoutIfNeeded()
        }, completion: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension JCSelectButton: JCSelectViewProtocol {
    public func dropDownPressed(string: String) {
        self.setTitle(string, for: .normal)
        self.onSelectOption(string)
        self.dismissDropDown()
    }
}
