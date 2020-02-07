//
//  FavoritesLeaguesConfig.swift
//  LiveScore
//
//  Created by MinhNT on 9/5/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
protocol FavoritesLeaguesConfiguration {
    func configure(favoritesLeaguesControler: FavoritesLeaguesController)
}
class FavoritesLeaguesConfigurationImplementation:  FavoritesLeaguesConfiguration {
    func configure(favoritesLeaguesControler: FavoritesLeaguesController) {
        
        let router = FavoritesLeaguesRouterImplemetation(favoritesLeaguesController: favoritesLeaguesControler)
        let favoritesGateway = ApiFavoritesGatewayImplementation()
        let presenter = FavoritesLeaguesPresenterImplementation(view: favoritesLeaguesControler, router: router, favoritesGateway: favoritesGateway)
        favoritesLeaguesControler.presenter = presenter
    }
    
    
}
