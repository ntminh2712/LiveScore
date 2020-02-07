//
//  RankTeamTableViewCell.swift
//  LiveScore
//
//  Created by MinhNT on 8/30/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import UIKit

class RankTeamTableViewCell: UITableViewCell {

    @IBOutlet weak var viewBound: UIView!
    
    @IBOutlet weak var lbPosition: UILabel!
    @IBOutlet weak var imgIconTeam: UIImageView!
    @IBOutlet weak var lbTeamName: UILabel!
    @IBOutlet weak var viewTitle: UIView!
    @IBOutlet weak var heightViewTitle: NSLayoutConstraint!
    @IBOutlet weak var lbPlayed: UILabel!
    @IBOutlet weak var lbGoalDifference: UILabel!
    @IBOutlet weak var lbWonDrawLost: UILabel!
    @IBOutlet weak var lbPoint: UILabel!
    @IBOutlet weak var heightLbTeam: NSLayoutConstraint!
    
    @IBOutlet weak var lbTitleTeams: UILabel!
    @IBOutlet weak var lbTitleRank: UILabel!
    @IBOutlet weak var lbTitlePlayed: UILabel!
    @IBOutlet weak var lbTitleWinDrawLost: UILabel!
    @IBOutlet weak var lbTitleGoalsDifference: UILabel!
    @IBOutlet weak var lbTitlePoint: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewBound.setViewRadius()
        checkDevice()
    }
    
    func hiddenViewTitle(){
        heightViewTitle.constant = 0
        viewTitle.isHidden = true
    }
    func showViewTitle(){
        heightViewTitle.constant = 30
        viewTitle.isHidden = false
    }
    func highlight(){
        
    }
    func checkDevice(){
        switch UIDevice().type {
        case .iPhone5,.iPhone5C, .iPhone5S:
            heightLbTeam.constant = 5
            lbTitleRank.font.withSize(8)
            lbTitlePlayed.font.withSize(8)
            lbTitleTeams.font.withSize(8)
            lbTitleWinDrawLost.font.withSize(8)
            lbTitleGoalsDifference.font.withSize(8)
            lbTitlePoint.font.withSize(8)
            
            break
            
        default:
            break
        }
    }
    
    func setData(data:StandingPositionEntity){
        lbPosition.text = String(data.position!)
        lbTeamName.text = data.team_name
        imgIconTeam.setCustomImage(data.team_flag, defaultAvatar: nil)
//        lbPlayed.text = String((data.overall?.games_played)!)
//        lbWonDrawLost.text = "\((data.overall?.won)!):\((data.overall?.draw)!):\((data.overall?.lost)!)"
//        lbPoint.text = String((data.total?.points)!)
//        if data.team_id
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
