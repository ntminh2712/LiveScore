//
//  LeaguesTeamTableViewCell.swift
//  LiveScore
//
//  Created by MinhNT on 8/29/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import UIKit

class LeaguesTeamTableViewCell: UITableViewCell {

    @IBOutlet weak var imgTeam: UIImageView!
    @IBOutlet weak var lbPosition: UILabel!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var viewBound: UIView!
    @IBOutlet weak var iconFavorites: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    func setupView() {
        viewBound.setViewRadius()
    }
    func setData(data:LeaguesTeamDetailEntity){
        imgTeam.setCustomImage(data.logo_path, defaultAvatar: nil)
        lbName.text = data.name
        if data.favorite ?? false {
            iconFavorites.image = #imageLiteral(resourceName: "icon_start_active")
        }else{
            iconFavorites.image = #imageLiteral(resourceName: "icon_favorites_inactive")
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func clickTeam(_ sender: Any) {
        self.clickTeam?()
    }
    @IBAction func handlerFavorites(_ sender: Any) {
        self.handlerFavorites?()
    }
    var handlerFavorites:(()->())?
    var clickTeam:(()->())?
}
