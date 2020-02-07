//
//  FixturesController.swift
//  LiveScore
//
//  Created by MinhNT on 8/29/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import UIKit

class LeaguesFixturesController: BaseViewController, LeaguesFixturesView {

    @IBOutlet weak var tbFixtures: UITableView!
    var presenter: LeaguesFixturesPresenter!
    var config: LeaguesFixturesConfiguration  = LeaguesFixturesConfigurationImplementation()
    override func viewDidLoad() {
        super.viewDidLoad()
        config.configure(leaguesFixturesControler: self)
        presenter.viewDidLoad()
        setupTableview()
    }
    func setupTableview(){
        tbFixtures.delegate = self
        tbFixtures.dataSource = self
        tbFixtures.register(UINib(nibName: "FavoritesMatchesTableViewCell", bundle: nil), forCellReuseIdentifier: "favoritesMatchesTableViewCell")
    }
    
    func handleError(title: String, content: String) {
        
    }
    
    func reloadTableView() {
        tbFixtures.reloadData()
    }
 
}
extension LeaguesFixturesController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter.numberOfList
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favoritesMatchesTableViewCell") as! FavoritesMatchesTableViewCell
        cell.setData(data: presenter.getItemOfList(row: indexPath.row))
        cell.clickMatches = {[weak self] in
            self?.presenter.presentMatchDetail(matchesId: self?.presenter.getItemOfList(row: indexPath.row).fixture_id ?? 0)
        }
        return cell
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == (presenter.numberOfList - 1) {
            presenter.page = presenter.page + 1
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
}
