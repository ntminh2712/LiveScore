//
//  SectionExploreTableViewCell.swift
//  LiveScore
//
//  Created by MinhNT on 9/18/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import UIKit

class SectionExploreTableViewCell: UITableViewCell {
    @IBOutlet weak var lbNameExplore: UILabel!
    @IBOutlet weak var tbExplore: OwnTableView!
    var listExplore:[ExploreLeaguesEntity] = []
    var type:ExploreType = ExploreType.popupar

    var dataExplore: ExploreResultEntity? = nil{
        didSet {
            lbNameExplore.text = type.rawValue
            self.tbExplore.reloadData()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        setupTableview()
    }
    func setupTableview(){
        tbExplore.register(UINib(nibName: "LeaguesTableViewCell", bundle: nil), forCellReuseIdentifier: "leaguesTableViewCell")
        
        tbExplore.delegate = self
        tbExplore.dataSource = self
        tbExplore.setViewRadius()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    var clickLeagues:((Int)->())?
    
    var clickNational:((Int)->())?
    var reloadParrent:(()->())?
}
extension SectionExploreTableViewCell: UITableViewDelegate, UITableViewDataSource {
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch type {
        case ExploreType.popupar:
            return dataExplore?.popular.count ?? 0
        case ExploreType.world:
            return dataExplore?.world.count ?? 0
        case ExploreType.national:
            return dataExplore?.national.count ?? 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "leaguesTableViewCell") as! LeaguesTableViewCell
        

        cell.layoutIfNeeded()
        switch type {
        case ExploreType.popupar:
            cell.setData(data: (self.dataExplore?.popular[indexPath.row])!)
            
            break
        case ExploreType.world:
            cell.setData(data: (self.dataExplore?.world[indexPath.row])!)
            break
        case ExploreType.national:
            cell.setData(data: (self.dataExplore?.national[indexPath.row])!)
            break
        }
        if indexPath.row == 0 {
            cell.viewSpecial.isHidden = true
        }
        cell.clickLeagues = {[weak self] in
            if self?.type == ExploreType.popupar  {
                DataSingleton.leagues_id = (self?.dataExplore?.popular[indexPath.row].league_id)!
                self?.clickLeagues?((self?.dataExplore?.popular[indexPath.row].league_id)!)
            }else if self?.type == ExploreType.world {
                DataSingleton.leagues_id = (self?.dataExplore?.world[indexPath.row].league_id)!
                self?.clickLeagues?((self?.dataExplore?.world[indexPath.row].league_id)!)
            }else {
                self?.clickNational?((self?.dataExplore?.national[indexPath.row].country_id)!)
            }
        }
//
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
