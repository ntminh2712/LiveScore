//
//  MatchTableViewCell.swift
//  LiveScore
//
//  Created by MinhNT on 8/27/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import UIKit

class MatchTableViewCell: UITableViewCell {

    @IBOutlet weak var viewBound: UIView!
    @IBOutlet weak var lbStatus: UILabel!
    @IBOutlet weak var lbTeam1: UILabel!
    @IBOutlet weak var lbTeam2: UILabel!
    @IBOutlet weak var lbScoresTeam1: UILabel!
    @IBOutlet weak var lbScoresTeam2: UILabel!
    @IBOutlet weak var imgFavorites: UIImageView!
    @IBOutlet weak var viewSpecial: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        print("clgt")

    }
    func hideViewSpectial(){
        viewSpecial.isHidden = true
    }
    
    func setData(data: MatchesDetailEntity) {
        
        lbTeam1.text = data.localteam_name
        lbTeam2.text = data.visitorteam_name
        
        if data.favorites ?? false {
            imgFavorites.image = #imageLiteral(resourceName: "icon_start_active.png")
        }else {
            imgFavorites.image = #imageLiteral(resourceName: "icon_favorites_inactive")
        }
        if data.status == "NS"{
            lbStatus.text = getDateFromTimeStamp(timeStamp: data.kick_of_date ?? 0, type: "hh:mm")
            lbScoresTeam1.text = ""
            lbScoresTeam2.text = ""
        }else {
            lbStatus.text = data.status
            lbScoresTeam1.text = String(data.localteam_score!)
            lbScoresTeam2.text = String(data.visitorteam_score!)
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    @IBAction func handlerFavorites(_ sender: Any) {
        self.handlerFavorites?()
    }
    @IBAction func clickDetail(_ sender: Any) {
        self.clickDetail?()
    }
    var clickDetail:(()->())?
    var handlerFavorites:(()->())?
}
