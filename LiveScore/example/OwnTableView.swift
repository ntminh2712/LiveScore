//
//  OwnTableView.swift
//  SampleTableViewInside
//
//  Created by Katana on 8/31/19.
//  Copyright © 2019 Katana. All rights reserved.
//

import UIKit

class OwnTableView: UITableView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    override var intrinsicContentSize: CGSize {
        self.layoutIfNeeded()
        return self.contentSize
    }

    override var contentSize: CGSize {
        didSet {
            self.invalidateIntrinsicContentSize()
        }
    }

}
