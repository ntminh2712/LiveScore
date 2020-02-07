//
//  LeaguesTeamsConfig.swift
//  LiveScore
//
//  Created by MinhNT on 10/15/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
protocol LeaguesTeamsConfiguration {
    func configure(leaguesTeamsControler: LeaguesTeamsController)
}
class LeaguesTeamsConfigurationImplementation:  LeaguesTeamsConfiguration {
    func configure(leaguesTeamsControler: LeaguesTeamsController) {
        
        let router = LeaguesTeamsRouterImplemetation(leaguesTeamsController: leaguesTeamsControler)
        let matchesGateway = ApiMatchesGatewayImplementation()
        let leaguesGateway = ApiLeaguesGatewayImplementation()
        let favoritesGateway = ApiFavoritesGatewayImplementation()
        let presenter = LeaguesTeamsPresenterImplementation(view: leaguesTeamsControler, router: router, matchesGateway: matchesGateway, leaguesGateway: leaguesGateway,favoritesGateway: favoritesGateway)
        leaguesTeamsControler.presenter = presenter
    }
    
    
}
