//
//  EndEventsTableViewCell.swift
//  LiveScore
//
//  Created by MinhNT on 10/31/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import UIKit

class EndEventsTableViewCell: UITableViewCell {

    @IBOutlet weak var lbStatus: UILabel!
    @IBOutlet weak var lbScores: UILabel!
    @IBOutlet weak var viewBound: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setData(data:MatchesEventsEntity){
        lbStatus.text = data.type
        lbScores.text = data.result
    }
    
    func setViewRadiusBottom(){
        viewBound.frame = CGRect(x: 15, y: 0, width: self.contentView.frame.width - 30, height: 50)
        viewBound.roundCorners(corners: [.bottomRight,.bottomLeft], radius: 10)
        self.viewBound.layer.masksToBounds = true
    }
    func setViewRadiusTop(){
        viewBound.frame = CGRect(x: 15, y: 0, width: self.contentView.frame.width - 30, height: 50)
        viewBound.roundCorners(corners: [.topRight,.topLeft], radius: 10)
        self.viewBound.translatesAutoresizingMaskIntoConstraints = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
