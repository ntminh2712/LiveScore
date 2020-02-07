//
//  FavoritesTeamsConfig.swift
//  LiveScore
//
//  Created by MinhNT on 9/5/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
protocol FavoritesTeamsConfiguration {
    func configure(FavoritesTeamsControler: FavoritesTeamsController)
}
class FavoritesTeamsConfigurationImplementation:  FavoritesTeamsConfiguration {
    func configure(FavoritesTeamsControler: FavoritesTeamsController) {
        
        let router = FavoritesTeamsRouterImplemetation(favoritesTeamsController: FavoritesTeamsControler)
        let favoritesGateway = ApiFavoritesGatewayImplementation()
        let presenter = FavoritesTeamsPresenterImplementation(view: FavoritesTeamsControler, router: router, favoritesGateway: favoritesGateway)
        FavoritesTeamsControler.presenter = presenter
    }
    
    
}
