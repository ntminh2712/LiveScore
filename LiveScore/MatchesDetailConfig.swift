//
//  MatchesDetailConfig.swift
//  LiveScore
//
//  Created by MinhNT on 10/4/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
protocol MatchesDetailConfiguration {
    func configure(matchesDetailControler: MatchesDetailController)
}
class MatchesDetailConfigurationImplementation:  MatchesDetailConfiguration {
    func configure(matchesDetailControler: MatchesDetailController) {
        
        let router = MatchesDetailRouterImplemetation(matchesDetailController: matchesDetailControler)
        let matchesGateway = ApiMatchesGatewayImplementation()
        let presenter = MatchesDetailPresenterImplementation(view: matchesDetailControler, router: router, matchesGateway: matchesGateway)
        matchesDetailControler.presenter = presenter
    }
    
    
}
