//
//  MatchesController.swift
//  LiveScore
//
//  Created by MinhNT on 8/28/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import UIKit

class FavoritesMatchesController: BaseViewController, FavoritesMatchesView {
    
    @IBOutlet weak var tbMatchesFavorites: UITableView!
    @IBOutlet weak var viewDataEmpty: UIView!
    
    
    var presenter:FavoritesMatchesPresenter!
    var config: FavoritesMatchesConfigurable = FavoritesMatchesConfigurator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config.configure(viewController: self)
        presenter.viewDidLoad()
        setupTableview()
    }

    func setupTableview(){
        tbMatchesFavorites.delegate = self
        tbMatchesFavorites.dataSource = self
        tbMatchesFavorites.register(UINib(nibName: "FavoritesMatchesTableViewCell", bundle: nil), forCellReuseIdentifier: "favoritesMatchesTableViewCell")
    }
    func handleError(title: String, content: String) {
        
    }
    
    func reloadTableview() {
        tbMatchesFavorites.reloadData()
        if presenter.sectionCount == 0 {
            viewDataEmpty.isHidden = false
        }else {
            viewDataEmpty.isHidden = true
        }
    }
    @objc func showLeagues(sender:UIButton){
        self.presenter.presentLeaguesDetail(leaguesId: sender.tag)
    }
    
}

extension FavoritesMatchesController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  presenter.getNumberOfSection(section: section)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.sectionCount
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor.black
        let image:UIImageView = UIImageView()
        image.setCustomImage(presenter.getItemSection(section: section).logo_path, defaultAvatar: "")
        image.frame = CGRect(x: 20, y: 10, width: 25, height: 25)
        view.addSubview(image)
        let label = UILabel()
        label.text = presenter.getItemSection(section: section).title_leagues
        label.frame = CGRect(x: 55, y: 5, width: 500, height: 35)
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 17)
        view.addSubview(label)
        let imageArrow = UIImageView(image: UIImage(named: "icon_arrow_border_right"))
        imageArrow.frame = CGRect(x: self.view.frame.width - 60, y: 10 , width: 25, height: 25)
        view.addSubview(imageArrow)
        let button = UIButton()
        button.setTitle("", for: .normal)
        button.frame = CGRect(x: self.view.frame.width - 57.5, y: 7.5 , width: 35, height: 35)
        button.addTarget(self, action: #selector(showLeagues(sender:)), for: .touchUpInside)
        button.tag = presenter.getItemSection(section: section).league_id ?? 0
        view.addSubview(button)
        return view
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favoritesMatchesTableViewCell") as! FavoritesMatchesTableViewCell
        cell.setData(data: presenter.getNumberSection(row: indexPath.row, section: indexPath.section))
        cell.clickMatches = {[weak self] in
            self?.presenter.presentMatchesDetail(matchesId: self?.presenter.getNumberSection(row: indexPath.row, section: indexPath.section).fixture_id ?? 0)
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
        
    }
    
    
}
