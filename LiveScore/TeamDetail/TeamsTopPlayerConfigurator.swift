//
//  TeamsTopPlayerConfigurator.swift
//  LiveScore
//
//  Created by MinhNT on 10/30/19.
//  Copyright (c) 2019 MinhNT. All rights reserved.
//

import UIKit

protocol TeamsTopPlayerConfigurable {
    func configure(viewController: TeamsTopPlayerController)
}

class TeamsTopPlayerConfigurator: TeamsTopPlayerConfigurable {

    //MARK: TeamsTopPlayerConfigurable
    func configure(viewController: TeamsTopPlayerController) {
    
        let router = TeamsTopPlayerRouterImplemetation(viewController: viewController)
        let teamsGateway = ApiTeamGatewayImplementation()
        let presenter = TeamsTopPlayerPresenterImplementation(view:viewController,router: router, teamsGateway: teamsGateway)
        
        viewController.presenter = presenter

    }
}
