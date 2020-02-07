//
//  BookViewCell.swift
//  SampleTableViewInside
//
//  Created by Katana on 8/31/19.
//  Copyright © 2019 Katana. All rights reserved.
//

import UIKit

class BookViewCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!

    var name: String? = nil {
        didSet {
            lblName.text = self.name
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        print("clgt")
        // Initialization code
    }
}
