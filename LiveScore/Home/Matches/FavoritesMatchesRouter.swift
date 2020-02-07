//
//  FavoritesMatchesRouter.swift
//  LiveScore
//
//  Created by MinhNT on 10/28/19.
//  Copyright (c) 2019 MinhNT. All rights reserved.
//

import UIKit

protocol FavoritesMatchesViewRouter{
    func presentMatchesDetail(matchesId:Int)
    func presentLeaguesDetail(leaguesId:Int)
}

class FavoritesMatchesRouterImplemetation : FavoritesMatchesViewRouter{
    
    // MARK: Injections
    weak var viewController: UIViewController?
    
    // MARK: LifeCycle
    required init(viewController: UIViewController) {
        self.viewController = viewController
    }

    func presentMatchesDetail(matchesId:Int){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newExploreController = storyBoard.instantiateViewController(withIdentifier: "matchesDetailController") as! MatchesDetailController
        newExploreController.matchesId = matchesId
        viewController!.navigationController?.pushViewController(newExploreController, animated: true)

    }
    func presentLeaguesDetail(leaguesId:Int){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "leaguesDetailController") as! LeaguesDetailController
        newViewController.leaguesId = leaguesId
        
        viewController!.navigationController?.pushViewController(newViewController, animated: true)
    }
}


