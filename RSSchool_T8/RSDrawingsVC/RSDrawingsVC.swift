//
//  RSDrawingsVC.swift
//  RSSchool_T8
//
//  Created by Anna Ershova on 16.07.2021.
//

import UIKit

@objcMembers class RSDrawingsVC: UIViewController {

    @objc weak var delegate: RSDrawOnCanvasDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setActionsOnButtons()
    }
    
    func setActionsOnButtons() {
        var i = 20;
        for button in self.view.subviews
        {
            if (button is UIButton)
            {
                let tmp: UIButton = button as! UIButton
                tmp.tag = i;
                i += 1;
                tmp.addTarget(self, action: #selector(tapOnButton), for: .touchUpInside)
            }
        }
    }
    
    @objc func tapOnButton(_ sender: UIButton) {
        delegate?.getResultShape(theValue: sender.currentTitle!)
        for button in self.view.subviews
        {
            if (button is UIButton)
            {
                let tmp: UIButton = button as! UIButton
                if (tmp.tag != sender.tag)
                {
                    tmp.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
                    tmp.layer.shadowRadius = 1;
                }
            }
        }
    }
}
