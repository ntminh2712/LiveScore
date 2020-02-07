//
//  TeamsFixturesController.swift
//  LiveScore
//
//  Created by MinhNT on 9/3/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import UIKit

class TeamsFixturesController: BaseViewController, TeamsFixturesView {

    @IBOutlet weak var tbFixtures: UITableView!
    var presenter:TeamsFixturesPresenter!
    var config: TeamsFixturesConfigurable = TeamsFixturesConfigurator()
    override func viewDidLoad() {
        super.viewDidLoad()
        config.configure(viewController: self)
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
    
    func reloadTableview(){
        tbFixtures.reloadData()
    }
    
}
extension TeamsFixturesController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfList
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favoritesMatchesTableViewCell") as! FavoritesMatchesTableViewCell
        cell.setData(data: self.presenter.getItemOfList(row: indexPath.row))
        cell.clickMatches = {[weak self] in
            self?.presenter.presentMatchDetail(matchesId: self?.presenter.getItemOfList(row: indexPath.row).fixture_id ?? 0)
        }
        return cell
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == presenter.numberOfList - 1 {
            self.presenter.page = self.presenter.page + 1
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
}
