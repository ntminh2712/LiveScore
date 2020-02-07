//
//  TeamsClubPresenter.swift
//  LiveScore
//
//  Created by MinhNT on 11/5/19.
//  Copyright (c) 2019 MinhNT. All rights reserved.
//

import Foundation

protocol TeamsClubView {
    
    func handleError(title: String, content: String)
    func reloadTableview()
}

protocol TeamsClubPresenter {
    func viewDidLoad()
    var numberOfList:Int {get}
    func getItemOfList(row:Int) -> LineupDetailEntity
    func numberOfListPosition(section:Int) -> Int
    func getItemOfListPosition(section:Int, row:Int) -> LineupGoalkeepersEntity
}

class TeamsClubPresenterImplementation: TeamsClubPresenter {
    
    var listLineUp:[LineupDetailEntity] = []
    
    //MARK: Injections
    private var view: TeamsClubView?
    var router: TeamsClubViewRouter
    var teamGateway: TeamsGateway?
    //MARK: LifeCycle

    init(view: TeamsClubView, router: TeamsClubViewRouter,teamGateway: TeamsGateway) {
        self.view = view
        self.router = router
        self.teamGateway = teamGateway
    }
    var numberOfList: Int {
        return listLineUp.count
    }
    
    func numberOfListPosition(section: Int) -> Int {
        return listLineUp[section].data.count
    }
    
    func getItemOfList(row: Int) -> LineupDetailEntity {
        return listLineUp[row]
    }
    
    func getItemOfListPosition(section: Int, row: Int) -> LineupGoalkeepersEntity {
        return listLineUp[section].data[row]
    }
    
    func viewDidLoad(){
        registerNotification()
    }
    func registerNotification(){
        NotificationCenter.default.addObserver(self, selector: #selector(getTeamLineUp(_:)), name: notificationName.getTeamLineup.notification, object: nil)
    }
    
    @objc func getTeamLineUp(_ notification: NSNotification){
        if let teamId = notification.userInfo?["teamId"] as? Int {
            teamGateway?.getTeamLineup(teamId: teamId, completionHandler: { (result) in
                switch (result){
                case let .success(data):
                    if data.status == CodeResponse.success{
                        self.listLineUp = data.result
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

// MARK: - TeamsClubPresenterInput

