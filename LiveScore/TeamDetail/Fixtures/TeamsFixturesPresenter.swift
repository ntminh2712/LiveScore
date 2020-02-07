//
//  TeamsFixturesPresenter.swift
//  LiveScore
//
//  Created by MinhNT on 11/4/19.
//  Copyright (c) 2019 MinhNT. All rights reserved.
//

import Foundation

protocol TeamsFixturesView {
    func handleError(title: String, content: String)
    func reloadTableview()
}

protocol TeamsFixturesPresenter {
    func viewDidLoad()
    var numberOfList:Int {get}
    func getItemOfList(row:Int) -> MatchesDetailEntity
    func presentMatchDetail(matchesId:Int)
    var page:Int{get set}
}

class TeamsFixturesPresenterImplementation: TeamsFixturesPresenter {
    
    var listFixtures:[MatchesDetailEntity] = []
    var page:Int = 0 {
        didSet{
            getFixtures(teamId:self.teamId, page:self.page)
        }
    }
    var teamId:Int = 0 {
        didSet{
            getFixtures(teamId:self.teamId, page:self.page)
        }
    }
    var totalPage:Int = 10
    //MARK: Injections
    private var view: TeamsFixturesView?
    var router: TeamsFixturesViewRouter
    var teamGateway: TeamsGateway?
//    var Gateway: Gateway?
    //MARK: LifeCycle

    var numberOfList: Int {
        return listFixtures.count
    }
    func getItemOfList(row: Int) ->MatchesDetailEntity {
        return listFixtures[row]
    }
    
    init(view: TeamsFixturesView, router: TeamsFixturesViewRouter, teamGateway: TeamsGateway) {
        self.view = view
        self.router = router
        self.teamGateway = teamGateway
    }
    func viewDidLoad(){
        registerNotification()
    }
    
    func registerNotification(){
        NotificationCenter.default.addObserver(self, selector: #selector(getTeamFixtures(_:)), name: notificationName.getTeamFixtures.notification, object: nil)
    }
    
    
    @objc func getTeamFixtures(_ notification: NSNotification){
        if let teamId = notification.userInfo? ["teamId"] as? Int {
            self.teamId = teamId
        }
        
    }
    func getFixtures(teamId:Int, page:Int){
        if page <= totalPage {
        teamGateway?.getTeamFixture(teamId: teamId, page: page, completionHandler: { (result) in
            switch (result) {
            case let .success(data):
                if data.status == CodeResponse.success{
                    self.listFixtures += data.result 
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
    
    func presentMatchDetail(matchesId:Int){
        self.router.presentMatchDetail(matchesId: matchesId)
    }
}

// MARK: - TeamsFixturesPresenterInput

