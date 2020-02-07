//
//  MatchHighlightConfigurator.swift
//  LiveScore
//
//  Created by MinhNT on 11/5/19.
//  Copyright (c) 2019 MinhNT. All rights reserved.
//

import UIKit

protocol MatchHighlightConfigurable {
    func configure(viewController: MatchHighlightController)
}

class MatchHighlightConfigurator: MatchHighlightConfigurable {

    //MARK: MatchHighlightConfigurable
    func configure(viewController: MatchHighlightController) {
    
        let router = MatchHighlightRouterImplemetation(viewController: viewController)
//        let exploreGateway = ApiExploreGatewayImplementation()
        let presenter = MatchHighlightPresenterImplementation(view:viewController,router: router)
        
        viewController.presenter = presenter

    }
}
