//
//  SectionScoresTableViewCell.swift
//  LiveScore
//
//  Created by MinhNT on 9/17/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import UIKit

class SectionScoresTableViewCell: UITableViewCell {
    
    @IBOutlet weak var tbMatches: UITableView!
    var listMatches:[MatchesDetailEntity] = []
    @IBOutlet weak var lbNameLeagues: UILabel!
    @IBOutlet weak var iconLeagues: UIImageView!
    var dataLeagues: MatchesLeaguesEntity? {
        didSet{
            lbNameLeagues.text = dataLeagues?.title_leagues
            listMatches = dataLeagues?.matches ?? []
            iconLeagues.setCustomImage(dataLeagues?.logo_path, defaultAvatar: nil)
            tbMatches.reloadData()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        setupTableview()
    }
    
    func setupTableview(){
        tbMatches.register(UINib(nibName: "MatchTableViewCell", bundle: nil), forCellReuseIdentifier: "matchTableViewCell")
        tbMatches.delegate = self
        tbMatches.dataSource = self
        tbMatches.setViewRadius()
        
        tbMatches.reloadData()
    }
    @IBAction func clickLeagues(_ sender: Any) {
        self.clickLeagues?()
    }
    var clickLeagues:(()->())?

    var clickDetail:((Int)->())?
    var handlerFavorites:((Int)->())?
   
}
extension SectionScoresTableViewCell: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listMatches.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "matchTableViewCell") as! MatchTableViewCell
        if indexPath.row == 0 {
            cell.hideViewSpectial()
        }
        cell.clickDetail = {[weak self] in
            self?.clickDetail?(self?.listMatches[indexPath.row].fixture_id ?? 0)
        }
        cell.handlerFavorites = {[weak self] in
            self?.listMatches[indexPath.row].favorites = !((self?.listMatches[indexPath.row].favorites)!)
            self?.handlerFavorites?(self?.listMatches[indexPath.row].fixture_id ?? 0)
            self?.tbMatches.reloadData()
        }
        cell.setData(data: listMatches[indexPath.row])
        cell.layoutIfNeeded()
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
