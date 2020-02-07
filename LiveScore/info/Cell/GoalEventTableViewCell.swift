//
//  GoalEventTableViewCell.swift
//  LiveScore
//
//  Created by MinhNT on 10/30/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import UIKit

class GoalEventTableViewCell: UITableViewCell {

    @IBOutlet weak var lbEventLocalTeam: UILabel!
    @IBOutlet weak var lbEventVisitTeam: UILabel!
    @IBOutlet weak var imgEventLocal: UIImageView!
    @IBOutlet weak var lbTime: UILabel!
    @IBOutlet weak var imgEventVisitTeam: UIImageView!
    @IBOutlet weak var viewBound: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setViewRadiusBottom(){
        viewBound.frame = CGRect(x: 15, y: 0, width: self.contentView.frame.width - 30, height: 60)
        viewBound.roundCorners(corners: [.bottomRight,.bottomLeft], radius: 10)
        self.viewBound.layer.masksToBounds = true
    }
    func setViewRadiusTop(){
        viewBound.frame = CGRect(x: 15, y: 0, width: self.contentView.frame.width - 30, height: 60)
        viewBound.roundCorners(corners: [.topRight,.topLeft], radius: 10)
        self.viewBound.layer.masksToBounds = true
    }
    
    func setData(data:MatchesEventsEntity){
        lbTime.text = String((data.minute)!)
        switch data.type {
            
        case "goal":
            if data.is_localteam! {
                imgEventLocal.image = #imageLiteral(resourceName: "icon_scores_inactive")
                lbEventLocalTeam.text = data.player_name
                imgEventVisitTeam.isHidden = true
                lbEventVisitTeam.isHidden = true
                imgEventLocal.isHidden = false
                lbEventLocalTeam.isHidden = false
            }else {
                imgEventVisitTeam.image = #imageLiteral(resourceName: "icon_scores_inactive")
                lbEventVisitTeam.text = data.player_name
                imgEventLocal.isHidden = true
                lbEventLocalTeam.isHidden = true
                imgEventVisitTeam.isHidden = false
                lbEventVisitTeam.isHidden = false
            }
            break
        case "substitution":
            if data.is_localteam! {
                imgEventLocal.image = #imageLiteral(resourceName: "icon_substitution")
                lbEventLocalTeam.text = data.player_name
                imgEventVisitTeam.isHidden = true
                lbEventVisitTeam.isHidden = true
                imgEventLocal.isHidden = false
                lbEventLocalTeam.isHidden = false
            }else {
                imgEventVisitTeam.image = #imageLiteral(resourceName: "icon_substitution")
                lbEventVisitTeam.text = data.player_name
                imgEventLocal.isHidden = true
                lbEventLocalTeam.isHidden = true
                imgEventVisitTeam.isHidden = false
                lbEventVisitTeam.isHidden = false
            }
            break
        case "yellowcard":
            if data.is_localteam! {
                imgEventLocal.image = #imageLiteral(resourceName: "icon_yellow_card")
                lbEventLocalTeam.text = data.player_name
                imgEventVisitTeam.isHidden = true
                lbEventVisitTeam.isHidden = true
                imgEventLocal.isHidden = false
                lbEventLocalTeam.isHidden = false
            }else {
                imgEventVisitTeam.image = #imageLiteral(resourceName: "icon_yellow_card")
                lbEventVisitTeam.text = data.player_name
                imgEventLocal.isHidden = true
                lbEventLocalTeam.isHidden = true
                imgEventVisitTeam.isHidden = false
                lbEventVisitTeam.isHidden = false
            }
            break
        case "redcard" , "yellowred":
            if data.is_localteam! {
                imgEventLocal.image = #imageLiteral(resourceName: "icon_red_card")
                lbEventLocalTeam.text = data.player_name
                imgEventVisitTeam.isHidden = true
                lbEventVisitTeam.isHidden = true
                imgEventLocal.isHidden = false
                lbEventLocalTeam.isHidden = false
            }else {
                imgEventVisitTeam.image = #imageLiteral(resourceName: "icon_red_card")
                lbEventVisitTeam.text = data.player_name
                imgEventLocal.isHidden = true
                lbEventLocalTeam.isHidden = true
                imgEventVisitTeam.isHidden = false
                lbEventVisitTeam.isHidden = false
            }
            break
        case "missed_penalty":
            if data.is_localteam! {
                imgEventLocal.image = #imageLiteral(resourceName: "icon_pen_miss")
                lbEventLocalTeam.text = data.player_name
                imgEventVisitTeam.isHidden = true
                lbEventVisitTeam.isHidden = true
                imgEventLocal.isHidden = false
                lbEventLocalTeam.isHidden = false
            }else {
                imgEventVisitTeam.image = #imageLiteral(resourceName: "icon_pen_miss")
                lbEventVisitTeam.text = data.player_name
                imgEventLocal.isHidden = true
                lbEventLocalTeam.isHidden = true
                imgEventVisitTeam.isHidden = false
                lbEventVisitTeam.isHidden = false
            }
            break
        case "penalty":
            if data.is_localteam! {
                imgEventLocal.image = #imageLiteral(resourceName: "Icon_pen_goal")
                lbEventLocalTeam.text = data.player_name
                imgEventVisitTeam.isHidden = true
                lbEventVisitTeam.isHidden = true
                imgEventLocal.isHidden = false
                lbEventLocalTeam.isHidden = false
            }else {
                imgEventVisitTeam.image = #imageLiteral(resourceName: "Icon_pen_goal")
                lbEventVisitTeam.text = data.player_name
                imgEventLocal.isHidden = true
                lbEventLocalTeam.isHidden = true
                imgEventVisitTeam.isHidden = false
                lbEventVisitTeam.isHidden = false
            }
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
