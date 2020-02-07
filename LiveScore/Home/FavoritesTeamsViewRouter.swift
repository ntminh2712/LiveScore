//
//  FavoritesTeamsViewRouter.swift
//  LiveScore
//
//  Created by MinhNT on 9/5/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
import UIKit
protocol FavoritesTeamsViewRouter {
    func presentTeam(teamId:Int)
    
}

class FavoritesTeamsRouterImplemetation: FavoritesTeamsViewRouter
{
    
    fileprivate weak var favoritesTeamsController: FavoritesTeamsController?
    
    init(favoritesTeamsController: FavoritesTeamsController) {
        self.favoritesTeamsController = favoritesTeamsController
    }
    
    func presentTeam(teamId:Int) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "teamDetailController") as! TeamDetailController
        newViewController.teamId = teamId
        favoritesTeamsController!.navigationController?.pushViewController(newViewController, animated: true)
    }
    
}
