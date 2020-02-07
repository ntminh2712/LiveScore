//
//  TeamsTopPlayerPresenter.swift
//  LiveScore
//
//  Created by MinhNT on 10/30/19.
//  Copyright (c) 2019 MinhNT. All rights reserved.
//

import Foundation

protocol TeamsTopPlayerView {
    
    func handleError(title: String, content: String)
    func reloadTableview()
}

protocol TeamsTopPlayerPresenter {
    func viewDidLoad()
    var numberOfSection:Int{get}
    func getDataOfList(row:Int) -> [TopPlayerTypeEntity]
    func getTypeOfList(row:Int) ->String
}

class TeamsTopPlayerPresenterImplementation: TeamsTopPlayerPresenter {
    
    //MARK: Injections
    private var view: TeamsTopPlayerView?
    var router: TeamsTopPlayerViewRouter
    var teamsGateway: TeamsGateway?
    //MARK: LifeCycle
    var listTopPlayer:[TopPlayerDetailEntity] = []
    
    var numberOfSection:Int {
        return listTopPlayer.count
    }
    
    func getDataOfList(row:Int) -> [TopPlayerTypeEntity] {
        return listTopPlayer[row].data
    }
    
    func getTypeOfList(row: Int) -> String {
        return listTopPlayer[row].name ?? ""
    }
    
    init(view: TeamsTopPlayerView, router: TeamsTopPlayerViewRouter,teamsGateway: TeamsGateway) {
        self.view = view
        self.router = router
        self.teamsGateway = teamsGateway
    }
    func viewDidLoad(){
        registerNotification()
    }
    func registerNotification(){
        NotificationCenter.default.addObserver(self, selector: #selector(getTopPlayer(_:)), name: notificationName.getTopPlayerTeams.notification, object: nil)
    }
    
    @objc  func getTopPlayer(_ notification: NSNotification){
        if let season = notification.userInfo? ["season"] as? Int, let teamId = notification.userInfo? ["teamId"] as? Int{
                teamsGateway?.getTopPlayerTeam(teamId: teamId, seasonId: season, completionHandler: { (result) in
                    switch (result){
                    case let .success(data):
                        if data.status == CodeResponse.success{
                            self.listTopPlayer = data.result
                            self.view?.reloadTableview()
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
        }
        
        func presentExample(leaguesId: Int){
            //        self.router.presentLeaguesDetail(leaguesId: leaguesId)
        }
}

// MARK: - TeamsTopPlayerPresenterInput

