//
//  FavoritesLeaguesController.swift
//  LiveScore
//
//  Created by MinhNT on 8/28/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import UIKit

class FavoritesLeaguesController: BaseViewController,FavoritesLeaguesView {
    
    

    @IBOutlet weak var tbLeagues: UITableView!
    @IBOutlet weak var viewDataEmpty: UIView!
    
    var presenter: FavoritesLeaguesPresenter!
    var config: FavoritesLeaguesConfiguration = FavoritesLeaguesConfigurationImplementation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config.configure(favoritesLeaguesControler: self)
        presenter.viewDidLoad()
        setupTableview()
    }
    
    func setupTableview(){
        tbLeagues.delegate = self
        tbLeagues.dataSource = self
        tbLeagues.register(UINib(nibName: "FavoritesLeaguesTableViewCell", bundle: nil), forCellReuseIdentifier: "favoritesLeaguesTableViewCell")
    }
    func handleError(title: String, content: String) {
        
    }
    func reloadTableView() {
        tbLeagues.reloadData()
        if presenter.numberOfList == 0 {
            viewDataEmpty.isHidden = false
        }else {
            viewDataEmpty.isHidden = true
        }
    }
    
}
extension FavoritesLeaguesController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfList
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favoritesLeaguesTableViewCell") as! FavoritesLeaguesTableViewCell
        cell.setData(data: self.presenter.getNumberOfList(row: indexPath.row))
        cell.clickLeagues = {[weak self] in
            self?.presenter.presentLeaguesDetail(leaguesId: self?.presenter.getNumberOfList(row: indexPath.row).league_id ?? 0)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
}
