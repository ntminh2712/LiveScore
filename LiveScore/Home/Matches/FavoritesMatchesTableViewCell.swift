//
//  FavoritesMatchesTableViewCell.swift
//  LiveScore
//
//  Created by MinhNT on 8/28/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import UIKit

class FavoritesMatchesTableViewCell: UITableViewCell {

    @IBOutlet weak var viewStatus: UIView!
    @IBOutlet weak var lbTime: UILabel!
    @IBOutlet weak var lbDate: UILabel!
    @IBOutlet weak var lbStatus: UILabel!
    @IBOutlet weak var viewBound: UIView!
    @IBOutlet weak var iconTeam1: UIImageView!
    @IBOutlet weak var lbTeam1: UILabel!
    @IBOutlet weak var iconTeam2: UIImageView!
    @IBOutlet weak var lbTeam2: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
        
    }
    
    func setData(data:MatchesDetailEntity) {
        lbTeam1.text = data.localteam_name
        iconTeam1.setCustomImage(data.localteam_flag, defaultAvatar: nil)
        lbStatus.text = data.status
        lbDate.text =  getDateFromTimeStamp(timeStamp: data.kick_of_date ?? 0, type: "dd/MM")
        lbTeam2.text = data.visitorteam_name
        iconTeam2.setCustomImage(data.visitorteam_flag, defaultAvatar: nil)
        if data.status == "FT" || data.status == "LIVE"{
            lbTime.text = data.scores?.ft_score
        }else {
            lbTime.text = getDateFromTimeStamp(timeStamp: data.kick_of_date ?? 0, type: "hh:mm")
        }
    }
    @IBAction func clickMatches(_ sender: Any) {
        self.clickMatches?()
    }
    
    func setupView() {
        viewBound.setViewRadius()
        viewStatus.layer.masksToBounds = false
        viewStatus.layer.cornerRadius = viewStatus.frame.height / 2
        viewStatus.layer.borderColor = #colorLiteral(red: 0.3435328603, green: 0.4938462973, blue: 0.952463448, alpha: 1)
        viewStatus.layer.borderWidth = 1.5
        viewStatus.backgroundColor = #colorLiteral(red: 0.2063092291, green: 0.2894838452, blue: 0.5495705009, alpha: 1)
    }
    
    var clickMatches:(()->())?

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
