//
//  TeamsClubTableViewCell.swift
//  LiveScore
//
//  Created by MinhNT on 9/3/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import UIKit

class TeamsClubTableViewCell: UITableViewCell {
    @IBOutlet weak var viewBound: UIView!
    @IBOutlet weak var viewBot: UIView!
    @IBOutlet weak var imgAvatar: UIImageView!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbTeam: UILabel!
    @IBOutlet weak var lbShirtNo: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        imgAvatar.makeCircleView()
    }
    func setupView(){
        viewBound.setViewRadius()
    }
    
    func setDefault(){
        viewBound.setDefaultView()
    }
    func setData(data:LineupGoalkeepersEntity){
        imgAvatar.setCustomImage(data.image_path, defaultAvatar: nil)
        lbName.text = data.common_name
        lbTeam.text = data.country_name
        lbShirtNo.text = String((data.number) ?? 0)
    }
    
    func setData(data:TopPlayerTypeEntity){
        lbName.text = data.player_name
        lbShirtNo.text = data.number
        lbTeam.text = data.country_name
        imgAvatar.setCustomImage(data.image_player, defaultAvatar: nil)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
