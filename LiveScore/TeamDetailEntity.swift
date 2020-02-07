//
//  TeamDetailEntity.swift
//  LiveScore
//
//  Created by MinhNT on 10/29/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
import ObjectMapper
class TeamDetailEntity: Mappable {
    var team_id: Int?
    var current_season_id: Int?
    var logo_path: String?
    var name: String?
    var favorite: Bool = false
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        team_id <- map["team_id"]
        current_season_id <- map["current_season_id"]
        logo_path <- map["logo_path"]
        name <- map["name"]
        favorite <- map["favorite"]
    }
}
