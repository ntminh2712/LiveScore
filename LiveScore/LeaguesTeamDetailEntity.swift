//
//  LeaguesTeamDetailEntity.swift
//  LiveScore
//
//  Created by MinhNT on 10/15/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
import ObjectMapper
class LeaguesTeamDetailEntity: Mappable {
    var team_id: Int?
    var name: String?
    var logo_path: String?
    var current_season_id:Int?
    var favorite:Bool?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        team_id <- map["team_id"]
        name <- map["name"]
        logo_path <- map["logo_path"]
        current_season_id <- map["current_season_id"]
        favorite <- map["favorite"]
    }
}
