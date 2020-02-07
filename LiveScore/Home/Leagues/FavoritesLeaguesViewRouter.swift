//
//  FavoritesLeaguesViewRouter.swift
//  LiveScore
//
//  Created by MinhNT on 9/30/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
import UIKit
protocol FavoritesLeaguesViewRouter {
    func presentMatchDetail()
    func presentLeaguesDetail(leaguesId:Int)
}

class FavoritesLeaguesRouterImplemetation: FavoritesLeaguesViewRouter
{
    fileprivate weak var favoritesLeaguesController: FavoritesLeaguesController?
    
    init(favoritesLeaguesController: FavoritesLeaguesController) {
        self.favoritesLeaguesController = favoritesLeaguesController
    }
    
    func presentMatchDetail() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "matchDetailController") as! MatchesDetailController
        favoritesLeaguesController!.navigationController?.pushViewController(newViewController, animated: true)
    }
    func presentLeaguesDetail(leaguesId:Int){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "leaguesDetailController") as! LeaguesDetailController
        newViewController.leaguesId = leaguesId
        favoritesLeaguesController!.navigationController?.pushViewController(newViewController, animated: true)
    }
    
}
