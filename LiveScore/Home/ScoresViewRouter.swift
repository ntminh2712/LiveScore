//
//  ScoresViewRouter.swift
//  LiveScore
//
//  Created by MinhNT on 9/5/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
import UIKit
protocol ScoresViewRouter {
    func presentMatchDetail(matchesId:Int)
    func presentLeaguesDetail(leaguesId:Int)
}

class ScoresRouterImplemetation: ScoresViewRouter
{
    fileprivate weak var scoresController: ScoresController?
    
    init(scoresController: ScoresController) {
        self.scoresController = scoresController
    }
    
    func presentMatchDetail(matchesId:Int) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "matchesDetailController") as! MatchesDetailController
        newViewController.matchesId = matchesId
        scoresController!.navigationController?.pushViewController(newViewController, animated: true)
    }
    
    func presentLeaguesDetail(leaguesId:Int){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "leaguesDetailController") as! LeaguesDetailController
        newViewController.leaguesId = leaguesId
        
        scoresController!.navigationController?.pushViewController(newViewController, animated: true)
    }
    
}
