//
//  ExploreNationalNationalViewRouter.swift
//  LiveScore
//
//  Created by MinhNT on 9/30/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
import UIKit
protocol ExploreNationalViewRouter {
    func presentLeaguesDetail(leaguesId:Int)
}

class ExploreNationalRouterImplemetation: ExploreNationalViewRouter
{
    fileprivate weak var exploreNationalController: ExploreNationalController?
    
    init(exploreNationalController: ExploreNationalController) {
        self.exploreNationalController = exploreNationalController
    }
    

    func presentLeaguesDetail(leaguesId:Int){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newExploreController = storyBoard.instantiateViewController(withIdentifier: "leaguesDetailController") as! LeaguesDetailController
        newExploreController.leaguesId = leaguesId
        exploreNationalController!.navigationController?.pushViewController(newExploreController, animated: true)
    }
    
}
