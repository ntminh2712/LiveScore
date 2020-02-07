//
//  ScoresConfig.swift
//  LiveScore
//
//  Created by MinhNT on 8/27/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
protocol ScoresConfiguration {
    func configure(scoresControler: ScoresController)
}
class ScoresConfigurationImplementation:  ScoresConfiguration {
    func configure(scoresControler: ScoresController) {
        
        let router = ScoresRouterImplemetation(scoresController: scoresControler)
        let matchesGateway = ApiMatchesGatewayImplementation()
        let favoritesGateway = ApiFavoritesGatewayImplementation()
        let presenter = ScoresPresenterImplementation(view: scoresControler, router: router, matchesGateway: matchesGateway, favoritesGateway: favoritesGateway)
        scoresControler.presenter = presenter
    }
    
    
}
