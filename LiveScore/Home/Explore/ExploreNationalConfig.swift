//
//  ExploreNationalNationalConfig.swift
//  LiveScore
//
//  Created by MinhNT on 9/30/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
import Foundation
protocol ExploreNationalConfiguration {
    func configure(exploreNationalControler: ExploreNationalController)
}
class ExploreNationalConfigurationImplementation:  ExploreNationalConfiguration {
    func configure(exploreNationalControler: ExploreNationalController) {
        
        let router = ExploreNationalRouterImplemetation(exploreNationalController: exploreNationalControler)
        let exploreGateway = ApiExploreGatewayImplementation()
        let presenter = ExploreNationalPresenterImplementation(view: exploreNationalControler, router: router, exploreGateway: exploreGateway)
        exploreNationalControler.presenter = presenter
    }
    
    
}
