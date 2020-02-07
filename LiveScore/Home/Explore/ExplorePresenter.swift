//
//  ExplorePresenter.swift
//  LiveScore
//
//  Created by MinhNT on 9/18/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation

protocol ExploreView: class {
    func handleError(title: String, content: String)
    func reloadTableView()
    func setDataSection(dataExplore:ExploreResultEntity)
}


protocol ExplorePresenter {
    func viewDidLoad()
    func presentNationDetail(nationalId:Int)
    func presentLeaguesDetail(leaguesId:Int)
    var socresEntity:ExploreEntity? {get set}
    func getDataExplore() -> ExploreResultEntity?
}

class ExplorePresenterImplementation: ExplorePresenter{
    
    var socresEntity: ExploreEntity?
    fileprivate weak var view: ExploreView?
    internal let router: ExploreViewRouter
    var exploreGateway: ExploreGateway?
    var dataExplore: ExploreResultEntity? {
        didSet {
            self.view?.reloadTableView()
            self.view?.setDataSection(dataExplore: dataExplore!)
        }
    }
    init(view: ExploreView, router: ExploreViewRouter, exploreGateway: ExploreGateway) {
        self.view = view
        self.router = router
        self.exploreGateway = exploreGateway
    }
    
    func viewDidLoad() {
        getListExplore()
    }
    
    
    func getDataExplore() -> ExploreResultEntity? {
        return dataExplore
    }
    
    func getListExplore(){
        exploreGateway?.getExplore(completionHandler: { (result) in
            switch (result) {
            case let .success(data):
                if data.status == CodeResponse.success{
                    self.dataExplore = data.result
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
    func presentNationDetail(nationalId:Int) {
        self.router.presentNationDetail(nationalId: nationalId)
    }
    func presentLeaguesDetail(leaguesId: Int){
        self.router.presentLeaguesDetail(leaguesId: leaguesId)
    }
    
}
