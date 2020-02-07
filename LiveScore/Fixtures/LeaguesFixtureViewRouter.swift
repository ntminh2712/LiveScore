//
//  LeaguesFixtureViewRouter.swift
//  LiveScore
//
//  Created by MinhNT on 10/14/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
import UIKit
protocol LeaguesFixturesViewRouter {
    func presentMatchDetail(matchesId:Int)
}

class LeaguesFixturesRouterImplemetation: LeaguesFixturesViewRouter
{
    fileprivate weak var leaguesFixturesController: LeaguesFixturesController?
    
    init(leaguesFixturesController: LeaguesFixturesController) {
        self.leaguesFixturesController = leaguesFixturesController
    }
    
    func presentMatchDetail(matchesId:Int) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "matchesDetailController") as! MatchesDetailController
        newViewController.matchesId = matchesId
        leaguesFixturesController!.navigationController?.pushViewController(newViewController, animated: true)
    }

    
}
