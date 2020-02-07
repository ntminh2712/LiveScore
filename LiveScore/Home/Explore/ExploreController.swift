//
//  ViewController.swift
//  SampleTableViewInside
//
//  Created by Katana on 8/31/19.
//  Copyright © 2019 Katana. All rights reserved.
//

import UIKit

class ExploreController: BaseViewController,ExploreView {
    
    @IBOutlet weak var tableView: UITableView!
    
    var config:ExploreConfiguration = ExploreConfigurationImplementation()
    var presenter: ExplorePresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config.configure(exploreControler: self)
        presenter.viewDidLoad()
        tableView.register(UINib(nibName: "SectionExploreTableViewCell", bundle: nil), forCellReuseIdentifier: "sectionExploreTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.setViewRadius()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.moveRow(at: indexPath, to: indexPath)
    }
    
    func reloadTableView() {
        tableView.beginUpdates()
        tableView.reloadData()
        tableView.endUpdates()
    }
    
    func handleError(title: String, content: String) {
        
    }
    func setDataSection(dataExplore: ExploreResultEntity) {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sectionExploreTableViewCell") as! SectionExploreTableViewCell
        cell.dataExplore = dataExplore
    }
    
}


extension ExploreController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sectionExploreTableViewCell") as! SectionExploreTableViewCell
        switch indexPath.row {
        case 0:
            cell.type = ExploreType.popupar
            break
        case 1:
            cell.type = ExploreType.world
            break
        case 2:
            cell.type = ExploreType.national
            break
        default:
            break
        }
        cell.clickLeagues = {(leaguesId)->() in
            self.presenter.presentLeaguesDetail(leaguesId: leaguesId)
        }
        cell.clickNational = {(nationId)->() in
            self.presenter.presentNationDetail(nationalId: nationId)
        }
        cell.dataExplore = presenter.getDataExplore()
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }


}

