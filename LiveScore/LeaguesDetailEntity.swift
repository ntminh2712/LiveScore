//
//  LeaguesDetailEntity.swift
//  LiveScore
//
//  Created by MinhNT on 10/14/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
import ObjectMapper
class LeaguesDetailEntity: Mappable {
    var league_id: Int?
    var status: Int?
    var popular:Int?
    var world:Int?
    var country_id: Int?
    var logo_path:String?
    var name:String?
    var curent_season_id:Int?
    var country:String?
    var favorite:Bool? = false
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        league_id <- map["league_id"]
        status <- map["status"]
        popular <- map["popular"]
        world <- map["world"]
        country_id <- map["country_id"]
        logo_path <- map["logo_path"]
        name <- map["name"]
        curent_season_id <- map["current_season_id"]
        country <- map["country"]
        favorite <- map["favorite"]
    }
}
