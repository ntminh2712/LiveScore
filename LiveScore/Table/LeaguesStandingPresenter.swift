//
//  LeaguesStandingPresenter.swift
//  LiveScore
//
//  Created by MinhNT on 10/14/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
protocol LeaguesStandingView: class {
    func handleError(title: String, content: String)
    func reloadTableView()
}


protocol LeaguesStandingPresenter {
    func viewDidLoad()
    func presentMatchStanding()
    func presentLeaguesStanding()
    var numberOfList:Int {get}
    func getItemOfList(row:Int) -> StandingTableEntity
    func numberOfListPosition(section:Int) -> Int
    func getItemOfListPosition(section:Int, row:Int) -> StandingPositionEntity
}

class LeaguesStandingPresenterImplementation: LeaguesStandingPresenter{
    
    var listStanding:[StandingTableEntity] = []
    var dataTable:StandingDetailEntity?
    fileprivate weak var view: LeaguesStandingView?
    internal let router: LeaguesStandingViewRouter?
    var matchesGateway:MatchesGateway?
    var leaguesGateway: LeaguesGateway?
    init(view: LeaguesStandingView, router: LeaguesStandingViewRouter,matchesGateway:MatchesGateway,leaguesGateway: LeaguesGateway) {
        self.view = view
        self.router = router
        self.matchesGateway = matchesGateway
        self.leaguesGateway = leaguesGateway
    }
    var numberOfList: Int {
        return listStanding.count
    }
    
    func numberOfListPosition(section: Int) -> Int {
        return listStanding[section].data_position.count ?? 0
    }
    
    func getItemOfList(row: Int) -> StandingTableEntity {
        return listStanding[row]
    }
    func getItemOfListPosition(section: Int, row: Int) -> StandingPositionEntity {
        return listStanding[section].data_position[row]
    }
    func viewDidLoad() {
        
        registerNotification()
    }
    func registerNotification(){
        NotificationCenter.default.addObserver(self, selector: #selector(getStandingLeagues(_:)), name: notificationName.getLeaguesStanding.notification, object: nil)
    }
    
    @objc func getStandingLeagues(_ notification: NSNotification){
        if let leaguesId = notification.userInfo?["leaguesId"] as? Int{
            leaguesGateway?.getListStanding(leaguesId: leaguesId
                , completionHandler: { (result) in
                    switch (result) {
                    case let .success(data):
                        if data.status == CodeResponse.success{
                            self.listStanding = data.result?.data_table ?? []
                        }else {
                            self.view?.handleError(title: "Error", content: data.message!)
                        }
                        self.view?.reloadTableView()
                        break
                    case let .failure(error):
                        LoadingHUDControl.sharedManager.hideLoadingHud()
                        self.view?.handleError(title: NSLocalizedString("announce", comment: ""), content: error.localizedDescription)
                        break
                    }
            })
        }
    }
        
        func presentMatchStanding() {
            //        self.router.presentMatchStanding()
        }
        func presentLeaguesStanding(){
            //        self.router.presentLeaguesStanding()
        }
        
}
