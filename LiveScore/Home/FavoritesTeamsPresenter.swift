//
//  FavoritesTeamsPresenter.swift
//  LiveScore
//
//  Created by MinhNT on 9/5/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
protocol FavoritesTeamsView: class {
    func handleError(title: String, content: String)
    func reloadTableView()
}


protocol FavoritesTeamsPresenter {
    func viewDidLoad()
    var numberOfList: Int {get}
    func getItemOfList(row:Int) -> FavoritesTeamEntity
    func presentTeam(teamId:Int)
}

class FavoritesTeamsPresenterImplementation: FavoritesTeamsPresenter{
    
    var listFavoritesTeams: [FavoritesTeamEntity] = []
    fileprivate weak var view: FavoritesTeamsView?
    internal let router: FavoritesTeamsViewRouter
    var favoritesGateway: FavoritesGateway?
    init(view: FavoritesTeamsView, router: FavoritesTeamsViewRouter, favoritesGateway: FavoritesGateway) {
        self.view = view
        self.router = router
        self.favoritesGateway = favoritesGateway
    }
    
    var numberOfList: Int {
        return listFavoritesTeams.count
    }
    
    func getItemOfList(row: Int) -> FavoritesTeamEntity {
        return listFavoritesTeams[row]
    }
    
    func viewDidLoad() {
        registerNotification()
        getListFavoritesTeam()
        
    }

    func registerNotification(){
        NotificationCenter.default.addObserver(self, selector: #selector(getListFavoritesTeam), name: notificationName.getFavoritesTeams.notification, object: nil)
    }
    
    @objc func getListFavoritesTeam(){
        favoritesGateway?.getTeamsFavorites(completionHandler: { (result) in
            switch (result) {
            case let .success(data):
                if data.status == CodeResponse.success{
                    self.listFavoritesTeams = data.result_Teams
                    self.view?.reloadTableView()
                }else {
                    self.view?.handleError(title: "Error", content: data.message!)
                }
                break
                
            case let .failure(error):
                LoadingHUDControl.sharedManager.hideLoadingHud()
                self.view?.handleError(title: NSLocalizedString("announce", comment: ""), content: error.localizedDescription)
                break
            }
        })
    }
    
    func presentTeam(teamId:Int){
        self.router.presentTeam(teamId: teamId)
    }
    
}
