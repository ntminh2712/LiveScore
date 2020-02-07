//
//  LeaguesDetailViewRouter.swift
//  LiveScore
//
//  Created by MinhNT on 10/4/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
import UIKit
protocol LeaguesDetailViewRouter {
    func presentMatchDetail(matchesId:Int)
    func presentLeaguesDetail(leaguesId:Int)
}

class LeaguesDetailRouterImplemetation: LeaguesDetailViewRouter
{
    fileprivate weak var leaguesDetailController: LeaguesDetailController?
    
    init(leaguesDetailController: LeaguesDetailController) {
        self.leaguesDetailController = leaguesDetailController
    }
    
    func presentMatchDetail(matchesId:Int) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "matchesDetailController") as! MatchesDetailController
        newViewController.matchesId = matchesId
        leaguesDetailController!.navigationController?.pushViewController(newViewController, animated: true)
    }
    
    func presentLeaguesDetail(leaguesId:Int){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "leaguesDetailController") as! LeaguesDetailController
        newViewController.leaguesId = leaguesId
        leaguesDetailController!.navigationController?.pushViewController(newViewController, animated: true)
    }
    
}
