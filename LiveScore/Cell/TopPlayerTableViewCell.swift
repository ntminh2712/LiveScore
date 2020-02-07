
//
//  TopPlayerTableViewCell.swift
//  LiveScore
//
//  Created by MinhNT on 9/3/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import UIKit

class TopPlayerTableViewCell: UITableViewCell {

    @IBOutlet weak var viewBound: UIView!
    @IBOutlet weak var viewBot: UIView!
    @IBOutlet weak var imgTeam: UIImageView!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbCount: UILabel!
    @IBOutlet weak var lbTeamName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    func setupView(){
        imgTeam.makeCircleView()
    }
    

    func setData(data: TopPlayerTypeEntity, type:String,category: CategoryEnum){
        imgTeam.setCustomImage(data.image_player, defaultAvatar: nil)
        lbName.text = data.fullname
        lbCount.text = String(data.goals ?? 0)
        if category == CategoryEnum.Leagues {
            lbTeamName.text = data.team_name
        }else {
            lbTeamName.text = data.country_name
        }
        switch type {
        case TopPlayerType.goals.rawValue:
            lbCount.text = String(data.goals ?? 0)
            break
        case TopPlayerType.assists.rawValue:
            lbCount.text = String(data.assists ?? 0)
            break
        case TopPlayerType.yellowCards.rawValue:
            lbCount.text = String(data.yellowCards ?? 0)
            break
        case TopPlayerType.redCards.rawValue:
            lbCount.text = String(data.readCards ?? 0)
            break
        default:
            break
        }
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
