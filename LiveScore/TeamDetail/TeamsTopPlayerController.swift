//
//  TeamTopPlayerController.swift
//  LiveScore
//
//  Created by MinhNT on 9/3/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import UIKit

class TeamsTopPlayerController: BaseViewController, TeamsTopPlayerView {

    @IBOutlet weak var tbTopPlayer: UITableView!
    var presenter:TeamsTopPlayerPresenter!
    var config:TeamsTopPlayerConfigurable = TeamsTopPlayerConfigurator()
    override func viewDidLoad() {
        super.viewDidLoad()
        config.configure(viewController: self)
        presenter.viewDidLoad()
        setupTableView()
    }
    
    func setupTableView(){
        tbTopPlayer.delegate = self
        tbTopPlayer.dataSource = self
        tbTopPlayer.register(UINib(nibName: "TopPlayerTableViewCell", bundle: nil), forCellReuseIdentifier: "topPlayerTableViewCell")
        tbTopPlayer.register(UINib(nibName: "GroupTopPlayerTableViewCell", bundle: nil), forCellReuseIdentifier: "groupTopPlayerTableViewCell")
    }
    
    func reloadTableview(){
        tbTopPlayer.reloadData()
    }
    func handleError(title: String, content: String) {
        
    }
}
extension TeamsTopPlayerController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tbTopPlayer.dequeueReusableCell(withIdentifier: "groupTopPlayerTableViewCell") as! GroupTopPlayerTableViewCell
        cell.type = presenter.getTypeOfList(row: indexPath.row)
        cell.category = CategoryEnum.Teams
        cell.listItem = presenter.getDataOfList(row: indexPath.row)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 340
    }
    
}
