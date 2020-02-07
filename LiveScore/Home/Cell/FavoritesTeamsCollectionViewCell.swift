//
//  FavoritesTeamsCollectionViewCell.swift
//  LiveScore
//
//  Created by MinhNT on 8/28/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import UIKit

class FavoritesTeamsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var imgTeam: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func clickTeam(_ sender: Any) {
        self.clickTeam?()
    }
    func setData(data:FavoritesTeamEntity){
        imgTeam.setCustomImage(data.logo_path, defaultAvatar: nil)
        lbName.text = data.name
    }
    var clickTeam:(()->())?
    
}
