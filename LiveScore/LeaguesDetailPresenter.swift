//
//  LeaguesDetailPresenter.swift
//  LiveScore
//
//  Created by MinhNT on 10/4/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
protocol LeaguesDetailView: class {
    func handleError(title: String, content: String)
    func setDataLeagues(data:LeaguesDetailEntity)
}


protocol LeaguesDetailPresenter {
    func viewDidLoad(leaguesId:Int)
    func presentMatchDetail(matchesId:Int)
    func presentLeaguesDetail(leaguesId:Int)
    func handlerFavorites(leaguesId:Int)
}

class LeaguesDetailPresenterImplementation: LeaguesDetailPresenter{
    
    fileprivate weak var view: LeaguesDetailView?
    internal let router: LeaguesDetailViewRouter
    var matchesGateway:MatchesGateway?
    var leaguesGateway: LeaguesGateway?
    var favoritesGateway:FavoritesGateway?
    var data:LeaguesDetailEntity? {
        didSet{
            self.view?.setDataLeagues(data: self.data!)
        }
    }
    init(view: LeaguesDetailView, router: LeaguesDetailViewRouter,matchesGateway:MatchesGateway,leaguesGateway: LeaguesGateway,favoritesGateway:FavoritesGateway) {
        self.view = view
        self.router = router
        self.matchesGateway = matchesGateway
        self.leaguesGateway = leaguesGateway
        self.favoritesGateway = favoritesGateway
    }
    func viewDidLoad(leaguesId:Int) {
        getDetailLeagues(id:leaguesId)
    }
    
    func getDetailLeagues(id:Int){
        leaguesGateway?.getLeaguesDetail(id: id
            , completionHandler: { (result) in
                switch (result) {
                case let .success(data):
                    if data.status == CodeResponse.success{
                        if data.result != nil {
                            self.data = data.result
                            if let seasonId = data.result?.curent_season_id, let leaguesId = data.result?.league_id {
                                self.pushSeasonId(seasonId: seasonId, leaguesId:leaguesId)
                            }
                        }else {
                            self.view?.handleError(title: "Error", content: data.message!)
                        }
                    }
                    
                    break
                case let .failure(error):
                    LoadingHUDControl.sharedManager.hideLoadingHud()
                    self.view?.handleError(title: NSLocalizedString("announce", comment: ""), content: error.localizedDescription)
                    break
                }
        })
    }
    func handlerFavorites(leaguesId:Int){
        favoritesGateway?.handlerFavorites(id: leaguesId, type: FavoritesType.Leagues.rawValue, completionHandler: { (result) in
            switch (result) {
            case let .success(data):
                if data.status == CodeResponse.success{
                    self.data?.favorite = !(self.data?.favorite ?? false)
                    self.view?.setDataLeagues(data: self.data!)
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
    
    func pushSeasonId(seasonId:Int,leaguesId:Int){
        let season:[String:Int] = ["season":seasonId]
        let leagues:[String:Int] = ["leaguesId":leaguesId]
        NotificationCenter.default.post(name: notificationName.getListTeam.notification, object:nil, userInfo: season)
        NotificationCenter.default.post(name: notificationName.getTopPlayerLeagues.notification, object: nil, userInfo: season)
        NotificationCenter.default.post(name: notificationName.getLeaguesStanding.notification, object: nil, userInfo: leagues)
        NotificationCenter.default.post(name: notificationName.getLeaguesFixtures.notification, object: nil, userInfo: leagues)
    }
    
    func presentMatchDetail(matchesId:Int) {
        self.router.presentMatchDetail(matchesId: matchesId)
    }
    func presentLeaguesDetail(leaguesId:Int){
        self.router.presentLeaguesDetail(leaguesId: leaguesId)
    }
    
}
