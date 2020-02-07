//
//  ExploreNationalNationalPresenter.swift
//  LiveScore
//
//  Created by MinhNT on 9/30/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation

protocol ExploreNationalView: class {
    func handleError(title: String, content: String)
    func reloadTableView()
    func setNameNational(name:String)
}


protocol ExploreNationalPresenter {
    func viewDidLoad(id:Int)
    func presentLeaguesDetail(leaguesId: Int)
    var numberOfListNational: Int {get}
    func getLeaguesInList(index:Int) -> ExploreLeaguesEntity
}

class ExploreNationalPresenterImplementation: ExploreNationalPresenter{
    func getLeaguesInList(index: Int) -> ExploreLeaguesEntity {
        return list[index]
    }
    
    
    
    
    var list:[ExploreLeaguesEntity] = []
    fileprivate weak var view: ExploreNationalView?
    internal let router: ExploreNationalViewRouter
    var exploreGateway: ExploreGateway?
    
    var numberOfListNational: Int {
        return list.count
    }
    
    init(view: ExploreNationalView, router: ExploreNationalViewRouter, exploreGateway: ExploreGateway) {
        self.view = view
        self.router = router
        self.exploreGateway = exploreGateway
    }
    func viewDidLoad(id:Int) {
        getListNational(id: id)
    }
    func getListNational(id:Int){
        exploreGateway?.getLeaguesNation(popular: 0, country_id: id, completionHandler: { (result) in
            switch (result) {
            case let .success(data):
                if data.status == CodeResponse.success{
                    self.list = data.result
                    self.view?.reloadTableView()
                    self.view?.setNameNational(name: data.result[0].country)
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
    func presentLeaguesDetail(leaguesId: Int){
        self.router.presentLeaguesDetail(leaguesId: leaguesId)
    }
    
}
