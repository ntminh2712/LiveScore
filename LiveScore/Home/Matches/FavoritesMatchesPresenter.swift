//
//  FavoritesMatchesPresenter.swift
//  LiveScore
//
//  Created by MinhNT on 10/28/19.
//  Copyright (c) 2019 MinhNT. All rights reserved.
//

import Foundation

protocol FavoritesMatchesView {
    
    func handleError(title: String, content: String)
    func reloadTableview()
}

protocol FavoritesMatchesPresenter {
    func viewDidLoad()
    var sectionCount: Int {get}
    func getNumberOfSection(section:Int) -> Int
    func getNumberSection(row:Int, section:Int) -> MatchesDetailEntity
    func presentMatchesDetail(matchesId: Int)
    func getItemSection(section:Int)->MatchesLeaguesEntity
    func presentLeaguesDetail(leaguesId:Int)
}

class FavoritesMatchesPresenterImplementation: FavoritesMatchesPresenter {
    
    //MARK: Injections
    fileprivate var view: FavoritesMatchesView
    internal var router: FavoritesMatchesViewRouter
    var favoritesGateway: FavoritesGateway
    //MARK: LifeCycle

    var listFavoritesMatches:[MatchesLeaguesEntity] = []
    
    var sectionCount: Int {
        return listFavoritesMatches.count
    }
    
    func getNumberOfSection(section: Int) -> Int {
        return listFavoritesMatches[section].matches.count
    }
    
    func getNumberSection(row:Int, section:Int) -> MatchesDetailEntity {
        return listFavoritesMatches[section].matches[row]
    }
    
    func getItemSection(section: Int) -> MatchesLeaguesEntity {
        return listFavoritesMatches[section]
    }
    
    init(view: FavoritesMatchesView, router: FavoritesMatchesViewRouter, favoritesGateway: FavoritesGateway) {
        self.view = view
        self.router = router
        self.favoritesGateway = favoritesGateway
    }
    
    func viewDidLoad(){
        registerNotification()
        
    }
    
    func registerNotification(){
        NotificationCenter.default.addObserver(self, selector: #selector(getListFavoritesMatches), name: notificationName.getFavoritesMatches.notification, object: nil)
    }
    
    @objc func getListFavoritesMatches(){
        favoritesGateway.getMatchesFavorites(completionHandler: { (result) in
            switch (result) {
            case let .success(data):
                if data.status == CodeResponse.success{
                    self.listFavoritesMatches = data.result_Matches
                    self.view.reloadTableview()
                }else {
                    self.view.handleError(title: "Error", content: data.message!)
                }
                
                break
                
            case let .failure(error):
                LoadingHUDControl.sharedManager.hideLoadingHud()
                self.view.handleError(title: NSLocalizedString("announce", comment: ""), content: error.localizedDescription)
                break
            }
        })
    }
    
    func presentMatchesDetail(matchesId: Int) {
        self.router.presentMatchesDetail(matchesId: matchesId)
    }
    func presentLeaguesDetail(leaguesId:Int){
        self.router.presentLeaguesDetail(leaguesId: leaguesId)
    }
}

// MARK: - FavoritesMatchesPresenterInput

