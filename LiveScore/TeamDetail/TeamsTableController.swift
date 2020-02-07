//
//  TeamsTableController.swift
//  LiveScore
//
//  Created by MinhNT on 9/3/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import UIKit

class TeamsTableController: BaseViewController, TeamsTableView {

    @IBOutlet weak var tbRanks: UITableView!
    var presenter: TeamsTablePresenter!
    var config: TeamsTableConfigurable = TeamsTableConfigurator()
    override func viewDidLoad() {
        super.viewDidLoad()
        config.configure(viewController: self)
        presenter.viewDidLoad()
        setupTableview()
    }
    func setupTableview() {
        tbRanks.delegate = self
        tbRanks.dataSource = self
        tbRanks.register(UINib(nibName: "RankTeamTableViewCell", bundle: nil), forCellReuseIdentifier: "rankTeamTableViewCell")
    }
    func handleError(title: String, content: String) {
        
    }
    
    func reloadTableview(){
        tbRanks.reloadData()
    }
    
}
extension TeamsTableController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.numberOfList
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfListPosition(section: section)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let viewHeader = UIView()
        viewHeader.backgroundColor = UIColor.black
        let label = UILabel()
        label.text = presenter.getItemOfList(row: section).group_name
        label.frame = CGRect(x: 50, y: 5, width: 300, height: 35)
        label.textColor = .white
        viewHeader.addSubview(label)
        return viewHeader
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "rankTeamTableViewCell") as! RankTeamTableViewCell
        if indexPath.row != 0 {
            cell.hiddenViewTitle()
        }else {
            cell.showViewTitle()
        }
        cell.setData(data: presenter.getItemOfListPosition(section: indexPath.section, row: indexPath.row))
        return cell
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 100
        }else {
            return 70
        }
        
    }
    
    
}
