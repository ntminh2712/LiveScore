//
//  ScoresPresenter.swift
//  LiveScore
//
//  Created by MinhNT on 8/27/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation

protocol ScoresView: class {
    func handleError(title: String, content: String)
    func reloadTableView()
    func moveTop()
}


protocol ScoresPresenter {
    func viewDidLoad()
    func presentMatchDetail(matchesId:Int)
    func presentLeaguesDetail(leaguesId:Int)
    func getListMatches(startDate:String, endDate:String, team_id:Int, leagues_id:Int, season_id:Int,include:String)
    var numberOfList:Int {get}
    func getItemOfList(index:Int) -> MatchesLeaguesEntity
    func handlerFavorites(matchesId:Int)
    
    
}

class ScoresPresenterImplementation: ScoresPresenter{
    
    var listMatches: [MatchesLeaguesEntity] = []{
        didSet{
            self.view?.reloadTableView()
        }
    }
    var numberOfList: Int {
        return listMatches.count
    }
    func getItemOfList(index: Int) -> MatchesLeaguesEntity {
        return listMatches[index]
    }
    
    fileprivate weak var view: ScoresView?
    internal let router: ScoresViewRouter
    var matchesGateway:MatchesGateway?
    var favoritesGateway:FavoritesGateway?
    init(view: ScoresView, router: ScoresViewRouter,matchesGateway:MatchesGateway,favoritesGateway:FavoritesGateway) {
        self.view = view
        self.router = router
        self.matchesGateway = matchesGateway
        self.favoritesGateway = favoritesGateway
    }
    func viewDidLoad() {
        NotificationCenter.default.addObserver(self, selector: #selector(setDataScore), name: notificationName.ScoresToday.notification, object: nil)
       getListMatches(startDate: covertDateToString(type: "yyyy-MM-dd", date: Date.today), endDate: covertDateToString(type: "yyyy-MM-dd", date: Date.today), team_id: 0, leagues_id: 0, season_id: 0, include: "")
    }
    
    @objc func setDataScore(_ notification: NSNotification) {
        listMatches = (notification.userInfo?["scores"] as! MatchesEntity).result_list_matches ?? []
//        self.view?.reloadTableView()
    }
    
    func getListMatches(startDate:String, endDate:String, team_id:Int, leagues_id:Int, season_id:Int,include:String){
        LoadingHUDControl.sharedManager.showLoadingHud()
        matchesGateway?.getListMatches(startDate: startDate, endDate: endDate, team_id: team_id, leagues_id: leagues_id, season_id: season_id, include: include, completionHandler: { (result) in
            switch (result) {
            case let .success(data):
                if data.status == CodeResponse.success{
                    self.listMatches = data.result_list_matches ?? []
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        self.view?.reloadTableView()
                        LoadingHUDControl.sharedManager.hideLoadingHud()
                        if self.listMatches.count != 0 {
                            self.view?.moveTop()
                        }
                        
                    }
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
    
    func handlerFavorites(matchesId:Int){
        favoritesGateway?.handlerFavorites(id: matchesId, type: FavoritesType.Matches.rawValue, completionHandler: { (result) in
            switch (result) {
            case let .success(data):
                if data.status == CodeResponse.success{
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
    
    func presentMatchDetail(matchesId:Int) {
        self.router.presentMatchDetail(matchesId: matchesId)
    }
    func presentLeaguesDetail(leaguesId:Int){
        self.router.presentLeaguesDetail(leaguesId:leaguesId)
    }
    
}
