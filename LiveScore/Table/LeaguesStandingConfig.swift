//
//  LeaguesStandingConfig.swift
//  LiveScore
//
//  Created by MinhNT on 10/14/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
protocol LeaguesStandingConfiguration {
    func configure(leaguesStandingControler: LeaguesStandingController)
}
class LeaguesStandingConfigurationImplementation:  LeaguesStandingConfiguration {
    func configure(leaguesStandingControler: LeaguesStandingController) {
        
        let router = LeaguesStandingRouterImplemetation(leaguesStandingController: leaguesStandingControler)
        let matchesGateway = ApiMatchesGatewayImplementation()
        let leaguesGateway = ApiLeaguesGatewayImplementation()
        let presenter = LeaguesStandingPresenterImplementation(view: leaguesStandingControler, router: router, matchesGateway: matchesGateway, leaguesGateway: leaguesGateway)
        leaguesStandingControler.presenter = presenter
    }
    
    
}
