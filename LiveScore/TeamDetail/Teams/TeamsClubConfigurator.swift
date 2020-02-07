//
//  TeamsClubConfigurator.swift
//  LiveScore
//
//  Created by MinhNT on 11/5/19.
//  Copyright (c) 2019 MinhNT. All rights reserved.
//

import UIKit

protocol TeamsClubConfigurable {
    func configure(viewController: TeamsClubController)
}

class TeamsClubConfigurator: TeamsClubConfigurable {

    //MARK: TeamsClubConfigurable
    func configure(viewController: TeamsClubController) {
    
        let router = TeamsClubRouterImplemetation(viewController: viewController)
        let teamGateway = ApiTeamGatewayImplementation()
        let presenter = TeamsClubPresenterImplementation(view:viewController,router: router, teamGateway: teamGateway)
        
        viewController.presenter = presenter

    }
}
