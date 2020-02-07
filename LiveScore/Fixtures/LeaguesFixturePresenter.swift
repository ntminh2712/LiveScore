//
//  LeaguesFixturePresenter.swift
//  LiveScore
//
//  Created by MinhNT on 10/14/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
protocol LeaguesFixturesView: class {
    func handleError(title: String, content: String)
    func reloadTableView()
}


protocol LeaguesFixturesPresenter {
    func viewDidLoad()
    func presentMatchDetail(matchesId:Int)
    var numberOfList:Int {get}
    func getItemOfList(row:Int) -> MatchesDetailEntity
    var page:Int{get set}
}

class LeaguesFixturesPresenterImplementation: LeaguesFixturesPresenter{
    
    var listFixtures:[MatchesDetailEntity] = []
    var page: Int = 1 {
        didSet{
            getFixtures(leaguesId: self.leaguesId, page: self.page)
        }
    }
    var leaguesId:Int = 0 {
        didSet{
            getFixtures(leaguesId: self.leaguesId, page: self.page)
        }
    }
    var totalPage:Int = 10
    fileprivate weak var view: LeaguesFixturesView?
    internal let router: LeaguesFixturesViewRouter?
    var matchesGateway:MatchesGateway?
    var leaguesGateway: LeaguesGateway?
    init(view: LeaguesFixturesView, router: LeaguesFixturesViewRouter,matchesGateway:MatchesGateway,leaguesGateway: LeaguesGateway) {
        self.view = view
        self.router = router
        self.matchesGateway = matchesGateway
        self.leaguesGateway = leaguesGateway
    }
    var numberOfList: Int {
        return listFixtures.count
    }
    func getItemOfList(row: Int) ->MatchesDetailEntity {
        return listFixtures[row]
    }
    
    func viewDidLoad() {
        registerNotification()
    }
    func registerNotification(){
        NotificationCenter.default.addObserver(self, selector: #selector(getFixturesLeagues(_:)), name: notificationName.getLeaguesFixtures.notification, object: nil)
    }
    
    
    @objc func getFixturesLeagues(_ notification: NSNotification){
        if let leaguesId = notification.userInfo?["leaguesId"] as? Int{
            getFixtures(leaguesId: leaguesId, page: 1)
        }
    }
    
    func getFixtures(leaguesId:Int,page:Int){
        if page <= totalPage {
            leaguesGateway?.getLeaguesFixtures(leaguesId: leaguesId, page: page
                , completionHandler: { (result) in
                    switch (result) {
                    case let .success(data):
                        if data.status == CodeResponse.success{
                            self.listFixtures += data.result?.matches ?? []
                            self.totalPage = data.result?.total_page ?? 0
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
    
    func presentMatchDetail(matchesId:Int){
        self.router?.presentMatchDetail(matchesId: matchesId)
    }
    
}
