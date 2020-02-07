//
//  TeamDetailPresenter.swift
//  LiveScore
//
//  Created by MinhNT on 10/29/19.
//  Copyright (c) 2019 MinhNT. All rights reserved.
//

import Foundation

protocol TeamDetailView {
    
    func handleError(title: String, content: String)
    func setDataTeamDetail(data:TeamDetailEntity)
}

protocol TeamDetailPresenter {
    func viewDidLoad(teamId:Int)
    func handlerFavorites(teamId:Int)
}

class TeamDetailPresenterImplementation: TeamDetailPresenter {
    
    //MARK: Injections
    private var view: TeamDetailView?
    var router: TeamDetailViewRouter
    var teamsGateway: TeamsGateway?
    var favoritesGateway:FavoritesGateway?
    var data:TeamDetailEntity? {
        didSet{
            self.view?.setDataTeamDetail(data: self.data!)
        }
    }
    //MARK: LifeCycle

    init(view: TeamDetailView, router: TeamDetailViewRouter, teamsGateway: TeamsGateway,favoritesGateway:FavoritesGateway) {
        self.view = view
        self.router = router
        self.teamsGateway = teamsGateway
        self.favoritesGateway = favoritesGateway
    }
    func viewDidLoad(teamId:Int){
        getTeamDetail(teamId: teamId)
    }
    
    func getTeamDetail(teamId:Int){
        teamsGateway?.getTeamDetail(teamId: teamId, seasonId: 0, completionHandler: { (result) in
            switch (result) {
            case let .success(data):
                if data.status == CodeResponse.success{
                    self.data = data.result
                    self.pushSeasonId(seasonId: data.result?.current_season_id ?? 0, teamId: data.result?.team_id ?? 0)
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
    
    func handlerFavorites(teamId:Int){
        favoritesGateway?.handlerFavorites(id: teamId, type: FavoritesType.Team.rawValue, completionHandler: { (result) in
            switch (result) {
            case let .success(data):
                if data.status == CodeResponse.success{
                    self.data?.favorite = !(self.data?.favorite ?? false)
                    self.view?.setDataTeamDetail(data: self.data!)
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
    func pushSeasonId(seasonId:Int, teamId:Int){
        let season:[String:Int] = ["season":seasonId, "teamId":teamId]
        let teamId:[String:Int] = ["teamId":teamId]
        NotificationCenter.default.post(name: notificationName.getTopPlayerTeams.notification, object:nil, userInfo: season)
        NotificationCenter.default.post(name: notificationName.getTeamFixtures.notification, object: nil, userInfo: teamId)
        NotificationCenter.default.post(name: notificationName.getTeamLineup.notification, object: nil, userInfo: teamId)
        NotificationCenter.default.post(name: notificationName.getTeamStanding.notification, object: nil, userInfo: teamId)
    }
}

// MARK: - TeamDetailPresenterInput

