//
//  LeaguesTableViewCell.swift
//  LiveScore
//
//  Created by MinhNT on 8/28/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import UIKit

class LeaguesTableViewCell: UITableViewCell {

    
    @IBOutlet weak var viewSpecial: UIView!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var imgIcon: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    func setData(data:ExploreLeaguesEntity){
        lbName.text = data.name
        imgIcon.setCustomImage(data.logo_path, defaultAvatar: "")
    }
    func setData(data:ExploreNationEntity){
        lbName.text  = data.name
        imgIcon.setCustomImage(data.flag, defaultAvatar: "")
    }
    
    @IBAction func clickLeagues(_ sender: Any) {
        self.clickLeagues?()
    }
    
    
    var clickLeagues:(()->())?
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
