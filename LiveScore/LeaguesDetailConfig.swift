//
//  LeaguesDetailConfig.swift
//  LiveScore
//
//  Created by MinhNT on 10/4/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
protocol LeaguesDetailConfiguration {
    func configure(leaguesDetailControler: LeaguesDetailController)
}
class LeaguesDetailConfigurationImplementation:  LeaguesDetailConfiguration {
    func configure(leaguesDetailControler: LeaguesDetailController) {
        
        let router = LeaguesDetailRouterImplemetation(leaguesDetailController: leaguesDetailControler)
        let matchesGateway = ApiMatchesGatewayImplementation()
        let leaguesGateway = ApiLeaguesGatewayImplementation()
        let favoritesGateway = ApiFavoritesGatewayImplementation()
        let presenter = LeaguesDetailPresenterImplementation(view: leaguesDetailControler, router: router, matchesGateway: matchesGateway, leaguesGateway: leaguesGateway, favoritesGateway: favoritesGateway)
        leaguesDetailControler.presenter = presenter
    }
    
    
}
