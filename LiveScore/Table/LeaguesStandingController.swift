
//
//  TableController.swift
//  LiveScore
//
//  Created by MinhNT on 8/29/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import UIKit

class LeaguesStandingController: BaseViewController, LeaguesStandingView {
    
    var sectionData:[Int:[String]] = [:]
    let sections: [String] = ["Premier League","Europa League Qualification", "Italya"]
    
    let s1Data:[String] = ["46451","123","1123123","1123123","13123123","46451","123","1123123","1123123","13123123"]
    let s2Data:[String] = ["1123123","123123","131231","112312","112312"]
    let s3Data:[String] = ["1123123","1312312","143453","31231","1312312"]
    
    @IBOutlet weak var tbRanks: UITableView!
    var presenter:LeaguesStandingPresenter!
    var config: LeaguesStandingConfiguration = LeaguesStandingConfigurationImplementation()
    override func viewDidLoad() {
        super.viewDidLoad()
        config.configure(leaguesStandingControler: self)
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
    
    func reloadTableView() {
        tbRanks.reloadData()
    }
    
    
}
extension LeaguesStandingController: UITableViewDelegate, UITableViewDataSource {
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
        label.frame = CGRect(x: 50, y: 0, width: 300, height: 25)
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
        cell.setData(data: presenter.getItemOfListPosition(section: indexPath.section, row: indexPath.row) )
        return cell
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 100
        }else {
            return 70
        }
        
    }
    
    
}
