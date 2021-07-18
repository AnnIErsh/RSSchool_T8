//
//  RSTimerVC.swift
//  RSSchool_T8
//
//  Created by Anna Ershova on 18.07.2021.
//

import UIKit

class RSTimerVC: UIViewController {

    @IBOutlet weak var rightTime: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBAction func sliderTime(_ sender: Any) {
    }
    @IBAction func saveTime(_ sender: Any) {
    }
    @IBOutlet weak var leftTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeViewUI()
    }
    
    func makeViewUI() {
        let shadowPath0 = UIBezierPath(roundedRect: CGRect(origin: .zero, size: CGSize(width: self.view.frame.size.width, height: self.view.frame.size.height)), cornerRadius: 45)
        self.view.layer.shadowPath = shadowPath0.cgPath
        self.view.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        self.view.layer.shadowOffset = .zero
        self.view.layer.shadowOpacity = 1;
        self.view.layer.shadowRadius = 4;
        self.view.layer.cornerRadius = 45;
        self.view.layer.masksToBounds = false
        time.text = "2.40 s"
        leftTime.text = "1"
        rightTime.text = "5"
        for label in self.view.subviews
        {
            if (label is UILabel)
            {
                let tmp: UILabel = label as! UILabel
                tmp.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
                tmp.font = UIFont(name: "Montserrat-Regular", size: 18)
            }
        }
    }
}
