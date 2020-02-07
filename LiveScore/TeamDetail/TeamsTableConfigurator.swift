//
//  TeamsTableConfigurator.swift
//  LiveScore
//
//  Created by MinhNT on 11/4/19.
//  Copyright (c) 2019 MinhNT. All rights reserved.
//

import UIKit

protocol TeamsTableConfigurable {
    func configure(viewController: TeamsTableController)
}

class TeamsTableConfigurator: TeamsTableConfigurable {

    //MARK: TeamsTableConfigurable
    func configure(viewController: TeamsTableController) {
    
        let router = TeamsTableRouterImplemetation(viewController: viewController)
        let teamGateway = ApiTeamGatewayImplementation()
        let presenter = TeamsTablePresenterImplementation(view:viewController,router: router, teamGateway: teamGateway)
        
        viewController.presenter = presenter

    }
}
