//
//  TeamsFixturesConfigurator.swift
//  LiveScore
//
//  Created by MinhNT on 11/4/19.
//  Copyright (c) 2019 MinhNT. All rights reserved.
//

import UIKit

protocol TeamsFixturesConfigurable {
    func configure(viewController: TeamsFixturesController)
}

class TeamsFixturesConfigurator: TeamsFixturesConfigurable {

    //MARK: TeamsFixturesConfigurable
    func configure(viewController: TeamsFixturesController) {
    
        let router = TeamsFixturesRouterImplemetation(viewController: viewController)
        let teamGateway = ApiTeamGatewayImplementation()
        let presenter = TeamsFixturesPresenterImplementation(view:viewController,router: router, teamGateway: teamGateway)
        
        viewController.presenter = presenter

    }
}
