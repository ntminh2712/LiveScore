//
//  ExploreGateway.swift
//
//  Created by HOANDHTB on 10/4/18.
//  Copyright © 2018 HOANDHTB. All rights reserved.
//

import Foundation

typealias ExploreGatewayCompletionHandler = (_ explore: Result<ExploreEntity>) -> Void
typealias LeaguesNationGatewayCompletionHandler = (_ explore: Result<ExploreNationalEntity>) -> Void

protocol ExploreGateway {
    func getExplore(completionHandler:@escaping ExploreGatewayCompletionHandler)
    func getLeaguesNation(popular:Int,country_id:Int, completionHandler: @escaping LeaguesNationGatewayCompletionHandler)
}
