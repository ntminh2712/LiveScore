//
//  ExploreControlleswift.swift
//  LiveScore
//
//  Created by MinhNT on 9/18/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
import UIKit
protocol ExploreViewRouter {
    func presentNationDetail(nationalId:Int)
    func presentLeaguesDetail(leaguesId:Int)
}

class ExploreRouterImplemetation: ExploreViewRouter
{
    fileprivate weak var exploreController: ExploreController?
    
    init(exploreController: ExploreController) {
        self.exploreController = exploreController
    }
    
    func presentNationDetail(nationalId:Int) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newExploreController = storyBoard.instantiateViewController(withIdentifier: "exploreNationlController") as! ExploreNationalController
        newExploreController.nationalId = nationalId
        exploreController!.navigationController?.pushViewController(newExploreController, animated: true)
    }
    
    func presentLeaguesDetail(leaguesId:Int){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newExploreController = storyBoard.instantiateViewController(withIdentifier: "leaguesDetailController") as! LeaguesDetailController
       newExploreController.leaguesId = leaguesId
        exploreController!.navigationController?.pushViewController(newExploreController, animated: true)
    }
    
}
