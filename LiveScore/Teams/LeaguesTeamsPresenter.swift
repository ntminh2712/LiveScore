//
//  LeaguesTeamsPrsenter.swift
//  LiveScore
//
//  Created by MinhNT on 10/15/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
protocol LeaguesTeamsView: class {
    func handleError(title: String, content: String)
    func reloadTableview()
}


protocol LeaguesTeamsPresenter {
    func viewDidLoad()
    var numberOfList:Int {get}
    func getItemOfList(row:Int) -> LeaguesTeamDetailEntity
    func handlerFavorites(teamId:Int)
    func presentTeam(teamId:Int)
}

class LeaguesTeamsPresenterImplementation: LeaguesTeamsPresenter{
    var listTeams:[LeaguesTeamDetailEntity] = []
    fileprivate weak var view: LeaguesTeamsView?
    internal let router: LeaguesTeamsViewRouter
    var matchesGateway:MatchesGateway?
    var leaguesGateway: LeaguesGateway?
    var favoritesGateway:FavoritesGateway?
    init(view: LeaguesTeamsView, router: LeaguesTeamsViewRouter,matchesGateway:MatchesGateway,leaguesGateway: LeaguesGateway,favoritesGateway:FavoritesGateway) {
        self.view = view
        self.router = router
        self.matchesGateway = matchesGateway
        self.leaguesGateway = leaguesGateway
        self.favoritesGateway = favoritesGateway
    }
    
    var numberOfList: Int {
        return listTeams.count
    }
    
    func getItemOfList(row: Int) -> LeaguesTeamDetailEntity {
        return listTeams[row]
    }
    
    func viewDidLoad() {
        registerNotification()
    }
    func registerNotification(){
        NotificationCenter.default.addObserver(self, selector: #selector(getListTeams(_:)), name: notificationName.getListTeam.notification, object: nil)
    }
    
    @objc func getListTeams(_ notification: NSNotification){
        if let seasonId = notification.userInfo?["season"] as? Int{
            leaguesGateway?.getListTeam(season_id: seasonId
                , completionHandler: { (result) in
                    switch (result) {
                    case let .success(data):
                        if data.status == CodeResponse.success{
                            self.listTeams = data.result
                        }else {
                            self.view?.handleError(title: "Error", content: data.message!)
                        }
                        self.view?.reloadTableview()
                        break
                    case let .failure(error):
                        LoadingHUDControl.sharedManager.hideLoadingHud()
                        self.view?.handleError(title: NSLocalizedString("announce", comment: ""), content: error.localizedDescription)
                        break
                    }
            })
        }
        
    }
    func handlerFavorites(teamId:Int){
        favoritesGateway?.handlerFavorites(id: teamId, type: FavoritesType.Team.rawValue, completionHandler: { (result) in
            switch (result) {
            case let .success(data):
                if data.status == CodeResponse.success{
                    print("handler favorites success")
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

    func presentTeam(teamId:Int) {
        self.router.presentTeam(teamId: teamId)
        
    }
    
//    func presentLeaguesTeams(){
//        self.router.presentLeaguesTeams()
//    }
    
}
