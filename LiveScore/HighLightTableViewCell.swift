//
//  HighLightTopTableViewCell.swift
//  LiveScore
//
//  Created by MinhNT on 9/4/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import UIKit

class HighLightTableViewCell: UITableViewCell {

    @IBOutlet weak var viewBound: UIView!
    @IBOutlet weak var imgHighLight: UIImageView!
    @IBOutlet weak var lbEvent: UILabel!
    @IBOutlet weak var lbTeam: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    func setupView() {
        viewBound.setViewRadius()
        imgHighLight.setViewRadius()
    }
    
    func setData(data:HighLightEntity){
//        imgHighLight.setCustomImage(data.location, defaultAvatar: nil)
        lbEvent.text = data.event_id ?? ""
        lbTeam.text = data.type
    }
    @IBAction func clickHighlight(_ sender: Any) {
        self.clickHighlight?()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    var clickHighlight:(()->())?
    
}
