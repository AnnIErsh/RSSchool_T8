//
//  RSTimerDelegate.swift
//  RSSchool_T8
//
//  Created by Anna Ershova on 18.07.2021.
//

import UIKit

@objc protocol RSTimerDelegate: NSObjectProtocol {
    @objc func getResultTime(theValue: Float)
}
