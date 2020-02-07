//
//  MatchesLineupsPresenter.swift
//  LiveScore
//
//  Created by MinhNT on 11/11/19.
//  Copyright (c) 2019 MinhNT. All rights reserved.
//

import Foundation

protocol MatchesLineupsView {
    
    func handleError(title: String, content: String)
    func reloadTableview()
}

protocol MatchesLineupsPresenter {
    func viewDidLoad()
    func getNumberOfList(section:Int)->Int
    func getItemOfList(section:Int,row: Int) -> TopPlayerTypeEntity
    var numberOfList:Int {get}
    func getItemOfList(section:Int) -> String
}

class MatchesLineupsPresenterImplementation: MatchesLineupsPresenter {
    
    //MARK: Injections
    private var view: MatchesLineupsView?
    var router: MatchesLineupsViewRouter
//    var Gateway: Gateway?
    //MARK: LifeCycle

    init(view: MatchesLineupsView, router: MatchesLineupsViewRouter) {
        self.view = view
        self.router = router
    }
    var listLineups:[MatchesLineupsEntity] = []
    //MARK: Injections
    
    var numberOfList: Int {
        return listLineups.count
    }
    func getItemOfList(section:Int,row: Int) -> TopPlayerTypeEntity {
        return listLineups[section].data[row]
    }
    func getNumberOfList(section: Int) -> Int {
        return listLineups[section].data.count
    }
    func getItemOfList(section: Int) -> String {
        return listLineups[section].name ?? ""
    }
    func viewDidLoad(){
        registerNotification()
    }
    func registerNotification(){
        NotificationCenter.default.addObserver(self, selector: #selector(getMatchesHighlight(_:)), name: notificationName.getMatchesLineups.notification, object: nil)
    }
    
    @objc func getMatchesHighlight(_ notification:NSNotification) {
        if let data = notification.userInfo?["lineups"] as? [MatchesLineupsEntity]{
            if data.count != 0 {
                self.listLineups = data
                self.view?.reloadTableview()
            }
        }
    }
    func presentExample(leaguesId: Int){
//        self.router.presentLeaguesDetail(leaguesId: leaguesId)
    }
}

// MARK: - MatchesLineupsPresenterInput

