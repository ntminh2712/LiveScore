//
//  LeaguesFixtureConfig.swift
//  LiveScore
//
//  Created by MinhNT on 10/14/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
protocol LeaguesFixturesConfiguration {
    func configure(leaguesFixturesControler: LeaguesFixturesController)
}
class LeaguesFixturesConfigurationImplementation:  LeaguesFixturesConfiguration {
    func configure(leaguesFixturesControler: LeaguesFixturesController) {
        
        let router = LeaguesFixturesRouterImplemetation(leaguesFixturesController: leaguesFixturesControler)
        let matchesGateway = ApiMatchesGatewayImplementation()
        let leaguesGateway = ApiLeaguesGatewayImplementation()
        let presenter = LeaguesFixturesPresenterImplementation(view: leaguesFixturesControler, router: router, matchesGateway: matchesGateway, leaguesGateway: leaguesGateway)
        leaguesFixturesControler.presenter = presenter
    }
    
    
}
