//
//  FavoritesMatchesConfigurator.swift
//  LiveScore
//
//  Created by MinhNT on 10/28/19.
//  Copyright (c) 2019 MinhNT. All rights reserved.
//

import UIKit

protocol FavoritesMatchesConfigurable {
    func configure(viewController: FavoritesMatchesController)
}

class FavoritesMatchesConfigurator: FavoritesMatchesConfigurable {
    
    //MARK: FavoritesMatchesConfigurable
    func configure(viewController: FavoritesMatchesController) {
        
        let router = FavoritesMatchesRouterImplemetation(viewController: viewController)
        let favoritesGateway = ApiFavoritesGatewayImplementation()
        let presenter = FavoritesMatchesPresenterImplementation(view:viewController,router: router, favoritesGateway: favoritesGateway)
        
        viewController.presenter = presenter
        
    }
}
