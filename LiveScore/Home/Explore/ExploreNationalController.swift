//
//  ExploreNationalController.swift
//  LiveScore
//
//  Created by MinhNT on 9/19/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import UIKit

class ExploreNationalController: BaseViewController, ExploreNationalView {
    
    

    @IBOutlet weak var lbSection: UILabel!
    @IBOutlet weak var tbNational: UITableView!
    
    var config : ExploreNationalConfiguration = ExploreNationalConfigurationImplementation()
    var presenter: ExploreNationalPresenter!
    var nationalId:Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableview()
        config.configure(exploreNationalControler: self)
        presenter.viewDidLoad(id:nationalId ?? 0)
        
    }
    func setupTableview(){
        tbNational.register(UINib(nibName: "LeaguesTableViewCell", bundle: nil), forCellReuseIdentifier: "leaguesTableViewCell")
        tbNational.delegate = self
        tbNational.dataSource = self
        tbNational.setViewRadius()
    }
    
    func setNameNational(name:String){
        lbSection.text = name
    }
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tbNational.reloadData()
    }
    func handleError(title: String, content: String) {
        
    }
    func reloadTableView() {
        tbNational.reloadData()
    }
    
}
extension ExploreNationalController:UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfListNational
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "leaguesTableViewCell") as! LeaguesTableViewCell
        if indexPath.row == 0 {
            cell.viewSpecial.isHidden = true
        }
        cell.clickLeagues = { [weak self] in
            DataSingleton.leagues_id = self?.presenter.getLeaguesInList(index: indexPath.row).league_id ?? 0
            self?.presenter.presentLeaguesDetail(leaguesId: self?.presenter.getLeaguesInList(index: indexPath.row).league_id ?? 0)
        }
        cell.setData(data: presenter.getLeaguesInList(index: indexPath.row))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
