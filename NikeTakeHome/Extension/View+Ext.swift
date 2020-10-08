//
//  View+Ext.swift
//  NikeTakeHome
//
//  Created by Nick Nguyen on 10/8/20.
//

import UIKit

extension UIView {
    func addSubViews(_ views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
}
