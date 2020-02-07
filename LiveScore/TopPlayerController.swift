//
//  TopPlayerController.swift
//  LiveScore
//
//  Created by MinhNT on 8/29/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import UIKit

class TopPlayerController: BaseViewController, TopPlayerView {
   

    @IBOutlet weak var tbTopPlayer: UITableView!
    
    var presenter:TopPlayerPresenter!
    var config:TopPlayerConfigurable = TopPlayerConfigurator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config.configure(viewController: self)
        presenter.viewDidLoad()
        setupTableView()
    }
    func setupTableView(){
        tbTopPlayer.delegate = self
        tbTopPlayer.dataSource = self
        tbTopPlayer.register(UINib(nibName: "GroupTopPlayerTableViewCell", bundle: nil), forCellReuseIdentifier: "groupTopPlayerTableViewCell")
    }
    
    func handleError(title: String, content: String) {
        
    }
    func reloadTableview() {
        tbTopPlayer.reloadData()
    }
    
}
extension TopPlayerController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfList
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tbTopPlayer.dequeueReusableCell(withIdentifier: "groupTopPlayerTableViewCell") as! GroupTopPlayerTableViewCell
        cell.type = presenter.getTypeOfList(row: indexPath.row)
        cell.category = CategoryEnum.Leagues
        cell.listItem = presenter.getDataOfList(row: indexPath.row)
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    

}
