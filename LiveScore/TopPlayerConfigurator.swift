//
//  TopPlayerConfigurator.swift
//  LiveScore
//
//  Created by MinhNT on 10/28/19.
//  Copyright (c) 2019 MinhNT. All rights reserved.
//

import UIKit

protocol TopPlayerConfigurable {
    func configure(viewController: TopPlayerController)
}

class TopPlayerConfigurator: TopPlayerConfigurable {

    //MARK: TopPlayerConfigurable
    func configure(viewController: TopPlayerController) {
    
        let router = TopPlayerRouterImplemetation(viewController: viewController)
        let leaguesGateway = ApiLeaguesGatewayImplementation()
        let presenter = TopPlayerPresenterImplementation(view:viewController,router: router, leaguesGateway: leaguesGateway)
        
        viewController.presenter = presenter

    }
}
