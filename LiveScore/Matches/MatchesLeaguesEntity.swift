//
//  MatchesLeaguesEntity.swift
//  LiveScore
//
//  Created by MinhNT on 10/2/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
import ObjectMapper
class MatchesLeaguesEntity: Mappable {
    var league_id: Int?
    var season_id: Int?
    var round_id:Int?
    var stage_id:Int?
    var title_leagues: String?
    var logo_path:String?
    var total_page:Int?
    var matches:[MatchesDetailEntity] = []
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        league_id <- map["league_id"]
        season_id <- map["season_id"]
        round_id <- map["round_id"]
        stage_id <- map["stage_id"]
        title_leagues <- map["title_leagues"]
        logo_path <- map["logo_path"]
        total_page <- map["total_page"]
        matches <- map["matches"]
    }
}
