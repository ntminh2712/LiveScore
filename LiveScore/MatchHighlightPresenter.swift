//
//  MatchHighlightPresenter.swift
//  LiveScore
//
//  Created by MinhNT on 11/5/19.
//  Copyright (c) 2019 MinhNT. All rights reserved.
//

import Foundation
import UIKit
protocol MatchHighlightView {
    
    func handleError(title: String, content: String)
    func reloadTableview()
}

protocol MatchHighlightPresenter {
    func viewDidLoad()
    var numberOfList:Int {get}
    func getItemOfList(row:Int) -> HighLightEntity
    func openhighlight(url:String)
}

class MatchHighlightPresenterImplementation: MatchHighlightPresenter {
    
    var listHighLight:[HighLightEntity] = []
    //MARK: Injections
    private var view: MatchHighlightView?
    var router: MatchHighlightViewRouter
//    var Gateway: Gateway?
    //MARK: LifeCycle

    var numberOfList: Int {
        return listHighLight.count
    }
    func getItemOfList(row: Int) -> HighLightEntity {
        return listHighLight[row]
    }
    init(view: MatchHighlightView, router: MatchHighlightViewRouter) {
        self.view = view
        self.router = router
    }
    
    func viewDidLoad(){
        registerNotification()
    }
    func registerNotification(){
        NotificationCenter.default.addObserver(self, selector: #selector(getMatchesHighlight(_:)), name: notificationName.getMatchesHighlight.notification, object: nil)
    }
    
    @objc func getMatchesHighlight(_ notification:NSNotification) {
        if let data = notification.userInfo?["highlight"] as? [HighLightEntity]{
            if data.count != 0 {
                self.listHighLight = data
                self.view?.reloadTableview()
            }
        }
    }
    
    func openhighlight(url: String) {
        guard let url = URL(string: url) else { return }
        UIApplication.shared.open(url)
    }
    
    func presentExample(leaguesId: Int){
//        self.router.presentLeaguesDetail(leaguesId: leaguesId)
    }
}

// MARK: - MatchHighlightPresenterInput

