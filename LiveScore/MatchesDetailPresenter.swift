//
//  MatchesDetailPresenter.swift
//  LiveScore
//
//  Created by MinhNT on 10/4/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
protocol MatchesDetailView: class {
    func handleError(title: String, content: String)
    func setDataMatches(data:MatchesDetailEntity)
}


protocol MatchesDetailPresenter {
    func viewDidLoad(matchesId:Int)
    func presentMatchDetail()
    func presentLeaguesDetail()
    
}

class MatchesDetailPresenterImplementation: MatchesDetailPresenter{

    fileprivate weak var view: MatchesDetailView?
    internal let router: MatchesDetailViewRouter
    var matchesGateway:MatchesGateway?
    init(view: MatchesDetailView, router: MatchesDetailViewRouter,matchesGateway:MatchesGateway) {
        self.view = view
        self.router = router
        self.matchesGateway = matchesGateway
    }
    func viewDidLoad(matchesId:Int) {
        getDetailMatches(matchesId: matchesId)
    }
    
    func getDetailMatches(matchesId:Int?){
        matchesGateway?.getMatchesDetail(fixture_id:matchesId, completionHandler: { (result) in
            switch result {
            case let .success(data):
                if data.status == CodeResponse.success{
                    self.view?.setDataMatches(data: data.result_matches_detail!)
                    self.pushDataEvents(matches: data.result_matches_detail!,highlight: data.result_matches_detail!.highlights, lineups: data.result_matches_detail!.lineup)
                }else {
                    self.view?.handleError(title: "Error", content: data.message!)
                }
//                self.view?.reloadTableview()
                break
            case let .failure(error):
                LoadingHUDControl.sharedManager.hideLoadingHud()
                self.view?.handleError(title: NSLocalizedString("announce", comment: ""), content: error.localizedDescription)
                break
            }
        })
    }
    
    func pushDataEvents(matches:MatchesDetailEntity,highlight:[HighLightEntity], lineups:[MatchesLineupsEntity]){
        let matches:[String:MatchesDetailEntity] = ["matches":matches]
        let highlight:[String:[HighLightEntity]] = ["highlight":highlight]
        let lineups:[String:[MatchesLineupsEntity]] = ["lineups": lineups]
        NotificationCenter.default.post(name: notificationName.getDataMatches.notification, object: nil, userInfo: matches)
        NotificationCenter.default.post(name: notificationName.getMatchesHighlight.notification, object: nil, userInfo: highlight)
        NotificationCenter.default.post(name: notificationName.getMatchesLineups.notification, object: nil, userInfo: lineups)
    }
    
    func presentMatchDetail() {
        self.router.presentMatchDetail()
    }
    func presentLeaguesDetail(){
        self.router.presentLeaguesDetail()
    }
    
}
