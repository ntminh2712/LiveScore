//
//  TeamsTablePresenter.swift
//  LiveScore
//
//  Created by MinhNT on 11/4/19.
//  Copyright (c) 2019 MinhNT. All rights reserved.
//

import Foundation

protocol TeamsTableView {
    
    func handleError(title: String, content: String)
    func reloadTableview()
}

protocol TeamsTablePresenter {
    func viewDidLoad()
    var numberOfList:Int {get}
    func getItemOfList(row:Int) -> StandingTableEntity
    func numberOfListPosition(section:Int) -> Int
    func getItemOfListPosition(section:Int, row:Int) -> StandingPositionEntity
}

class TeamsTablePresenterImplementation: TeamsTablePresenter {
    
    var listStanding:[StandingTableEntity] = []
    var dataTable:StandingDetailEntity?
    //MARK: Injections
    private var view: TeamsTableView?
    var router: TeamsTableViewRouter
    var teamGateway: TeamsGateway?
//    var Gateway: Gateway?
    //MARK: LifeCycle

    init(view: TeamsTableView, router: TeamsTableViewRouter, teamGateway: TeamsGateway) {
        self.view = view
        self.router = router
        self.teamGateway = teamGateway
    }
    var numberOfList: Int {
        return listStanding.count
    }
    
    func numberOfListPosition(section: Int) -> Int {
        return listStanding[section].data_position.count
    }
    
    func getItemOfList(row: Int) -> StandingTableEntity {
        return listStanding[row]
    }
    
    func getItemOfListPosition(section: Int, row: Int) -> StandingPositionEntity {
        return listStanding[section].data_position[row]
    }
    
    func viewDidLoad(){
        registerNotification()
    }
    func registerNotification(){
        NotificationCenter.default.addObserver(self, selector: #selector(getTeamStanding(_:)), name: notificationName.getTeamStanding.notification, object: nil)
    }
    
    @objc func getTeamStanding(_ notification:NSNotification){
        if let teamId = notification.userInfo?["teamId"] as? Int {
            teamGateway?.getTeamStanding(teamId: teamId, completionHandler: { (result) in
                switch (result) {
                case let .success(data):
                    if data.status == CodeResponse.success{
                        self.listStanding = data.result?.data_table ?? []
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
    
    func presentExample(leaguesId: Int){
//        self.router.presentLeaguesDetail(leaguesId: leaguesId)
    }
}

// MARK: - TeamsTablePresenterInput

