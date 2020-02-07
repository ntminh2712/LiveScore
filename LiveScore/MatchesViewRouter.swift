//
//  MatchesViewRouter.swift
//  LiveScore
//
//  Created by MinhNT on 10/4/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
import UIKit
protocol MatchesDetailViewRouter {
    func presentMatchDetail()
    func presentLeaguesDetail()
}

class MatchesDetailRouterImplemetation: MatchesDetailViewRouter
{
    fileprivate weak var matchesDetailController: MatchesDetailController?
    
    init(matchesDetailController: MatchesDetailController) {
        self.matchesDetailController = matchesDetailController
    }
    
    func presentMatchDetail() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "matchDetailController") as! MatchesDetailController
        matchesDetailController!.navigationController?.pushViewController(newViewController, animated: true)
    }
    
    func presentLeaguesDetail(){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "leaguesDetailController") as! LeaguesDetailController
        
        matchesDetailController!.navigationController?.pushViewController(newViewController, animated: true)
    }
    
}
