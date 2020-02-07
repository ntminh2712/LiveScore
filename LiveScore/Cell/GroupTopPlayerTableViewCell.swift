//
//  GroupTopPlayerTableViewCell.swift
//  LiveScore
//
//  Created by MinhNT on 10/28/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import UIKit

class GroupTopPlayerTableViewCell: UITableViewCell {

    @IBOutlet weak var tbDetailTopPlayer: UITableView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbType: UILabel!
    var listItem:[TopPlayerTypeEntity] = [] {
        didSet {
            tbDetailTopPlayer.reloadData()
        }
    }
    var type: String? {
        didSet{
            setupView()
        }
    }
    var category:CategoryEnum?
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupTableview()
    }
    func setupView(){
        switch type {
        case TopPlayerType.goals.rawValue:
            lbTitle.text = "Top Scorers"
            lbType.text = "Goals"
            break
        case TopPlayerType.assists.rawValue:
            lbTitle.text = "Top Assists"
            lbType.text = "Assists"
            break
        case TopPlayerType.yellowCards.rawValue:
            lbTitle.text = "Yellow Cards"
            lbType.text = "Cards"
            break
        case TopPlayerType.redCards.rawValue:
            lbTitle.text = "Red Cards"
            lbType.text = "Cards"
            break
        default:
            break
        }
    }
    func setupTableview(){
        tbDetailTopPlayer.delegate = self
        tbDetailTopPlayer.dataSource = self
        tbDetailTopPlayer.layer.masksToBounds = true
        tbDetailTopPlayer.layer.cornerRadius = 15
        tbDetailTopPlayer.register(UINib(nibName: "TopPlayerTableViewCell", bundle: nil), forCellReuseIdentifier: "topPlayerTableViewCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension GroupTopPlayerTableViewCell : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listItem.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "topPlayerTableViewCell") as! TopPlayerTableViewCell
        cell.setData(data: listItem[indexPath.row], type: type ?? "", category: category ?? CategoryEnum.Leagues)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
}
