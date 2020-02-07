//
//  TeamDetailConfigurator.swift
//  LiveScore
//
//  Created by MinhNT on 10/29/19.
//  Copyright (c) 2019 MinhNT. All rights reserved.
//

import UIKit

protocol TeamDetailConfigurable {
    func configure(viewController: TeamDetailController)
}

class TeamDetailConfigurator: TeamDetailConfigurable {

    //MARK: TeamDetailConfigurable
    func configure(viewController: TeamDetailController) {
    
        let router = TeamDetailRouterImplemetation(viewController: viewController)
        let teamsGateway = ApiTeamGatewayImplementation()
        let favoritesGateway = ApiFavoritesGatewayImplementation()
        let presenter = TeamDetailPresenterImplementation(view:viewController,router: router, teamsGateway: teamsGateway,favoritesGateway:favoritesGateway)
        
        viewController.presenter = presenter

    }
}
