//
//  RSDrawOnCanvasDelegate.swift
//  RSSchool_T8
//
//  Created by Anna Ershova on 18.07.2021.
//

import UIKit

@objc protocol RSDrawOnCanvasDelegate: NSObjectProtocol {
    @objc func getResultShape(theValue: String)
}

