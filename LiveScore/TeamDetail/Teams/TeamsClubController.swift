//
//  TeamsClubController.swift
//  LiveScore
//
//  Created by MinhNT on 9/3/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import UIKit

class TeamsClubController: BaseViewController, TeamsClubView {

    @IBOutlet weak var tbTeamClub: UITableView!
    var presenter:TeamsClubPresenter!
    var config:TeamsClubConfigurable = TeamsClubConfigurator()
    override func viewDidLoad() {
        super.viewDidLoad()
        config.configure(viewController: self)
        presenter.viewDidLoad()
        setupTableview()
    }
    func setupTableview(){
        tbTeamClub.delegate = self
        tbTeamClub.dataSource = self
        tbTeamClub.register(UINib(nibName: "TeamsClubTableViewCell", bundle: nil), forCellReuseIdentifier: "teamsClubTableViewCell")
    }
    
    func handleError(title: String, content: String) {
        
    }
    func reloadTableview(){
        tbTeamClub.reloadData()
    }
}

extension TeamsClubController: UITableViewDataSource,UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.numberOfList
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfListPosition(section: section)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let viewHeader = UIView()
        viewHeader.backgroundColor = UIColor.black
        let title = UILabel()
        title.text = presenter.getItemOfList(row: section).name
        title.frame = CGRect(x: 35, y: 5, width: 300, height: 35)
        title.textColor = .white
        viewHeader.addSubview(title)
        let type = UILabel()
        type.frame = CGRect(x: self.view.frame.width - 80, y: 10, width: 100, height: 25)
        type.text = "Shirt No"
        type.textColor = .white
        viewHeader.addSubview(type)
        return viewHeader
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "teamsClubTableViewCell") as! TeamsClubTableViewCell
        if indexPath.row == 0 {
            cell.viewBot.isHidden = false
            cell.setupView()
        }else if indexPath.row == (presenter.getItemOfList(row: indexPath.section).data.count - 1) {
            cell.viewBot.isHidden = true
            cell.viewBound.roundCorners(corners: [.bottomLeft,.bottomRight], radius: 10)
        }else {
            cell.viewBot.isHidden = false
            cell.setDefault()
        }
        cell.setData(data: presenter.getItemOfListPosition(section: indexPath.section, row: indexPath.row))
        return cell
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
