//
//  TopPlayerPresenter.swift
//  LiveScore
//
//  Created by MinhNT on 10/28/19.
//  Copyright (c) 2019 MinhNT. All rights reserved.
//

import Foundation

protocol TopPlayerView {
    
    func handleError(title: String, content: String)
    func reloadTableview()
}

protocol TopPlayerPresenter {
    func viewDidLoad()
    var numberOfList:Int {get}
    func getDataOfList(row:Int) -> [TopPlayerTypeEntity]
    func getTypeOfList(row: Int) -> String
}

class TopPlayerPresenterImplementation: TopPlayerPresenter {
    //MARK: Injections
    private var view: TopPlayerView?
    var router: TopPlayerViewRouter
    var leaguesGateway: LeaguesGateway?
    //MARK: LifeCycle
    var listTopPlayer:[TopPlayerDetailEntity] = []
    
    var numberOfList:Int {
        return listTopPlayer.count
    }
    
    func getDataOfList(row:Int) -> [TopPlayerTypeEntity] {
        return listTopPlayer[row].data
    }
    
    func getTypeOfList(row: Int) -> String {
        return listTopPlayer[row].name ?? ""
    }

    init(view: TopPlayerView, router: TopPlayerViewRouter,leaguesGateway: LeaguesGateway?) {
        self.view = view
        self.router = router
        self.leaguesGateway = leaguesGateway
    }
    func viewDidLoad(){
        registerNotification()
    }
    
    func registerNotification(){
        NotificationCenter.default.addObserver(self, selector: #selector(getTopPlayerLeagues(_:)), name: notificationName.getTopPlayerLeagues.notification, object: nil)
    }
    
    @objc func getTopPlayerLeagues(_ notification: NSNotification){
        if let season = notification.userInfo? ["season"] as? Int{
            leaguesGateway?.getTopPlayerLeagues(season_id: season, completionHandler: { (result) in
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

// MARK: - TopPlayerPresenterInput

