//
//  TeamsFixturesRouter.swift
//  LiveScore
//
//  Created by MinhNT on 11/4/19.
//  Copyright (c) 2019 MinhNT. All rights reserved.
//

import UIKit

protocol TeamsFixturesViewRouter{
    func presentMatchDetail(matchesId:Int)
}

class TeamsFixturesRouterImplemetation : TeamsFixturesViewRouter{
    
    // MARK: Injections
    weak var viewController: UIViewController?
    
    // MARK: LifeCycle
    required init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func presentMatchDetail(matchesId:Int) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "matchesDetailController") as! MatchesDetailController
        newViewController.matchesId = matchesId
        viewController!.navigationController?.pushViewController(newViewController, animated: true)
    }
}


