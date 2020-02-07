//
//  LeaguesStandingViewRouter.swift
//  LiveScore
//
//  Created by MinhNT on 10/14/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
import UIKit
protocol LeaguesStandingViewRouter {
    //    func presentMatchStanding()
    //    func presentLeaguesStanding()
}

class LeaguesStandingRouterImplemetation: LeaguesStandingViewRouter
{
    fileprivate weak var leaguesStandingController: LeaguesStandingController?
    
    init(leaguesStandingController: LeaguesStandingController) {
        self.leaguesStandingController = leaguesStandingController
    }
    
    //    func presentMatchStanding() {
    //        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    //        let newViewController = storyBoard.instantiateViewController(withIdentifier: "matchStandingController") as! MatchesStandingController
    //        leaguesStandingController!.navigationController?.pushViewController(newViewController, animated: true)
    //    }
    //
    //    func presentLeaguesStanding(){
    //        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    //        let newViewController = storyBoard.instantiateViewController(withIdentifier: "leaguesStandingController") as! LeaguesStandingController
    //
    //        leaguesStandingController!.navigationController?.pushViewController(newViewController, animated: true)
    //    }
    
}
