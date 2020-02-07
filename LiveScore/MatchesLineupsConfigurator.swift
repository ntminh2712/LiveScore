//
//  MatchesLineupsConfigurator.swift
//  LiveScore
//
//  Created by MinhNT on 11/11/19.
//  Copyright (c) 2019 MinhNT. All rights reserved.
//

import UIKit

protocol MatchesLineupsConfigurable {
    func configure(viewController: MatchesLineupsViewController)
}

class MatchesLineupsConfigurator: MatchesLineupsConfigurable {

    //MARK: MatchesLineupsConfigurable
    func configure(viewController: MatchesLineupsViewController) {
    
        let router = MatchesLineupsRouterImplemetation(viewController: viewController)
//        let exploreGateway = ApiExploreGatewayImplementation()
        let presenter = MatchesLineupsPresenterImplementation(view:viewController,router: router)
        
        viewController.presenter = presenter

    }
}
