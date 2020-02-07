//
//  LeaguesTeamsViewRouter.swift
//  LiveScore
//
//  Created by MinhNT on 10/15/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
import UIKit
protocol LeaguesTeamsViewRouter {
    func presentTeam(teamId:Int)
}

class LeaguesTeamsRouterImplemetation: LeaguesTeamsViewRouter
{
    fileprivate weak var leaguesTeamsController: LeaguesTeamsController?
    
    init(leaguesTeamsController: LeaguesTeamsController) {
        self.leaguesTeamsController = leaguesTeamsController
    }
    
    func presentTeam(teamId:Int) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "teamDetailController") as! TeamDetailController
        newViewController.teamId = teamId
        leaguesTeamsController!.navigationController?.pushViewController(newViewController, animated: true)
    }
    
}
