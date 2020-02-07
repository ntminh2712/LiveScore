//
//  FavoritesTeamEntity.swift
//  LiveScore
//
//  Created by MinhNT on 10/28/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
import Foundation
import ObjectMapper
class FavoritesTeamEntity: Mappable {
    var team_id: Int?
    var name: String?
    var logo_path: String?
    var current_season_id:Int?
    var favorite: Bool? = false
    
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
