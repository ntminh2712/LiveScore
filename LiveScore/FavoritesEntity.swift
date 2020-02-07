//
//  FavoritesEntity.swift
//  LiveScore
//
//  Created by MinhNT on 9/30/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
import ObjectMapper
class FavoritesEntity: Mappable {
    var status: Int?
    var code: Int?
    var message: String?
    var result_leagues: [ExploreLeaguesEntity] = []
    var result_Teams: [FavoritesTeamEntity] = []
    var result_Matches: [MatchesLeaguesEntity] = []
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        status <- map["status"]
        code <- map["code"]
        message <- map["message"]
        result_leagues <- map["result"]
        result_Teams <- map["result"]
        result_Matches <- map["result"]
    }
}
