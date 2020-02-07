
//
//  LeaguesTableViewCell.swift
//  LiveScore
//
//  Created by MinhNT on 8/28/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import UIKit

class FavoritesLeaguesTableViewCell: UITableViewCell {

    @IBOutlet weak var viewBound: UIView!
    @IBOutlet weak var imgLeagues: UIImageView!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbCountry: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    func setupView(){
        viewBound.setViewRadius()
    }
    
    func setData(data:ExploreLeaguesEntity) {
        imgLeagues.setCustomImage(data.logo_path, defaultAvatar: nil)
        lbCountry.text = data.country
        lbName.text  = data.name
    }
    
    @IBAction func clickLeagues(_ sender: Any) {
        self.clickLeagues?()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    var clickLeagues:(()->())?
    
}
