//
//  MatchesLineupsViewController.swift
//  LiveScore
//
//  Created by MinhNT on 11/11/19.
//  Copyright (c) 2019 MinhNT. All rights reserved.
//

import UIKit

class MatchesLineupsViewController: BaseViewController, MatchesLineupsView {
    
    // MARK: Outlets
    
    @IBOutlet weak var tbLineups: UITableView!
    // MARK: Injections
    var presenter: MatchesLineupsPresenter!
    var configurator: MatchesLineupsConfigurable = MatchesLineupsConfigurator()

    // MARK: View lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(viewController: self)
        presenter.viewDidLoad()
        setupTableview()
        
    }
    func setupTableview(){
        tbLineups.delegate = self
        tbLineups.dataSource = self
        tbLineups.register(UINib(nibName: "TeamsClubTableViewCell", bundle: nil), forCellReuseIdentifier: "teamsClubTableViewCell")
    }
    
    func handleError(title: String, content: String) {
        
    }
    func reloadTableview(){
        tbLineups.reloadData()
    }
}
extension MatchesLineupsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.numberOfList
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getNumberOfList(section: section)
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let viewHeader = UIView()
        viewHeader.backgroundColor = UIColor.black
        let title = UILabel()
        title.text = presenter.getItemOfList(section: section)
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
        }else if indexPath.row == (presenter.getNumberOfList(section: indexPath.section) - 1) {
            cell.viewBot.isHidden = true
            cell.viewBound.roundCorners(corners: [.bottomLeft,.bottomRight], radius: 10)
        }else {
            cell.viewBot.isHidden = false
            cell.setDefault()
        }
        cell.setData(data: presenter.getItemOfList(section: indexPath.section, row: indexPath.row))
        return cell
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
}
