//
//  ExploreConfig.swift
//  LiveScore
//
//  Created by MinhNT on 9/18/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
protocol ExploreConfiguration {
    func configure(exploreControler: ExploreController)
}
class ExploreConfigurationImplementation:  ExploreConfiguration {
    func configure(exploreControler: ExploreController) {
        
        let router = ExploreRouterImplemetation(exploreController: exploreControler)
        let exploreGateway = ApiExploreGatewayImplementation()
        let presenter = ExplorePresenterImplementation(view: exploreControler, router: router, exploreGateway: exploreGateway)
        exploreControler.presenter = presenter
    }
    
    
}
