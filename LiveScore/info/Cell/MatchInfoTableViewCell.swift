//
//  MatchInfoTableViewCell.swift
//  LiveScore
//
//  Created by MinhNT on 9/4/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import UIKit

class MatchInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var viewBound: UIView!
    @IBOutlet weak var lbReferee: UILabel!
    @IBOutlet weak var lbStadium: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        viewBound.setViewRadius()
    }
    func setData(data:MatchesRefereeEntity) {
        lbReferee.text = data.common_name
//        lbStadium.text = data.s
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
