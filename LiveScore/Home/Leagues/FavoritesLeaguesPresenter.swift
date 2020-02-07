//
//  FavoritesLeaguesPresenter.swift
//  LiveScore
//
//  Created by MinhNT on 9/5/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
protocol FavoritesLeaguesView: class {
    func handleError(title: String, content: String)
    func reloadTableView()
}


protocol FavoritesLeaguesPresenter {
    func viewDidLoad()
    func presentMatchDetail()
    var numberOfList: Int {get}
    func presentLeaguesDetail(leaguesId:Int)
    func getNumberOfList(row:Int) -> ExploreLeaguesEntity
}

class FavoritesLeaguesPresenterImplementation: FavoritesLeaguesPresenter{
    var listFavoritesLeagues:[ExploreLeaguesEntity] = []
    
    fileprivate weak var view: FavoritesLeaguesView?
    internal let router: FavoritesLeaguesViewRouter
    var favoritesGateway: FavoritesGateway?
    
    var numberOfList: Int {
        return listFavoritesLeagues.count
    }
    
    func getNumberOfList(row: Int) -> ExploreLeaguesEntity {
        return listFavoritesLeagues[row]
    }
    
    init(view: FavoritesLeaguesView, router: FavoritesLeaguesViewRouter, favoritesGateway: FavoritesGateway) {
        self.view = view
        self.router = router
        self.favoritesGateway = favoritesGateway
    }
    
    
    func viewDidLoad() {
        getListFavoritesLeagues()
        registerNotification()
        
    }
    
    func registerNotification(){
        NotificationCenter.default.addObserver(self, selector: #selector(getListFavoritesLeagues), name: notificationName.getFavoritesLeagues.notification, object: nil)
    }
    
    @objc func getListFavoritesLeagues(){
        favoritesGateway?.getLeaguesFavorites(completionHandler: { (result) in
            switch (result) {
            case let .success(data):
                if data.status == CodeResponse.success{
                    self.listFavoritesLeagues = data.result_leagues
                    self.view?.reloadTableView()
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
    func presentLeaguesDetail(leaguesId: Int) {
        self.router.presentLeaguesDetail(leaguesId: leaguesId)
    }
    func presentMatchDetail() {
        self.router.presentMatchDetail()
    }
    
}
