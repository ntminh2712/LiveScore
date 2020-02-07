
//
//  TeamController.swift
//  LiveScore
//
//  Created by MinhNT on 8/29/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import UIKit

class LeaguesTeamsController: BaseViewController, LeaguesTeamsView {
    
    @IBOutlet weak var tbTeams: UITableView!
    
    var presenter:LeaguesTeamsPresenter!
    var config: LeaguesTeamsConfiguration = LeaguesTeamsConfigurationImplementation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config.configure(leaguesTeamsControler: self)
        presenter.viewDidLoad()
        setupTableview()
    }
    
    func setupTableview(){
        tbTeams.delegate = self
        tbTeams.dataSource = self
        tbTeams.register(UINib(nibName: "LeaguesTeamTableViewCell", bundle: nil), forCellReuseIdentifier: "leaguesTeamTableViewCell")
    }
    func handleError(title: String, content: String) {
        
    }
    func reloadTableview() {
        tbTeams.reloadData()
    }
    
}
extension LeaguesTeamsController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfList
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "leaguesTeamTableViewCell") as! LeaguesTeamTableViewCell
        cell.setData(data: presenter.getItemOfList(row: indexPath.row))
        cell.lbPosition.text = String(indexPath.row + 1)
        cell.handlerFavorites = { [weak self] in
            self?.presenter.handlerFavorites(teamId: self?.presenter.getItemOfList(row: indexPath.row).team_id ?? 0)
            self?.presenter.getItemOfList(row: indexPath.row).favorite = !((self?.presenter.getItemOfList(row: indexPath.row).favorite)!)
            self?.tbTeams.reloadData()
        }
        cell.clickTeam = {[weak self] in
            self?.presenter.presentTeam(teamId: self?.presenter.getItemOfList(row: indexPath.row).team_id ?? 0)
        }
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
