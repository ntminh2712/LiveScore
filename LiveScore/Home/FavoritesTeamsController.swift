//
//  FavoritesTeamsController.swift
//  LiveScore
//
//  Created by MinhNT on 8/28/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import UIKit

class FavoritesTeamsController: UIViewController, FavoritesTeamsView {
    
    @IBOutlet weak var viewDataEmpty: UIView!
    @IBOutlet weak var clTeams: UICollectionView!
    var presenter:FavoritesTeamsPresenter!
    var config: FavoritesTeamsConfiguration = FavoritesTeamsConfigurationImplementation()
    override func viewDidLoad() {
        super.viewDidLoad()
        config.configure(FavoritesTeamsControler: self)
        presenter.viewDidLoad()
        setupTableview()
    }
    
    func setupTableview(){
        clTeams.delegate = self
        clTeams.dataSource = self
        clTeams.register(UINib(nibName: "FavoritesTeamsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "favoritesTeamsCollectionViewCell")
        
    }
    
    func handleError(title: String, content: String) {
        
    }
    func reloadTableView() {
        clTeams.reloadData()
        if presenter.numberOfList == 0 {
            viewDataEmpty.isHidden = false
        }else {
            viewDataEmpty.isHidden = true
        }
    }
}
extension FavoritesTeamsController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.numberOfList
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "favoritesTeamsCollectionViewCell", for: indexPath) as! FavoritesTeamsCollectionViewCell
        cell.setData(data: presenter.getItemOfList(row: indexPath.row))
        cell.clickTeam = {[weak self] in
            self?.presenter.presentTeam(teamId: self?.presenter.getItemOfList(row: indexPath.row).team_id ?? 0 )
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (self.clTeams.frame.width / 3) - 15
        return CGSize(width: width, height: width + 70)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
